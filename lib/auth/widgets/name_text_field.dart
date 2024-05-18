// ignore: file_names
import 'package:get_topik_korean_quiz/tools/file_importer.dart';

class CustomNameTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;

  const CustomNameTextField(
      {super.key, required this.hintText, required this.controller});

  @override
  State<CustomNameTextField> createState() => _CustomNameTextFieldState();
}

class _CustomNameTextFieldState extends State<CustomNameTextField> {
  late bool _isValid;
  @override
  void initState() {
    _isValid = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.9,
      child: TextField(
        style: fieldText,
        keyboardType: TextInputType.name,
        controller: widget.controller,
        // obscureText: widget.isPassword && !_isVisible,
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
            errorText: _isValid || widget.controller.text.isEmpty
                ? null
                : 'Kamida 4 ta harfdan iborat bo\'lsin!'),
        onChanged: (value) {
          setState(() {
            _isValid = _validateName(value);
          });
        },
      ),
    );
  }

  bool _validateName(String value) {
    return value.length >= 4 && value.length<=20;
  }
}
