import 'package:get_topik_korean_quiz/tools/file_importer.dart';

class NeumorphContainer extends StatelessWidget {
  final Widget nchild;
  final Widget countNumchild;
  const NeumorphContainer(
      {super.key, required this.nchild, required this.countNumchild});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: null,
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.9,
        height: 150,
        decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage(
                'assets/images/banner.png',
              ),
              fit: BoxFit.cover),
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
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
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              nchild,
              countNumchild,
            ],
          ),
        ),
      ),
    );
  }
}
