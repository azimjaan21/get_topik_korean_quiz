import 'package:get_topik_korean_quiz/tools/file_importer.dart';

class TopBarGetTopik extends StatelessWidget {
  final Function() ontap;
  final User user;

  const TopBarGetTopik({super.key, required this.ontap, required this.user});

  @override
  Widget build(BuildContext context) {
    String? photoURL = user.photoURL;

    return Container(
      height: MediaQuery.sizeOf(context).height * 0.10,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.topBarColor,
        borderRadius: const BorderRadiusDirectional.only(
          bottomEnd: Radius.circular(35),
          bottomStart: Radius.circular(35),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Image.asset('assets/images/gettopik.png'),
              const Text(
                'Quiz',
                style: subbannerText,
              ),
            ],
          ),
          InkWell(
            onTap: ontap,
            child: CircleAvatar(
              radius: 20,
              backgroundColor: AppColors.gettopikColor,
              backgroundImage: photoURL != null ? NetworkImage(photoURL) : null,
              child: photoURL == null ? const Icon(Icons.person) : null,
            ),
          )
        ],
      ),
    );
  }
}
