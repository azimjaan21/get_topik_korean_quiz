// ignore_for_file: library_private_types_in_public_api

import 'package:get_topik_korean_quiz/tools/file_importer.dart';

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
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.9,
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        controller: widget.controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: AppColors.topBarColor,
                width: 10,
                style: BorderStyle.none
              ),),
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
      ),
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
