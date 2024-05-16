// ignore_for_file: library_private_types_in_public_api

import 'package:get_topik_korean_quiz/tools/file_importer.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final bool isPassword;

  final TextEditingController controller; 
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
  late bool _isVisible;

  @override
  void initState() {
    super.initState();

    _isValid = true;
    _isVisible = !widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.9,
      child: TextField(
        style: fieldText,
        keyboardType: TextInputType.emailAddress,
        controller: widget.controller,
        obscureText: widget.isPassword && !_isVisible,
        decoration: InputDecoration(
          hintStyle: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.butColor, width: 2),
          ),
          hintText: widget.hintText,
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    color: AppColors.suffixIconColor,
                    _isVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isVisible = !_isVisible;
                    });
                  },
                )
              : null,
          errorText: _isValid || widget.controller.text.isEmpty
              ? null
              : widget.isPassword
                  ? 'Kamida 6 ta belgidan iborat bo\'lsin!'
                  : ' ${widget.hintText}ni to\'gri kiriting!',
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
