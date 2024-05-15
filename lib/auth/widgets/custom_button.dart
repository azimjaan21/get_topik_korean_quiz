import 'package:get_topik_korean_quiz/tools/file_importer.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function() ontap;
  final Color buttonColor;
  const CustomButton(
      {super.key,
      required this.text,
      required this.ontap,
      required this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.75,
        height: 50,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: loginText,
          ),
        ),
      ),
    );
  }
}
