import 'package:get_topik_korean_quiz/tools/file_importer.dart';

class UserOptionsCard extends StatelessWidget {
  final String optionText;
  final Function() ontap;
  final Widget icon;
  const UserOptionsCard(
      {super.key, required this.optionText, required this.ontap, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Center(
        child: InkWell(
          onTap: ontap,
          borderRadius: BorderRadius.circular(15),
          child: Container(
            width: MediaQuery.sizeOf(context).width * 0.95,
            decoration: BoxDecoration(
              color: AppColors.userCardColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10, left: 22),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                     icon,
                      10.wH,
                      Text(
                        optionText,
                        style: TextStyle(
                            color: AppColors.background,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.navigate_next_outlined,
                    size: 35,
                    color: AppColors.background,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
