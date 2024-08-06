import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:itv_manager_app/components/rounded_input_field.dart';
import 'package:itv_manager_app/components/rounded_password_field_2.dart';
import 'package:itv_manager_app/screens/home/home.dart';
import 'package:itv_manager_app/screens/login/components/background.dart';
import 'package:itv_manager_app/ultils/constants.dart';

class Body extends StatefulWidget {
  const Body({
    super.key,
  });

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (_usernameController.text.isEmpty || _passwordController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Đăng nhập không thành công!'),
          content: Text('Tài khoản hoặc mật khẩu không được để trống!'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    final response = await http.post(
      Uri.parse('https://backend.thietkewebvungtau.com/v1/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': _usernameController.text,
        'password': _passwordController.text,
      }),
    );

    setState(() {
      _isLoading = false;
    });

    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Home(),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Đăng nhập không thành công!'),
          content:
              Text('Tài khoản hoặc mật khẩu không đúng! Vui lòng nhập lại!'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "THÔNG TIN ĐĂNG NHẬP",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          SizedBox(height: size.height * 0.04),
          Image.asset(
            "assets/icons/login.png",
            height: size.height * 0.30,
          ),
          SizedBox(height: size.height * 0.04),
          RoundedInputField(
            hintText: "Tên đăng nhập...",
            onChanged: (value) {},
            controller: _usernameController,
          ),
          SizedBox(height: size.height * 0.02),
          RoundedPasswordField(
            hintText: "Mật khẩu...",
            onChanged: (value) {},
            controller: _passwordController,
          ),
          SizedBox(height: size.height * 0.02),
          Container(
            width: size.width * 0.8,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(29),
              child: _isLoading
                  ? CircularProgressIndicator()
                  : TextButton(
                      onPressed: _login,
                      child: Text("ĐĂNG NHẬP"),
                      style: TextButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                        foregroundColor: Colors.white,
                        backgroundColor: kBtnBgColor,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
