import 'package:get_topik_korean_quiz/tools/file_importer.dart';

class ResetTextPassword extends StatelessWidget {
  final Function() onTap;
  const ResetTextPassword({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        'Parolni unutdingizmi?',
        style: resetTextPassword,
      ),
    );
  }
}
