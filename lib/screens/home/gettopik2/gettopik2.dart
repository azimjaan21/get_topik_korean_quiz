import 'package:get_topik_korean_quiz/tools/file_importer.dart';

class GetTopik2 extends StatelessWidget {
  const GetTopik2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            const CustomSliverAppBar(
              title: '초급 2',
              imagePath: 'assets/images/book2banner.jpg',
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
                unitImage: "assets/gBook2/unit2_1.jpg",
                unitNumber: '1.1',
                ontap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const QuizScreen2(unitNumber: 1.1)),
                  );
                },
              ),
              UnitCard(
                unitTitle: '저는 제인입니다',
                unitImage: "assets/images/gBook2/unit2_3.png",
                unitNumber: '1.2',
                ontap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const QuizScreen2(unitNumber: 1.2)),
                  );
                },
              ),
              UnitCard(
                unitTitle: '이 사람은 누구에요?',
                unitImage: "assets/images/gBook2/unit2_2.jpg",
                unitNumber: '1.3',
                ontap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const QuizScreen2(unitNumber: 1.3)),
                  );
                },
              ),
              UnitCard(
                unitTitle: '몇 시에 일어나요 ?',
                unitImage: "assets/images/gBook2/unit3_1.jpg",
                unitNumber: '2.1',
                ontap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const QuizScreen2(unitNumber: 2.1)),
                  );
                },
              ),
              UnitCard(
                unitTitle: '오늘이 몇 월 며칠이에요?',
                unitImage: "assets/images/gBook2/unit3_2.jpg",
                unitNumber: '2.2',
                ontap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const QuizScreen2(unitNumber: 2.2)),
                  );
                },
              ),
              UnitCard(
                unitTitle: '주말에 무엇을 했어요 ?',
                unitImage: "assets/images/gBook2/unit3_3.png",
                unitNumber: '2.3',
                ontap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const QuizScreen2(unitNumber: 2.3)),
                  );
                },
              ),
              UnitCard(
                unitTitle: '가방 안에 책과 공책이 있어요 ?',
                unitImage: "assets/images/gBook2/unit4_1.jpg",
                unitNumber: '3.1',
                ontap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const QuizScreen2(unitNumber: 3.1)),
                  );
                },
              ),
              UnitCard(
                unitTitle: '도서관에서 공부를 해요 ?',
                unitImage: "assets/images/gBook2/unit4_2.jpg",
                unitNumber: '3.2',
                ontap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const QuizScreen2(unitNumber: 3.2)),
                  );
                },
              ),
              UnitCard(
                unitTitle: '오른쪽으로 가세요',
                unitImage: "assets/images/gBook2/unit4_3.jpg",
                unitNumber: '3.3',
                ontap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const QuizScreen2(unitNumber: 3.3)),
                  );
                },
              ),
              UnitCard(
                unitTitle: '여행을 가고 싶어요',
                unitImage: "assets/images/gBook2/unit5_1.jpg",
                unitNumber: '4.1',
                ontap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const QuizScreen2(unitNumber: 4.1)),
                  );
                },
              ),
              UnitCard(
                unitTitle: '영화를 보려고 해요',
                unitImage: "assets/images/gBook2/unit5_3.png",
                unitNumber: '4.2',
                ontap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const QuizScreen2(unitNumber: 4.2)),
                  );
                },
              ),
              UnitCard(
                unitTitle: '여행을 가고 싶어요',
                unitImage: "assets/images/gBook2/unit5_2.jpg",
                unitNumber: '4.3',
                ontap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const QuizScreen2(unitNumber: 4.3)),
                  );
                },
              ),
              UnitCard(
                unitTitle: '여행을 가고 싶어요',
                unitImage: "assets/images/gBook2/unit5_2.jpg",
                unitNumber: '5.1',
                ontap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const QuizScreen2(unitNumber: 5.1)),
                  );
                },
              ),
              UnitCard(
                unitTitle: '여행을 가고 싶어요',
                unitImage: "assets/images/gBook2/unit5_2.jpg",
                unitNumber: '5.2',
                ontap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const QuizScreen2(unitNumber: 5.2)),
                  );
                },
              ),
              UnitCard(
                unitTitle: '여행을 가고 싶어요',
                unitImage: "assets/images/gBook2/unit5_2.jpg",
                unitNumber: '5.3',
                ontap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const QuizScreen2(unitNumber: 5.3)),
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
