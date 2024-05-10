import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get_topik_korean_quiz/tools/colors.dart';

class QuizCard extends StatelessWidget {
  final String word;

  QuizCard({super.key, required this.word});

  final FlutterTts flutterTts = FlutterTts();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.8,
      color: AppColors.gettopikColor,
      child: InkWell(
        onTap: () {
          speak(word);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                word,
                style: TextStyle(fontSize: 24.0),
              ),
              const SizedBox(height: 25.0),
              const Icon(
                Icons.volume_up,
                size: 40,
              ),
            ],
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
