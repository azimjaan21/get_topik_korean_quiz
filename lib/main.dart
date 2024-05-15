import 'package:firebase_core/firebase_core.dart';
import 'package:get_topik_korean_quiz/auth/sign_in_screen.dart';
import 'package:get_topik_korean_quiz/tools/file_importer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyBU_yee5nBidxRhGdoDtmyDeqUQpBIi1mQ',
      appId: '1:1041821793868:android:1671ca73624e72851fbee9',
      messagingSenderId: '1041821793868',
      projectId: 'gettopik-quiz',
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const SignInScreen(),
      onGenerateRoute: RouterNavigator.generateRoute,
    );
  }
}
