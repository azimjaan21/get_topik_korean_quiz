import 'package:get_topik_korean_quiz/tools/file_importer.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text(
          "초급 1",
          style: bannerText,
        ),
      ],
    );
  }
}
