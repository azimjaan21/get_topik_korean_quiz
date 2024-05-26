import 'package:get_topik_korean_quiz/tools/file_importer.dart';

class GetTopik3 extends StatelessWidget {
  const GetTopik3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            const CustomSliverAppBar(
              title: '중급 1',
              imagePath: 'assets/images/book3banner.jpeg',
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              20.kH,
              UnitCard(
                unitTitle: '만나서 반갑습니다',
                unitImage: "assets/gBook1/unit2_1.jpg",
                unitNumber: '2.1',
                ontap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const QuizScreen(unitNumber: 2.1)),
                  );
                },
              ),

              //     # temporary notifier  #
              20.kH,
              const Text(
                '중급 1 quiz test\nhozircha mavjud emas...',
                textAlign: TextAlign.center,
              ),
              20.kH,
              Text(
                '중급 1차 퀴즈테스트는\n아직 나오지 않았습니다...',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppColors.topBarColor, fontWeight: FontWeight.bold),
              ),
              //     # temporary notifier  #
            ],
          ),
        ),
      ),
    );
  }
}
