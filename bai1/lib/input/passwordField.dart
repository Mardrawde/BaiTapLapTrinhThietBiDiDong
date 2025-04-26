import 'package:flutter/material.dart';


class Input_PasswordField extends StatefulWidget {
  @override
  _Input_PasswordFieldState createState() => _Input_PasswordFieldState();
}

class _Input_PasswordFieldState extends State<Input_PasswordField> {
  bool _isObscure = true; // ẩn/hiện mật khẩu
  final TextEditingController _controller = TextEditingController(); // Controller để lấy dữ liệu

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
              controller: _controller,
              obscureText: _isObscure, // Ẩn/hiện ký tự
              decoration: InputDecoration(
                label: Text("Enter your password",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
                ),
                suffixIcon: IconButton(
                  onPressed: (){
                    setState(() {
                      _isObscure = !_isObscure; // Đảo ngược trạng thái ẩn/hiện  => _isObscure = false hiện mật khẩu
                    });
                  },
                  icon: Icon(
                    _isObscure ? Icons.visibility_off : Icons.visibility, // Icon thay đổi
                    size: 30,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
