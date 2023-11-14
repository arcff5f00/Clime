import 'package:flutter/material.dart';
import '../locale/app_strings.dart';

class CustomCardWidget extends StatefulWidget {
  @override
  _CustomCardWidgetState createState() => _CustomCardWidgetState();
}

class _CustomCardWidgetState extends State<CustomCardWidget> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Column(
        children: [
          CustomContainer(isSelected: isSelected),
          Padding(
            padding: EdgeInsets.only(left: 32, top: 8),
            child: Text(
              AppStrings.shortDate,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
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
                  fontSize: 10,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  final bool isSelected;

  CustomContainer({required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 32.0, top: 16),
      width: 72.0,
      height: 157.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(36.0),
        color: isSelected
            ? null // Set to null to make the gradient visible
            : Color(0xFF606060),
        gradient: isSelected
            ? LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xC0FF7D3D),
                  Color(0xFFFF3635),
                ],
              )
            : null,
      ),
      child: Column(
        // Wrap with Column
        children: [
          Image.asset(
            'assets/images/clear_sky.png',
            alignment: Alignment.center,
          ),
          Text(
            AppStrings.climate,
            style: TextStyle(
              color: Colors.white,
              fontSize: 7,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w400,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5),
            child: Divider(
              color: Color(0xFFd9d9d9),
              thickness: 1,
            ),
          ),
          Padding(padding: EdgeInsets.only(left: 10),
          child: Text(
            AppStrings.temp,
            style: TextStyle(
              color: Colors.white,
              fontSize: 27,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w400,
            ),
          ),
          ),
        ],
      ),
    );
  }
}
