import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_2/screens/profilescreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Future<User?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    return (await FirebaseAuth.instance.signInWithCredential(credential)).user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 100),
            Image.asset('assets/logo_UTH.png', height: 180), // Logo trường
            SizedBox(height: 10),
            Text(
                "SmartTasks",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  color: Colors.blue
                )
            ),
            Text(
              "A simple and efficient to-do app",
              style: TextStyle(
                fontSize: 16,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 100),

            Text(
              "Welcome",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            Text(
              "Ready to explore? Log in to get started.",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 300,
              height: 60,
              child: Container(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[200],
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                  onPressed: () async {
                    User? user = await signInWithGoogle();
                    if (user != null) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => ProfileScreen(user: user)),
                      );
                    }
                  },
                  icon: Image.asset('assets/google.png', height: 50),
                  label: Text(
                      "SIGN IN WITH GOOGLE",
                      style: TextStyle(
                          color: Colors.black,
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
