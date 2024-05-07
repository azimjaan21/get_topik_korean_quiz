import 'package:get_topik_korean_quiz/tools/file_importer.dart';
import 'package:get_topik_korean_quiz/widgets/appbar/appbar.dart';

class GetTopik1 extends StatelessWidget {
  const GetTopik1({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          children: [
            MyAppBar(),
          ],
        ),
      )),
    );
  }
}
