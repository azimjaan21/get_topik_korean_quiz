import 'package:get_topik_korean_quiz/tools/file_importer.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        splashIconSize: 177,
        backgroundColor: const Color(0xff292929),
        splash: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          child: Image.asset(
            'assets/images/gettopik.png',
          ),
        ),
        nextScreen: const HomeScreen(),
      ),
    );
  }
}
