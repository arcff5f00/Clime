import 'package:flutter/material.dart';

class CustomIconWidget extends StatelessWidget {
  final String imagePath;
  final String text1;
  final String text2;

  CustomIconWidget(
      {required this.imagePath, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.asset(
            imagePath,
            height: 40, // Adjust the height as needed
            width: 40, // Adjust the width as needed
          ),
          SizedBox(height: 5), // Adjust the spacing between image and text
          Text(
            text1,
            style: TextStyle(
                fontSize: 8.5,
                fontWeight: FontWeight.w400,
                fontFamily: 'Poppins',
                color: Colors.white),
          ),
          Text(
            text2,
            style: TextStyle(
              fontSize: 8.5,
              fontWeight: FontWeight.w400,
              fontFamily: 'Poppins',
              color: Color(0xFF878787),
            ),
          ),
        ],
      ),
    );
  }
}
