import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:firebase_2/screens/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  final User user;
  ProfileScreen({required this.user});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  DateTime? selectedDate; // Ngày đã chọn
  final TextEditingController _controller = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _controller.text = DateFormat('dd/MM/yyyy').format(selectedDate!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 30),
            Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(1,1,1,1),
                  decoration: BoxDecoration(
                    color: Colors.blue[500],
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Container(
                    padding: EdgeInsets.only(left: 8),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreen()),
                        );
                      },
                      icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 60),
                  child: Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage(widget.user.photoURL ?? ""),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                  labelText: "Name",
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  )),
              style: TextStyle(
                fontSize: 20,
              ),
              controller: TextEditingController(text: widget.user.displayName),
            ),
            SizedBox(height: 15),
            TextField(
              decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25)),
              style: TextStyle(
                fontSize: 20,
              ),
              controller: TextEditingController(text: widget.user.email),
              readOnly: true,
            ),
            SizedBox(height: 15),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Date of Birth",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Date of Birth',
                suffixIcon: IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: () => _selectDate(context),
                ),
              ),
              readOnly: true,
            ),
            SizedBox(height: 70),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[500],
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    ),
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Back",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
