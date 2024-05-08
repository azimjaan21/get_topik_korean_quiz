import 'package:get_topik_korean_quiz/tools/file_importer.dart';

class MyAppBar extends StatelessWidget {
  final String title;
  const MyAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Text(
          title,
          style: bannerText,
        ),
      ],
    );
  }
}
