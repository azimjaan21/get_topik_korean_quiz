import 'package:get_topik_korean_quiz/tools/file_importer.dart';

class RandomAppBar extends StatelessWidget {
  const RandomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.10,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.topBarColor,
        borderRadius: const BorderRadiusDirectional.only(
          bottomEnd: Radius.circular(35),
          bottomStart: Radius.circular(35),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/gettopik.png'),
          const Text('무작위 퀴즈', style: randomTexth2),
        ],
      ),
    );
  }
}
