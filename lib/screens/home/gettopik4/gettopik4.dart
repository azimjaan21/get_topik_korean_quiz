import 'package:get_topik_korean_quiz/tools/file_importer.dart';

class GetTopik4 extends StatelessWidget {
  const GetTopik4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            const CustomSliverAppBar(
              title: '중급 2',
              imagePath: 'assets/images/book4banner.jpg',
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
                unitImage: "assets/gBook4/unit2_1.jpg",
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
            ],
          ),
        ),
      ),
    );
  }
}
