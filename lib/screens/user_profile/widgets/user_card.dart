import 'package:get_topik_korean_quiz/tools/file_importer.dart';

class UserCard extends StatelessWidget {
  final String name;
  final String email;
  const UserCard({super.key, required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.95,
        decoration: BoxDecoration(
          color: AppColors.userCardColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 15, left: 22),
          child: Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: AppColors.gettopikColor,
                child: const Icon(Icons.person),
              ),
              15.wH,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    overflow: TextOverflow.fade,
                    style: userTexth1,
                    softWrap: false,
                  ),
                  Text(
                    email,
                    overflow: TextOverflow.ellipsis,
                    style: mailTexth2,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
