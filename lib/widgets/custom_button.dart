// custom_button.dart

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final String? imagePath; // Add this line

  const CustomButton({
    required this.onPressed,
    required this.buttonText,
    this.imagePath, // Add this line
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160.0,
      height: 64.0,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),
          primary: Colors.transparent,
          padding: EdgeInsets.zero,
        ),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32.0),
            gradient: LinearGradient(
              colors: [
                Color(0xFFFB62E4),
                Color(0xFF2C65F9),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: Container(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  buttonText,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (imagePath != null)
                  Image.asset(
                    imagePath!, width: 36, // Specify the desired width
                    height: 36,
                  ),
                SizedBox(width: imagePath != null ? 12.0 : 0),
                // Adjust spacing as needed
              ],
            ),
          ),
        ),
      ),
    );
  }
}
