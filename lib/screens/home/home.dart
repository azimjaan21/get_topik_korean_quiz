import 'package:get_topik_korean_quiz/tools/extentions/sized_box_extention.dart';
import 'package:get_topik_korean_quiz/tools/file_importer.dart';
import 'package:get_topik_korean_quiz/screens/home/widgets/random/random_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: Column(
              children: [
                const TopBarGetTopik(),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    bottom: 7,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      NeumorphContainer(
                        bookTitle: 'assets/images/book1.png',
                        onTap: () => Navigator.of(context)
                            .pushNamed(RouteName.getTopik1),
                      ),
                      NeumorphContainer(
                        bookTitle: 'assets/images/book2.png',
                        onTap: () => Navigator.of(context)
                            .pushNamed(RouteName.getTopik2),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      NeumorphContainer(
                        bookTitle: 'assets/images/book1.png',
                        onTap: () => Navigator.of(context)
                            .pushNamed(RouteName.getTopik1),
                      ),
                      NeumorphContainer(
                        bookTitle: 'assets/images/book2.png',
                        onTap: () => Navigator.of(context)
                            .pushNamed(RouteName.getTopik2),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                20.kH,
                RandomQuizCard(
                  onTap: () =>
                      Navigator.of(context).pushNamed(RouteName.randomQuiz),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}