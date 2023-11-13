import 'package:clime/views/home_screen.dart';
import 'package:clime/views/terms_and_conditions_screen.dart';
import 'package:clime/views/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'controllers/home_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final HomeController controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'), // English
        // Add more locales as needed
      ],
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => WelcomeScreen()),
        GetPage(name: '/home', page: () => HomeScreen()),
        GetPage(name: '/terms', page: () => Terms())
      ],
      home: GetBuilder<HomeController>(
        init: controller..checkWelcomeScreen(), // Initialize and check here
        builder: (controller) {
          return Obx(
            () => controller.showWelcomeScreen.value
                ? WelcomeScreen()
                : HomeScreen(),
          );
        },
      ),
    );
  }
}
