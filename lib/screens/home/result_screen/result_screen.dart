import 'package:get_topik_korean_quiz/tools/file_importer.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ResultScreen extends StatelessWidget {
  final int totalQuestions;
  final int correctAnswers;

  const ResultScreen(
      {super.key, required this.totalQuestions, required this.correctAnswers});

  @override
  Widget build(BuildContext context) {
    int percentage = (correctAnswers * 100) ~/ totalQuestions;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar:
          AppBar(toolbarHeight: 10.0, backgroundColor: AppColors.background),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularPercentIndicator(
              radius: 100.0,
              lineWidth: 30.0,
              animation: true,
              percent: correctAnswers / totalQuestions,
              center: Text(
                '$percentage %',
                style: quizWord,
              ),
              footer: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  "$correctAnswers / $totalQuestions",
                  style: quizSliderText,
                ),
              ),
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: Colors.purple,
            ),
            percentage == 100 && percentage >= 88
                ? const Text('완벽해요 !', style: resultTextExcel)
                : percentage >= 60 && percentage < 88
                    ? const Text('괜찮아요 !', style: resultTextGood)
                    : percentage < 60
                        ? const Text('불만족해요 !', style: resultTextBad)
                        : const SizedBox(),
            20.kH,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.topBarColor),
                  child: Row(
                    children: [
                      Icon(
                        Icons.menu_book,
                        size: 25.0,
                        color: AppColors.gettopikColor,
                      ),
                      5.wH,
                      Text(
                        '초급 1',
                        style: resultButText,
                      ),
                    ],
                  ),
                ),
                10.wH,
                // #goHome
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                      (Route<dynamic> route) => false,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.topBarColor),
                  child: Row(
                    children: [
                      Icon(
                        Icons.home,
                        size: 25.0,
                        color: AppColors.gettopikColor,
                      ),
                      5.wH,
                      Text(
                        'Bosh menyu',
                        style: resultButText,
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
