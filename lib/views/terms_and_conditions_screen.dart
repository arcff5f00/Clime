import 'package:clime/locale/app_strings.dart';
import 'package:clime/views/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Terms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 31, 31, 31),
      appBar: null,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(27.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 36.0),
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => WelcomeScreen());
                  },
                  child: Image.asset(
                    'assets/images/back_arrow.png',
                    width: 32.0,
                    height: 32.0,
                    fit: BoxFit.cover, // Adjust the BoxFit property as needed
                  ),
                ),
              ),
              SizedBox(height: 28.0),
              Align(
                alignment: Alignment.centerLeft,
                child: ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                      colors: [
                        Color(0xFFFB62E4),
                        Color(0xFF2C65F9),
                      ], // Gradient colors
                      stops: [0.0, 1.0], // Gradient stops
                      tileMode: TileMode.clamp,
                    ).createShader(bounds);
                  },
                  child: Text(
                    AppStrings.termsHead,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                      color: Colors.white, // Text color
                    ),
                  ),
                ),
              ),
              SizedBox(height: 28.0),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppStrings.firstHead,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                    color: Colors.white, // Text color
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppStrings.firstSub,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                    color: Colors.white, // Text color
                  ),
                ),
              ),
              SizedBox(height: 28.0),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppStrings.secondHead,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                    color: Colors.white, // Text color
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppStrings.secondSub,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                    color: Colors.white, // Text color
                  ),
                ),
              ),
              SizedBox(height: 28.0),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppStrings.thirdHead,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                    color: Colors.white, // Text color
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppStrings.thirdSub,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                    color: Colors.white, // Text color
                  ),
                ),
              ),
              SizedBox(height: 28.0),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppStrings.fourthHead,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                    color: Colors.white, // Text color
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppStrings.fourthSub,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                    color: Colors.white, // Text color
                  ),
                ),
              ),
              SizedBox(height: 28.0),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppStrings.fifthHead,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                    color: Colors.white, // Text color
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppStrings.fifthSub,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                    color: Colors.white, // Text color
                  ),
                ),
              ),
              SizedBox(height: 28.0),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppStrings.sixthHead,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                    color: Colors.white, // Text color
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppStrings.sixthSub,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                    color: Colors.white, // Text color
                  ),
                ),
              ),
              SizedBox(height: 28.0),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppStrings.seventhHead,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                    color: Colors.white, // Text color
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppStrings.seventhSub,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                    color: Colors.white, // Text color
                  ),
                ),
              ),
              SizedBox(height: 28.0),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppStrings.eightHead,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                    color: Colors.white, // Text color
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppStrings.eightSub,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                    color: Colors.white, // Text color
                  ),
                ),
              ),
              SizedBox(height: 28.0),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppStrings.nineHead,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                    color: Colors.white, // Text color
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppStrings.nineSub,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                    color: Colors.white, // Text color
                  ),
                ),
              ),
              SizedBox(height: 28.0),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppStrings.tenHead,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                    color: Colors.white, // Text color
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppStrings.tenSub,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                    color: Colors.white, // Text color
                  ),
                ),
              ),
              SizedBox(height: 28.0),
            ],
          ),
        ),
      ),
    );
  }
}
