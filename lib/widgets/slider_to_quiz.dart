import 'package:get_topik_korean_quiz/tools/file_importer.dart';

class CustomLinearProgressIndicator extends StatelessWidget {
  final double value;

  const CustomLinearProgressIndicator({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[400],
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(
                colors: [Colors.blue, Colors.purple],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            width: value * MediaQuery.of(context).size.width,
          ),
        ],
      ),
    );
  }
}
