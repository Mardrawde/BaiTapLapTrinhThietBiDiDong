import 'package:flutter/material.dart';

class Input_TextField extends StatelessWidget {
  const Input_TextField({super.key});

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

          Padding(
            padding: const EdgeInsets.fromLTRB(20,100,30,0),
            child: TextField(
              decoration: InputDecoration(
                label: Text("Enter your name",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
