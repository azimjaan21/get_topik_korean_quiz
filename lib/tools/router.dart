import 'package:get_topik_korean_quiz/tools/file_importer.dart';

abstract class RouteName {
  static const home = '/home';

  // Home Vocabulary options :
  static const getTopik1 = '/getTopik1';
  static const getTopik2 = '/getTopik2';
  static const randomQuiz = '/randomQuiz';
  static const unitQuiz = '/unitQuiz';
  static const signUp = '/signUp';
  static const signIn = '/signIn';
  static const resetPassword = '/resetPassword';
  static const userProfile = '/userProfile';
}

class RouterNavigator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case RouteName.getTopik1:
        return MaterialPageRoute(builder: (_) => const GetTopik1());

      case RouteName.getTopik2:
        return MaterialPageRoute(builder: (_) => const GetTopik2());

      case RouteName.randomQuiz:
        return MaterialPageRoute(builder: (_) => const RandomQuizScreen());

      case RouteName.unitQuiz:
        return MaterialPageRoute(builder: (_) => const UnitQuizScreen());

      case RouteName.signUp:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());

      case RouteName.signIn:
        return MaterialPageRoute(builder: (_) => const SignInScreen());

      case RouteName.resetPassword:
        return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());

      case RouteName.userProfile:
        return MaterialPageRoute(builder: (_) =>    UserProfileScreen());

      // If smth is wrong here, this screen give info:
      default:
        return MaterialPageRoute(
          builder: (_) => const NotFounded404Screen(),
        );
    }
  }
}
