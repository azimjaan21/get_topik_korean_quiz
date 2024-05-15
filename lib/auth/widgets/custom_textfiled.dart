// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final bool isPassword;
  final TextEditingController controller; // Added controller
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.isPassword,
    required this.controller,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _isValid;

  @override
  void initState() {
    super.initState();
    _isValid = true;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hintText,
        errorText: _isValid ? null : 'Invalid ${widget.hintText}',
      ),
      onChanged: (value) {
        setState(() {
          if (widget.isPassword) {
            _isValid = _validatePassword(value);
          } else {
            _isValid = _validateEmail(value);
          }
        });
      },
      obscureText: widget.isPassword,
    );
  }

  bool _validateEmail(String value) {
    // Simple email validation
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value);
  }

  bool _validatePassword(String value) {
    // Simple password validation, you can add more checks here
    return value.length >= 6;
  }
}
