import 'package:flutter/material.dart';
import 'package:itv_manager_app/screens/welcome/components/background.dart';
import 'package:itv_manager_app/screens/login/login.dart';
import 'package:itv_manager_app/ultils/constants.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Xin chào quý khách!",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          SizedBox(height: size.height * 0.04),
          Image.asset(
            "assets/icons/chat.png",
            height: size.height * 0.45,
          ),
          SizedBox(height: size.height * 0.04),
          Container(
            width: size.width * 0.8,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(29),
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Login();
                        },
                      ),
                    );
                  },
                  child: Text("ĐĂNG NHẬP"),
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                    foregroundColor: Colors.white,
                    backgroundColor: kBtnBgColor,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
