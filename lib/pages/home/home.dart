import 'package:get_topik_korean_quiz/tools/file_importer.dart';

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

                /// Top ///
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    NeumorphContainer(
                      bookTitle: 'assets/images/book1.png',
                      onTap: () =>
                          Navigator.of(context).pushNamed(RouteName.getTopik1),
                    ),
                    NeumorphContainer(
                      bookTitle: 'assets/images/book2.png',
                      onTap: () =>
                          Navigator.of(context).pushNamed(RouteName.getTopik2),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
