import 'package:flutter/material.dart';
import 'package:get_topik_korean_quiz/tools/colors.dart';
import 'package:get_topik_korean_quiz/tools/file_importer.dart';

class RandomQuizCard extends StatelessWidget {
  const RandomQuizCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: null,
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.8,
        height: 180,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('assets/images/random.png'),
            fit: BoxFit.cover,
          ),
          color: AppColors.topBarColor,
          borderRadius: BorderRadius.circular(20),
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
        child: const Padding(
          padding: EdgeInsets.only(left: 20, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Random Quiz',
                style: randomTexth1,
              ),
              Text(
                '무작위 퀴즈',
                style: randomTexth2,
              )
            ],
          ),
        ),
      ),
    );
  }
}
