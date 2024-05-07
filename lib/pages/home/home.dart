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
                NeumorphContainer(
                  nchild: const Text(
                    "초급 1",
                    style: bannerText,
                  ),
                  countNumchild: const Text(" 300 ta so'z"),
                  onTap: () =>
                        Navigator.of(context).pushNamed(RouteName.getTopik1),
                ),
                const SizedBox(height: 20),

                NeumorphContainer(
                  nchild: const Text(
                    "초급 2",
                    style: bannerText,
                  ),
                  countNumchild: const Text(" 300 ta so'z"),
                  onTap: () =>
                        Navigator.of(context).pushNamed(RouteName.getTopik1),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
