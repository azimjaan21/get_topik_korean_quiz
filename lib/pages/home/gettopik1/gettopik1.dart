import 'package:get_topik_korean_quiz/tools/file_importer.dart';

class GetTopik1 extends StatelessWidget {
  const GetTopik1({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              MyAppBar(
                title: '초급 1',
              ),
              UnitCard(
                unitTitle: '만나서 반갑습니다',
                unitImage: "assets/images/unit2_1.jpg",
                unitNumber: '2.1',
              ),
              UnitCard(
                unitTitle: '저는 제인입니다',
                unitImage: "assets/images/unit2_2.jpg",
                unitNumber: '2.2',
              ),
              UnitCard(
                unitTitle: '이 사람은 누구에요?',
                unitImage: "assets/images/unit2_3.jpg",
                unitNumber: '2.3',
              ),
              UnitCard(
                unitTitle: '몇 시에 일어나요 ?',
                unitImage: "assets/images/unit3_1.jpg",
                unitNumber: '3.1',
              ),
              UnitCard(
                unitTitle: '오늘이 몇 월 며칠이에요?',
                unitImage: "assets/images/unit3_2.jpg",
                unitNumber: '3.2',
              ),
              UnitCard(
                unitTitle: '주말에 무엇을 했어요 ?',
                unitImage: "assets/images/unit3_3.jpg",
                unitNumber: '3.3',
              ),
              UnitCard(
                unitTitle: '가방 안에 책과 공책이 있어요 ?',
                unitImage: "assets/images/unit4_1.jpg",
                unitNumber: '4.1',
              ),
              UnitCard(
                unitTitle: '도서관에서 공부를 해요 ?',
                unitImage: "assets/images/unit4_2.jpg",
                unitNumber: '4.2',
              ),
              UnitCard(
                unitTitle: '오른쪽으로 가세요',
                unitImage: "assets/images/unit4_3.jpg",
                unitNumber: '4.3',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
