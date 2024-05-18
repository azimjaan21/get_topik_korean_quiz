import 'package:get_topik_korean_quiz/tools/file_importer.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.topBarColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Text(
                    'Shaxsiy Akkaunt',
                    style: userProfileText,
                  ),
                ),
              ),
              const UserCard(name: "Cristiano", email: 'cristiano@mail.com'),
              30.kH,
              UserOptionsCard(
                optionText: 'Gettopik',
                icon: AppIcons.gettopik(width: 30.0, height: 30.0),
                ontap: () => null,
              ),
              UserOptionsCard(
                icon: AppIcons.telegram,
                optionText: 'Telegram kanal',
                ontap: () => null,
              ),
              UserOptionsCard(
                optionText: 'Adminga yozish',
                icon: AppIcons.devContact,
                ontap: () => null,
              ),
              UserOptionsCard(
                optionText: 'Boshqa dasturlar',
                icon: AppIcons.otherApps,
                ontap: () => null,
              ),
              50.kH,
              LogOutButton(
                text: 'Chiqish',
                ontap: () => null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
