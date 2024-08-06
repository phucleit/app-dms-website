import 'package:flutter/material.dart';
import 'package:itv_manager_app/ultils/constants.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: kTextFieldBgColor,
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}