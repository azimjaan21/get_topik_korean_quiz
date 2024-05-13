import 'package:get_topik_korean_quiz/tools/file_importer.dart';

class TopBarGetTopik extends StatelessWidget {
  const TopBarGetTopik({super.key});

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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Image.asset('assets/images/gettopik.png'),
              const Text(
                'Quiz',
                style: subbannerText,
              ),
            ],
          ),
          CircleAvatar(
            backgroundColor: AppColors.gettopikColor,
            child: const Icon(Icons.person),
          )
        ],
      ),
    );
  }
}
