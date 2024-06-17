import 'package:get_topik_korean_quiz/tools/file_importer.dart';

class UserCard extends StatelessWidget {
  final User user;

  const UserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    String name = user.displayName ?? 'User';
    String email = user.email ?? 'No Email';
    String? photoURL = user.photoURL;

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
                backgroundImage: photoURL != null ? NetworkImage(photoURL) : null,
                child: photoURL == null ? const Icon(Icons.person) : null,
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
