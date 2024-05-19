import 'package:get_topik_korean_quiz/tools/file_importer.dart';

class QuizCard extends StatelessWidget {
  final String word;

  QuizCard({super.key, required this.word});

  final FlutterTts flutterTts = FlutterTts();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.8,
        decoration: BoxDecoration(
          color: AppColors.gettopikColor,
          borderRadius: BorderRadius.circular(30),
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
        child: InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: () {
            speak(word);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Text(
                    word,
                    style: quizWord,
                    textAlign: TextAlign.center,
                  ),
                ),
                20.kH,
                const Icon(
                  Icons.volume_up,
                  size: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> speak(String text) async {
    await flutterTts.setLanguage("ko-KR");
    await flutterTts.setVoice({"name": "ko-kr-x-koc-local", "locale": "ko-KR"});
    await flutterTts.setPitch(1.0);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.speak(text);
  }
}
