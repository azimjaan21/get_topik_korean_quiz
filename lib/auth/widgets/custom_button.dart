import 'package:get_topik_korean_quiz/tools/file_importer.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function() ontap;
  const CustomButton({super.key, required this.text, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.75,
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.gettopikColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(189, 189, 189, 1),
              offset: Offset(4.0, 4.0),
              blurRadius: 10.0,
              spreadRadius: 1.0,
            ),
            BoxShadow(
              color: Colors.white,
              offset: Offset(-4.0, -4.0),
              blurRadius: 10.0,
              spreadRadius: 1.0,
            ),
          ],
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
