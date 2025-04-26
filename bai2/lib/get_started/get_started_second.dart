import 'package:flutter/material.dart';

class Get_Started_Second extends StatelessWidget {
  const Get_Started_Second({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen width and height for responsive design
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Adjust image size based on screen width
        Image.asset('assets/Image/charts.png', height: screenWidth * 0.4), // Responsive height
        SizedBox(height: screenHeight * 0.05), // Responsive spacing

        // Adjust title font size based on screen width
        Text(
          'Increase Work Effectiveness',
          style: TextStyle(
            fontSize: screenWidth * 0.065, // Responsive font size
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: screenHeight * 0.03), // Responsive spacing

        // Adjust subtitle font size and padding based on screen width and height
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Text(
            'Time management and determination \n of more important tasks will give your job \n statistics better and always improve.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: screenWidth * 0.045, // Responsive font size
              color: Colors.black54,
            ),
          ),
        ),
      ],
    );
  }
}
