import 'package:flutter/material.dart';
import 'package:get_topik_korean_quiz/tools/colors.dart';

class TopBarGetTopik extends StatelessWidget {
  const TopBarGetTopik({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.17,
      decoration: BoxDecoration(
        borderRadius: const BorderRadiusDirectional.only(
          bottomEnd: Radius.circular(35),
          bottomStart: Radius.circular(35),
        ),
        color: AppColors.topBarColor,
        image: const DecorationImage(
          image: AssetImage('assets/images/gettopik.png'),
        ),
      ),
      child: const Row(
        
      ),
    );
  }
}
