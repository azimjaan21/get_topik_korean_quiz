import 'package:get_topik_korean_quiz/tools/file_importer.dart';

extension IntExtension on int {
  int validate({int value = 0}) {
    return this;
  }

  Widget get kH => SizedBox(
        height: toDouble(),
      );
      Widget get wH => SizedBox(
        width: toDouble(),
      );

}
