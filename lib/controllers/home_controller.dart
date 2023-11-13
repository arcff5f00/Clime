import 'package:get/get.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  RxBool showWelcomeScreen = true.obs;
  RxDouble xOffset = 0.0.obs;
  RxDouble yOffset = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    checkWelcomeScreen();
    initializeAccelerometer();
    loadOffsets(); // Load saved offsets during initialization
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

  Future<void>checkWelcomeScreen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool showWelcome = prefs.getBool('showWelcomeScreen') ?? true;
    showWelcomeScreen.value = showWelcome;
  }

  // Save current xOffset and yOffset values to SharedPreferences
  Future<void>saveOffsets() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('xOffset', xOffset.value);
    await prefs.setDouble('yOffset', yOffset.value);
  }

  // Load saved xOffset and yOffset values from SharedPreferences
  Future<void>loadOffsets() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    xOffset.value = prefs.getDouble('xOffset') ?? 0.0;
    yOffset.value = prefs.getDouble('yOffset') ?? 0.0;
    update();
  }
}

// The rest of your code remains unchanged...
