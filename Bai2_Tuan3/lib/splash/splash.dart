import 'package:flutter/material.dart';
import '../screen_main/get_started_first.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    redirect();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/logo.png',
                  width: 220,
                ),
                const SizedBox(height: 20),
                const Text(
                  'UTH SmartTasks',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Future<void> redirect() async{
    await Future.delayed(const Duration(seconds: 3));
    if (!mounted) return;//use_build_context_synchronously
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => const ScreenFirst())
    );
  }


}