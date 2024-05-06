import 'package:get_topik_korean_quiz/tools/file_importer.dart';

class NotFounded404Screen extends StatelessWidget {
  const NotFounded404Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "NotFounded404. Please, check your network or try again!",
        style: bannerText,
      ),
    );
  }
}
