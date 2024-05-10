import 'package:flutter/material.dart';

import '../../widgets/audio/speech_card.dart';

class RandomQuizScreen extends StatelessWidget {

  const RandomQuizScreen({super.key}); // Korean word to be spoken

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Korean Quiz'),
      ),
      body: Center(
        child: QuizCard(word: '도서관에서 공부를 해요 ?',),
      ),
    );
  }
}
