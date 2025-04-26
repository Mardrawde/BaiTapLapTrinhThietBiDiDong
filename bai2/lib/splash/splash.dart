import 'package:flutter/material.dart';
import '../get_started/get_started_first.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  void initState() {
    super.initState();
    redirect();        // hàm chuyển qua trang khác
  }

  @override
  Widget build(BuildContext context) {
    // Get screen width and height
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Adjust logo size based on screen size
          Padding(
            padding: EdgeInsets.only(top: screenHeight * 0),
            child: Center(
              child: Image.asset(
                'assets/Image/logo_UTH.png',
                height: screenWidth * 0.3,  // Logo height proportional to screen width
                width: screenWidth * 10,   // Logo width proportional to screen width
              ),
            ),
          ),
          // Adjust text size based on screen size
          Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.02),
            child: Text(
              'UTH SmartTasks',
              style: TextStyle(
                fontSize: screenWidth * 0.09, // Font size proportional to screen width
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }


  Future<void> redirect() async {
    await Future.delayed(const Duration(seconds: 6));
    if (!mounted) return;
    Navigator.pushReplacement(      // pushReplacement
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => const Get_Started_First()));
  }
}
