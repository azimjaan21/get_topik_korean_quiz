import 'package:get_topik_korean_quiz/screens/random_quiz/random_quiz.dart';
import 'package:get_topik_korean_quiz/screens/unit_quiz/unit_quiz_screen.dart';
import 'package:get_topik_korean_quiz/tools/file_importer.dart';

abstract class RouteName {
  static const home = '/home';

  // Home Vocabulary options :
  static const getTopik1 = '/getTopik1';
  static const getTopik2 = '/getTopik2';
  static const randomQuiz = '/randomQuiz';
  static const unitQuiz = '/unitQuiz';
}

class RouterNavigator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.getTopik1:
        return MaterialPageRoute(builder: (_) => const GetTopik1());

      case RouteName.getTopik2:
        return MaterialPageRoute(builder: (_) => const GetTopik2());

      case RouteName.randomQuiz:
        return MaterialPageRoute(builder: (_) => const RandomQuizScreen());

      case RouteName.unitQuiz:
        return MaterialPageRoute(builder: (_) => const UnitQuizScreen());

      // If smth is wrong here, this screen give info:
      default:
        return MaterialPageRoute(
          builder: (_) => const NotFounded404Screen(),
        );
    }
  }
}
