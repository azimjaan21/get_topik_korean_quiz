import 'package:flutter/material.dart';
import 'package:get_topik_korean_quiz/tools/styles.dart';
import 'package:get_topik_korean_quiz/widgets/neumorph_container.dart';
import 'package:get_topik_korean_quiz/widgets/top_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: const Column(
              children: [
                TopBarGetTopik(),
                SizedBox(height: 20),
                NeumorphContainer(
                  nchild: Text(
                    "Get Topik I",
                    style: bannerText,
                  ),
                ),
                SizedBox(height: 20),
                NeumorphContainer(
                  nchild: Text(
                    "Get Topik II",
                    style: bannerText,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
