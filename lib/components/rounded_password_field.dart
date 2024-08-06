import 'package:flutter/material.dart';
import 'package:itv_manager_app/components/text_field_container.dart';

class RoundedPasswordField extends StatefulWidget {
  final String hintText;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;

  const RoundedPasswordField({
    super.key,
    required this.hintText,
    required this.onChanged,
    required this.controller,
  });

  @override
  _RoundedPasswordFieldState createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool _isObscured = true;

  void _togglePasswordView() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: widget.controller,
        obscureText: _isObscured,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          hintText: widget.hintText,
          icon: Icon(
            Icons.lock,
            color: Colors.black,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _isObscured ? Icons.visibility : Icons.visibility_off,
              color: Colors.black,
            ),
            onPressed: _togglePasswordView,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
