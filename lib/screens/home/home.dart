import 'package:get_topik_korean_quiz/tools/file_importer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Simulating a loading delay (e.g., fetching data or initializing resources)
  Future<void> _simulateLoading() async {
    await Future.delayed(const Duration(seconds: 2)); // Adjust the delay as needed
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: FutureBuilder(
          future: _simulateLoading(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Show loading indicator while waiting
              return  Center(
                child: CircularProgressIndicator(
                  color: AppColors.gettopikColor,
                ),
              );
            } else {
              // Render the main content of HomeScreen
              return SingleChildScrollView(
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: Column(
                    children: [
                      TopBarGetTopik(
                        ontap: () =>
                            Navigator.of(context).pushNamed(RouteName.userProfile),
                      ),
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
                                  .pushNamed(RouteName.home1gettopik1),
                            ),
                            NeumorphContainer(
                              bookTitle: 'assets/images/book2.png',
                              onTap: () =>
                                  Navigator.of(context).pushNamed(RouteName.getTopik2),
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
                              bookTitle: 'assets/images/book3.png',
                              onTap: () =>
                                  Navigator.of(context).pushNamed(RouteName.getTopik3),
                            ),
                            NeumorphContainer(
                              bookTitle: 'assets/images/book4.png',
                              onTap: () =>
                                  Navigator.of(context).pushNamed(RouteName.getTopik4),
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
              );
            }
          },
        ),
      ),
    );
  }
}
