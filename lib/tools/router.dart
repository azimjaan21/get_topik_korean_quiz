import 'package:get_topik_korean_quiz/tools/file_importer.dart';

abstract class RouteName {
  static const home = '/home';

  // Home Vocabulary options :
  static const getTopik1 = '/getTopik1';
  static const getTopik2 = '/getTopik2';
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

 // If smth is wrong here, this screen give info:
      default:
        return MaterialPageRoute(
          builder: (_) => const NotFounded404Screen(),
        );
    }
  }
}