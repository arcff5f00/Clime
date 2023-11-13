import 'package:clime/views/terms_and_conditions_screen.dart';
import 'package:clime/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../locale/app_strings.dart';

class WelcomeScreen extends StatelessWidget {
  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    //above code will remove status bar
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 31, 31, 31),
      appBar: null,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/clime_logo.png',
                width: 215.0,
                height: 215.0,
                fit: BoxFit.cover, // Adjust the BoxFit property as needed
              ),
              SizedBox(height: 24.0),
              Text(
                AppStrings.clime,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 32.0,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600),
              ),
              Text(
                AppStrings.climeSub,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 80.0),
              CustomButton(
                onPressed: () async {
                  await controller.goToHomeScreen();
                  Get.offAllNamed('/home');
                },
                buttonText: AppStrings.letsGo,
                imagePath: 'assets/images/button_arrow.png',
              ),
              SizedBox(height: 16.0),
              GestureDetector(
                onTap: () {
                  Get.to(() => Terms());
                },
                child: Text(
                  AppStrings.terms,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.0,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
