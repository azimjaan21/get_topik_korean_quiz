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
        width: MediaQuery.sizeOf(context).width * 0.7,
        height: 40,
        decoration: BoxDecoration(
          color: AppColors.gettopikColor,
        ),
        child: Text(
          text,
          style: cardText,
        ),
      ),
    );
  }
}
