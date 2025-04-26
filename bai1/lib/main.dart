import 'package:flutter/material.dart';
import 'components.dart';

void main() => runApp(  MaterialApp(
  home: bai1(),
  debugShowCheckedModeBanner: false,
));

class bai1 extends StatelessWidget {
  const bai1({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset('assets/logo.png'),

            SizedBox(height: 30),
            Text(
              "Jetpack Compose",
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 30),
            Text(
              "Jetpack Compose is a modern UI toolkit for \n  building native Android applications using \n a declarative programming approach.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),


            const Spacer(),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(16.0),        // Khoảng cách xung quanh button
              child: SizedBox(
                width: 350,
                height: 50,
                // button
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Components()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),        // Bo góc
                    ),
                  ),
                  child: Text(
                    "I'm ready",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
          ],
        )
      ),
    );
  }
}
