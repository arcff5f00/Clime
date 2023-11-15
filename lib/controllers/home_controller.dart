import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:sensors_plus/sensors_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/weather_model.dart';

class HomeController extends GetxController {
  RxBool showWelcomeScreen = true.obs;
  RxDouble xOffset = 0.0.obs;
  RxDouble yOffset = 0.0.obs;
  String cityName = '';
  String description = '';
  RxString weatherImagePath = RxString('');
  RxString dORnImagePath = RxString('');
  double currentTemperature = 0.0;
  double currentTemperaturecelsius = 0.0;
  String currentTemperatureString = '';
  String result = '';

  String formattedDate = '';
  String apiKey = '8859a6240421316844bcb6dba14d8e6a';
  double latitude = 0.0;
  double longitude = 0.0;

  Rx<WeatherModel?> weatherData = Rx<WeatherModel?>(null);

  String formatDate(DateTime dateTime) {
    final formatter = DateFormat('dd MMM yyyy');
    return formatter.format(dateTime);
  }

  Position position = Position(
    latitude: 0.0,
    longitude: 0.0,
    timestamp: null,
    accuracy: 0.0,
    altitude: 0.0,
    heading: 0.0,
    speed: 0.0,
    speedAccuracy: 0.0,
  );

  @override
  Future<void> onInit() async {
    super.onInit();
    checkWelcomeScreen();
    initializeAccelerometer();
    loadOffsets(); // Load saved offsets during initialization
    await fetchCurrentLocation();

    formattedDate = formatDate(position.timestamp!.toLocal());

    await fetchWeatherData(position.latitude, position.longitude, apiKey);
  }

  void initializeAccelerometer() {
    accelerometerEvents.listen((AccelerometerEvent event) {
      double sensitivity = 5.0;
      xOffset.value = event.x * sensitivity;
      yOffset.value = event.y * sensitivity;
      saveOffsets(); // Save the current offsets on each accelerometer update
      update();
    });
  }

  Future<void> goToHomeScreen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('showWelcomeScreen', false);
    showWelcomeScreen.value = false;
  }

  Future<void> checkWelcomeScreen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool showWelcome = prefs.getBool('showWelcomeScreen') ?? true;
    showWelcomeScreen.value = showWelcome;
  }

  // Save current xOffset and yOffset values to SharedPreferences
  Future<void> saveOffsets() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('xOffset', xOffset.value);
    await prefs.setDouble('yOffset', yOffset.value);
  }

  // Load saved xOffset and yOffset values from SharedPreferences
  Future<void> loadOffsets() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    xOffset.value = prefs.getDouble('xOffset') ?? 0.0;
    yOffset.value = prefs.getDouble('yOffset') ?? 0.0;
    update();
  }

  Future<void> fetchCurrentLocation() async {
    try {
      position = await getCurrentLocation();
      update();
    } catch (e) {
      print('Error fetching location: $e');
    }
  }

  //Fetching lon and lat

  Future<Position> getCurrentLocation() async {
    try {
      return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
    } catch (e) {
      print('Error getting location: $e');
      // Handle the error, for example, show a message to the user
      return Position(
        latitude: 0.0,
        longitude: 0.0,
        timestamp: null,
        accuracy: 0.0,
        altitude: 0.0,
        heading: 0.0,
        speed: 0.0,
        speedAccuracy: 0.0,
      );
    }
  }

//Fetching data from api here
  Future<void> fetchWeatherData(double lat, double lon, String apiKey) async {
    try {
      // Build the API URL
      String apiUrl =
          'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey';

      // Make the API request
      http.Response response = await http.get(Uri.parse(apiUrl));

      // Check if the request was successful (status code 200)
      if (response.statusCode == 200) {
        // Parse the JSON response using the WeatherModel
        WeatherModel data = WeatherModel.fromJson(json.decode(response.body));
        print('Parsed Data: $data');
        print('API Response: ${response.body}');
        // Update the Rx variable
        weatherData.value = data;

        // Now you can use the weatherData object to access the weather information
        // For example:
        cityName = data.cityName;
        description = data.description;
        weatherImagePath.value = getWeatherImage(data.iconCode);
        dORnImagePath.value = getDayONightImage(data.iconCode);
        currentTemperature = data.temperature;

        currentTemperaturecelsius = (currentTemperature - 273.15);


        currentTemperatureString = currentTemperaturecelsius.toString();
        result = currentTemperatureString.substring(0, currentTemperatureString.indexOf('.'));
        // Update the UI or perform any other actions as needed
      } else {
        print('Error fetching weather data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching weather data: $e');
    }
  }

  String getWeatherImage(String iconCode) {
    switch (iconCode) {
      case '01d': // clear sky day
        return 'assets/images/clear_sky.png';
      case '01n': // clear sky night
        return 'assets/images/clear_sky.png';
      case '02d': // few clouds day
        return 'assets/images/few_clouds.png';
      case '02n': // few clouds night
        return 'assets/images/few_clouds.png';
      case '03d': // scattered clouds day
        return 'assets/images/scattered_clouds.png';
      case '03n': // scattered clouds night
        return 'assets/images/scattered_clouds.png';
      case '04d': // broken clouds day
        return 'assets/images/broken_clouds.png';
      case '04n': // broken clouds night
        return 'assets/images/broken_clouds.png';
      case '09d': // shower rain day
      case '10d': // rain day
        return 'assets/images/rain.png';
      case '09n': // shower rain night
      case '10n': // rain night
        return 'assets/images/rain.png';
      case '11d': // thunderstorm day
      case '11n': // thunderstorm night
        return 'assets/images/thunderstorm.png';
      case '13d': // snow day
      case '13n': // snow night
        return 'assets/images/snow.png';
      case '50d': // mist day
      case '50n': // mist night
        return 'assets/images/mist.png';
      default:
        return ''; // You can provide a default image or handle it differently
    }
  }

  String getDayONightImage(String iconCode) {
    switch (iconCode) {
      case '01d': // clear sky day
        return 'assets/images/day.png';
      case '01n': // clear sky night
        return 'assets/images/night.png';
      case '02d': // few clouds day
        return 'assets/images/day.png';
      case '02n': // few clouds night
        return 'assets/images/night.png';
      case '03d': // scattered clouds day
        return 'assets/images/day.png';
      case '03n': // scattered clouds night
        return 'assets/images/night.png';
      case '04d': // broken clouds day
        return 'assets/images/day.png';
      case '04n': // broken clouds night
        return 'assets/images/night.png';
      case '09d': // shower rain day
        return 'assets/images/day.png';
      case '10d': // rain day
        return 'assets/images/day.png';
      case '09n': // shower rain night
        return 'assets/images/night.png';
      case '10n': // rain night
        return 'assets/images/night.png';
      case '11d': // thunderstorm day
        return 'assets/images/day.png';
      case '11n': // thunderstorm night
        return 'assets/images/night.png';
      case '13d': // snow day
        return 'assets/images/day.png';
      case '13n': // snow night
        return 'assets/images/night.png';
      case '50d': // mist day
        return 'assets/images/day.png';
      case '50n': // mist night
        return 'assets/images/night.png';
      default:
        return ''; // You can provide a default image or handle it differently
    }
  }
}
