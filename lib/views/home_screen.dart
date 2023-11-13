import 'package:clime/locale/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

import '../controllers/home_controller.dart';

class HomeScreen extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Color.fromARGB(255, 31, 31, 31),
      appBar: null,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 21.0),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppStrings.cityName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 13.0),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
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
                      AppStrings.date,
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: "Poppins",
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24.0),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 136,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0xFF282828),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      child: Image.asset(
                        'assets/images/rain.png',
                        alignment: Alignment.centerLeft,
                      ),
                    ),
                    Positioned(
                      left: 185,
                      bottom: 0,
                      child: Text(
                        AppStrings.temp,
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
                        AppStrings.climate,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: math.max(80 + controller.xOffset.value, 0)),
                      child: Image.asset(
                        'assets/images/night.png',
                        width: 180,
                        height: 180,
                        alignment: Alignment.centerLeft,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.0),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 64,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color(0xFF282828),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                        width: 90, // Adjust the width of the divider
                      ),
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
              ),
              SizedBox(height: 24.0),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: MediaQuery.of(context).size.width,
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
                                text: AppStrings.weath1,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(
                                text: AppStrings.weath2,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
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
                            Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 32.0, top: 16),
                                  width: 72.0,
                                  height: 157.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(36.0),
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color(0xFFFF7D3D),
                                        Color(0xFFFF3635),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 32, top: 8),
                                  child: Text(
                                    AppStrings.shortDate,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 8,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(left: 32, top: 0),
                                    child: Text(
                                      AppStrings.time,
                                      style: TextStyle(
                                          color: Color(0xFF878787),
                                          fontSize: 8,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400),
                                    ))
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 32.0, top: 16),
                                  width: 72.0,
                                  height: 157.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(36.0),
                                      color: Color(0xFF606060)),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 32, top: 8),
                                  child: Text(
                                    AppStrings.shortDate,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 8,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 32, top: 0),
                                  child: Text(
                                    AppStrings.time,
                                    style: TextStyle(
                                        color: Color(0xFF878787),
                                        fontSize: 8,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 32.0, top: 16),
                                  width: 72.0,
                                  height: 157.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(36.0),
                                      color: Color(0xFF606060)),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 32, top: 8),
                                  child: Text(
                                    AppStrings.shortDate,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 8,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 32, top: 0),
                                  child: Text(
                                    AppStrings.time,
                                    style: TextStyle(
                                        color: Color(0xFF878787),
                                        fontSize: 8,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 32.0, top: 16),
                                  width: 72.0,
                                  height: 157.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(36.0),
                                      color: Color(0xFF606060)),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 32, top: 8),
                                  child: Text(
                                    AppStrings.shortDate,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 8,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 32, top: 0),
                                  child: Text(
                                    AppStrings.time,
                                    style: TextStyle(
                                        color: Color(0xFF878787),
                                        fontSize: 8,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 32.0, top: 16),
                                  width: 72.0,
                                  height: 157.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(36.0),
                                      color: Color(0xFF606060)),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 32, top: 8),
                                  child: Text(
                                    AppStrings.shortDate,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 8,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 32, top: 0),
                                  child: Text(
                                    AppStrings.time,
                                    style: TextStyle(
                                        color: Color(0xFF878787),
                                        fontSize: 8,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 32.0, top: 16),
                                  width: 72.0,
                                  height: 157.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(36.0),
                                      color: Color(0xFF606060)),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 32, top: 8),
                                  child: Text(
                                    AppStrings.shortDate,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 8,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 32, top: 0),
                                  child: Text(
                                    AppStrings.time,
                                    style: TextStyle(
                                        color: Color(0xFF878787),
                                        fontSize: 8,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
