import 'package:get_topik_korean_quiz/tools/file_importer.dart';

class GoogleButton extends StatelessWidget {
  final String text;
  final Function() ontap;

  const GoogleButton({
    super.key,
    required this.text,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.75,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 32,
                height: 32,
                child: Image.asset('assets/images/google.png'),
              ),
              10.wH,
              Text(
                text,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
