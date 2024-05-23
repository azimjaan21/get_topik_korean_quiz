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
                unitTitle: '학교에서 명동까지 지하철로\n얼마나 걸려요 ?',
                unitImage: "assets/gBook2/unit1_1.jpg",
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
                unitTitle: '인사동에 가려면 몇번\n버스를 타야 해요 ?',
                unitImage: "assets/gBook2/unit1_2.jpg",
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
                unitTitle: '육교를 지나서 우체국\n앞에서 세워 주세요 ?',
                unitImage: "assets/gBook2/unit1_3.png",
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
                unitTitle: '점심에 무엇을 먹을까요 ?',
                unitImage: "assets/gBook2/unit2_1.jpg",
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
                unitTitle: '기숙사에서 요리해도 돼요 ?',
                unitImage: "assets/gBook2/unit2_2.jpg",
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
                unitTitle: '저는 수영을 할 수 있어요',
                unitImage: "assets/gBook2/unit2_3.jpg",
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
                unitTitle: '옷을 사라 가요',
                unitImage: "assets/gBook2/unit3_1.jpg",
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
                unitTitle: '조금 작은 것 같아요',
                unitImage: "assets/gBook2/unit3_2.jpeg",
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
                unitTitle: '더 컸으면 좋겠어요',
                unitImage: "assets/gBook2/unit3_3.png",
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
                unitTitle: '감기가 더 심해졌어요',
                unitImage: "assets/gBook2/unit4_1.png",
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
                unitTitle: '뉴욕으로 소포를 보내려고\n하는데 얼마나 걸려요?',
                unitImage: "assets/gBook2/unit4_2.jpg",
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
                unitTitle: '10만 원만\n환전할게요',
                unitImage: "assets/gBook2/unit4_3.png",
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
                unitTitle: '경주에 간 적이 있어요 ?',
                unitImage: "assets/gBook2/unit5_1.jpg",
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
                unitTitle: '음악을 들으면서\n운동을 하고 있어요',
                unitImage: "assets/gBook2/unit5_2.jpg",
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
                unitTitle: '모르는 것이 있으면\n언제든지 물어 보세요',
                unitImage: "assets/gBook2/unit5_3.jpg",
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
