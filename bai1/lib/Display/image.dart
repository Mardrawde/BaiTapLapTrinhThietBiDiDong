import 'package:flutter/material.dart';

class Display_image extends StatelessWidget {
  const Display_image({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 30.0,right: 90),
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context); // Quay lại màn hình trước
                  },
                  icon: Icon(Icons.arrow_back, color: Colors.black, size: 35),
                ),
              ),
            ),
          ),

          Center(
            child: Image.asset(
              'assets/totoro.png',
              width: 400,
              height: 300,
            ),
          ),
        ],
      ),
    );
  }
}
