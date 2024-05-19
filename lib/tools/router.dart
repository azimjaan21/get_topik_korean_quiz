import 'package:get_topik_korean_quiz/screens/home/gettopik1/gettopik1_screen.dart';
import 'package:get_topik_korean_quiz/tools/file_importer.dart';

abstract class RouteName {
  static const home = '/home';

  // Home Vocabulary options :
  static const getTopik1 = '/getTopik1';
  static const getTopik2 = '/getTopik2';
  static const randomQuiz = '/randomQuiz';
  static const signUp = '/signUp';
  static const signIn = '/signIn';
  static const resetPassword = '/resetPassword';
  static const userProfile = '/userProfile';
    static const home1gettopik1 = '/homeGettopik1';


}

class RouterNavigator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

     

      case RouteName.getTopik2:
        return MaterialPageRoute(builder: (_) => const GetTopik2());

      case RouteName.randomQuiz:
        return MaterialPageRoute(builder: (_) => const RandomQuizScreen());

      case RouteName.signUp:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());

      case RouteName.signIn:
        return MaterialPageRoute(builder: (_) => const SignInScreen());

      case RouteName.resetPassword:
        return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());

      case RouteName.userProfile:
        return MaterialPageRoute(builder: (_) => const UserProfileScreen());
        case RouteName.home1gettopik1:
        return MaterialPageRoute(builder: (_) => const GetTopik1Screen());

      // If smth is wrong here, this screen give info:
      default:
        return MaterialPageRoute(
          builder: (_) => const NotFounded404Screen(),
        );
    }
  }
}
