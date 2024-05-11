import 'package:get_topik_korean_quiz/tools/file_importer.dart';

class UnitCard extends StatelessWidget {
  final String unitTitle;
  final String unitImage;
    final String unitNumber;

  const UnitCard({super.key, required this.unitTitle, required this.unitImage, required this.unitNumber});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: null,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Stack(
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width * 0.9,
              height: 170,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    unitImage,
                  ),
                  fit: BoxFit.cover,
                ),
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
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.9,
                height: 170,
                color: Colors.black54,
                child: Center(
                  child: Text(
                    unitTitle,
                    style: cardText,
                  ),
                ),
              ),
            ),
             Positioned(
              top: 5,
              left: 5,
              child: Card(
                color: Colors.amber,
                shape: const CircleBorder(),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    unitNumber,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
