import 'package:get_topik_korean_quiz/tools/file_importer.dart';

class NeumorphContainer extends StatelessWidget {
  final String bookTitle;
  final Function() onTap;
  const NeumorphContainer(
      {super.key, required this.onTap, required this.bookTitle});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 135,
        height: 180,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                bookTitle,
              ),
              fit: BoxFit.cover),
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(189, 189, 189, 1),
              offset: Offset(4.0, 4.0),
              blurRadius: 10.0,
              spreadRadius: 1.0,
            ),
            BoxShadow(
              color: Colors.white,
              offset: Offset(-4.0, -4.0),
              blurRadius: 10.0,
              spreadRadius: 1.0,
            ),
          ],
        ),
      ),
    );
  }
}
