import 'package:flutter/material.dart';
import 'package:itv_manager_app/components/text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    super.key,
    required this.controller,
    required this.hintText,
    this.icon = Icons.person,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(
            icon ,
            color: Colors.black
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      )
    );
  }
}
