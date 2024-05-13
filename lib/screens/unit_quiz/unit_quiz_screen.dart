import 'package:get_topik_korean_quiz/tools/file_importer.dart';

class UnitQuizScreen extends StatelessWidget {
  const UnitQuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 33),
            QuizCard(word: '도서관'),
            const SizedBox(height: 33),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: Card(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('kutubxona'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
