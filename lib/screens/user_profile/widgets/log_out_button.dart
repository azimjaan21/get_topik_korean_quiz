import 'package:get_topik_korean_quiz/tools/file_importer.dart';

class LogOutButton extends StatelessWidget {
  final String text;
  final Function() ontap;

  const LogOutButton({super.key, required this.text, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      borderRadius: BorderRadius.circular(12.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.55,
        decoration: BoxDecoration(
          color: AppColors.logButton,
          borderRadius: BorderRadiusDirectional.circular(12.0),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              text,
              style: logButtonText,
            ),
          ),
        ),
      ),
    );
  }
}
