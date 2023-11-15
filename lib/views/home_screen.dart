import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;
import '../controllers/home_controller.dart';
import '../widgets/custom_icon_widget.dart';
import '../widgets/custom_widget.dart';
import 'package:clime/locale/app_strings.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController controller = Get.put(HomeController());
  bool isLoading = true; // Add a variable to track loading state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Color.fromARGB(255, 31, 31, 31),
      appBar: null,
      body: isLoading
          ? buildLoadingScreen()
          : buildMainContent(), // Show loading or main content based on the isLoading state
    );
  }

  Widget buildLoadingScreen() {
    // Loading screen UI
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildMainContent() {
    // Main content UI
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(
            left: 32, right: 32, bottom: 32, top: 52),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display the city name
            Text(
              controller.cityName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),

            // Display the formatted date
            SizedBox(height: 13.0),
            Container(
              width: 88,
              height: 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xFFFB62E4),
                    Color(0xFF2C65F9),
                  ],
                ),
              ),
              child: Center(
                child: Text(
                  controller.formattedDate,
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: "Poppins",
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),

            // Display the weather image
            SizedBox(height: 24.0),
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: 136,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color(0xFF282828),
              ),
              child: Stack(
                children: [
                  Positioned(
                    child: Image.asset(
                      controller.weatherImagePath.value,
                      alignment: Alignment.centerLeft,
                    ),
                  ),
                  Positioned(
                    left: 185,
                    bottom: 0,
                    child: Text(
                      '${controller.result}°',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 72,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 185,
                    top: 20,
                    child: Text(
                      controller.description,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),

                  // Display day or night image
                  Padding(
                    padding: EdgeInsets.only(
                        left: math.max(80 + controller.xOffset.value, 0)),
                    child: Image.asset(
                      controller.dORnImagePath.value,
                      width: 180,
                      height: 180,
                      alignment: Alignment.centerLeft,
                    ),
                  ),
                ],
              ),
            ),

            // Display min and max temperature
            SizedBox(height: 24.0),
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: 64,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color(0xFF282828),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Display min temperature
                  Padding(
                    padding: EdgeInsets.only(left: 32, top: 17),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                        children: [
                          TextSpan(
                            text: AppStrings.tempText,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: '\n${AppStrings.min}',
                            style: TextStyle(
                              color: Color(0xFF878787),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 32, top: 20),
                    child: Text(
                      AppStrings.temp,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  VerticalDivider(
                    color: Color(0xFF878787),
                    thickness: 1,
                    width: 90,
                  ),

                  // Display max temperature
                  Padding(
                    padding: EdgeInsets.only(right: 32, top: 20),
                    child: Text(
                      AppStrings.temp,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 32, top: 17),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                        children: [
                          TextSpan(
                            text: AppStrings.tempText,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: '\n   ${AppStrings.max}',
                            style: TextStyle(
                              color: Color(0xFF878787),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Display weather forecast
            SizedBox(height: 24.0),
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: 289,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color(0xFF282828),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 32, top: 32),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                        children: [
                          TextSpan(
                            text: 'Weather Forecast:',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        // Add your CustomCardWidget here
                        CustomCardWidget(),
                        SizedBox(width: 32),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Display weather details
            SizedBox(height: 24.0),
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: 370,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color(0xFF282828),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    left: 32, right: 32, top: 32, bottom: 32),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomIconWidget(
                          imagePath: 'assets/images/pressure.png',
                          text1: '115hpa',
                          text2: AppStrings.pressure,
                        ),
                        SizedBox(width: 72.0),
                        CustomIconWidget(
                          imagePath: 'assets/images/humidity.png',
                          text1: '64%',
                          text2: AppStrings.humidity,
                        ),
                        SizedBox(width: 72.0),
                        CustomIconWidget(
                          imagePath: 'assets/images/visibility.png',
                          text1: '10km',
                          text2: AppStrings.visibility,
                        ),
                      ],
                    ),
                    SizedBox(height: 40.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomIconWidget(
                          imagePath: 'assets/images/wind.png',
                          text1: '2.2km/h',
                          text2: AppStrings.wind,
                        ),
                        SizedBox(width: 72.0),
                        CustomIconWidget(
                          imagePath: 'assets/images/clouds.png',
                          text1: '50%',
                          text2: AppStrings.clouds,
                        ),
                        SizedBox(width: 72.0),
                        CustomIconWidget(
                          imagePath: 'assets/images/rains.png',
                          text1: '3.53mm',
                          text2: AppStrings.rain,
                        ),
                      ],
                    ),
                    SizedBox(height: 40.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomIconWidget(
                          imagePath: 'assets/images/sea_level.png',
                          text1: '1015hpa',
                          text2: AppStrings.seaLevel,
                        ),
                        SizedBox(width: 72.0),
                        CustomIconWidget(
                          imagePath: 'assets/images/ground_level.png',
                          text1: '933hpa',
                          text2: AppStrings.grndLevel,
                        ),
                        SizedBox(width: 44.0),
                        CustomIconWidget(
                          imagePath: 'assets/images/precipitation.png',
                          text1: '0',
                          text2: AppStrings.precipitation,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Display sunrise and sunset
            SizedBox(height: 24.0),
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: 128,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color(0xFF282828),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: 16, top: 20, left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Time',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Poppins',
                            color: Color(0xFFffffff),
                          ),
                        ),
                        Text(
                          AppStrings.sunRise,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Poppins',
                            color: Color(0xFF878787),
                          ),
                        )
                      ],
                    ),
                    SizedBox(width: 20.0),
                    Image.asset(
                      'assets/images/sunrise_sunset.png',
                      alignment: Alignment.center,
                      height: 95,
                      width: 150,
                    ),
                    SizedBox(width: 20.0),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Time',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Poppins',
                            color: Color(0xFFffffff),
                          ),
                        ),
                        Text(
                          AppStrings.sunSet,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Poppins',
                            color: Color(0xFF878787),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    // Simulate a delay of 5 seconds before changing the loading state
    Future.delayed(Duration(seconds: 5), () {
      // After 5 seconds, change the loading state to false
      isLoading = false;
      // Notify Flutter to rebuild the widget tree
      if (mounted) {
        setState(() {});
      }
    });
  }
}
