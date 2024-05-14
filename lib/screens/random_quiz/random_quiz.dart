import 'package:get_topik_korean_quiz/tools/extentions/sized_box_extention.dart';
import 'package:get_topik_korean_quiz/tools/file_importer.dart';
class RandomQuizScreen extends StatelessWidget {
  const RandomQuizScreen({super.key}); // Korean word to be spoken

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const RandomAppBar(),
            33.kH,
            QuizCard(word: '도서관'),
            33.kH,
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child:  Card(
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
