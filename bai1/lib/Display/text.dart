import 'package:flutter/material.dart';

class Display_Text extends StatelessWidget {
  const Display_Text({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30.0,right: 90),
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);  // Quay lại màn hình trước
                  },
                  icon: Icon(Icons.arrow_back, color: Colors.black, size: 35),
                ),
              ),
            ),
          ),

          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'The',
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'quick',
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.black,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Brown',
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 10), // Khoảng cách giữa các hàng
                // Hàng thứ 2
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'fox',
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'jumps',
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.black,
                        letterSpacing: 5,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'over',
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.black,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 10),
                // Hàng thứ 3
                Padding(
                  padding: const EdgeInsets.only(right: 89.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'the',
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.black,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        'lazy',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        'dog',
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
