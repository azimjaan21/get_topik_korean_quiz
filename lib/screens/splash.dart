import 'package:get_topik_korean_quiz/tools/file_importer.dart';

import '../auth/auth_service.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        splashIconSize: 177,
        backgroundColor: AppColors.topBarColor,
        splash: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          child: Image.asset(
            'assets/images/gettopik.png',
          ),
        ),
        nextScreen:AuthService.auth.currentUser==null? const SignInScreen():const HomeScreen(),
      ),
    );
  }
}
