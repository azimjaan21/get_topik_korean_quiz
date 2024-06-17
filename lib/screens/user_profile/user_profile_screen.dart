// ignore_for_file: avoid_print

import 'package:get_topik_korean_quiz/tools/file_importer.dart';
import 'package:url_launcher/url_launcher.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  void _launchURL(Uri uri, bool inApp) async {
    try {
      if (await canLaunchUrl(uri)) {
        if (inApp) {
          await launchUrl(uri, mode: LaunchMode.inAppWebView);
        } else {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }

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
              UserCard(
                  name: 'User',
                  email: '${AuthService.auth.currentUser!.email}'),
              30.kH,
              UserOptionsCard(
                optionText: 'Gettopik',
                icon: AppIcons.gettopik(width: 30.0, height: 30.0),
                ontap: () => _launchURL(
                    Uri.parse("https://www.instagram.com/gettopik"), false),
              ),
              UserOptionsCard(
                icon: AppIcons.telegram,
                optionText: 'Telegram kanal',
                ontap: () =>
                    _launchURL(Uri.parse("https://t.me/azimjaantech"), false),
              ),
              UserOptionsCard(
                optionText: 'Adminga yozish',
                icon: AppIcons.devContact,
                ontap: () =>
                    _launchURL(Uri.parse("https://t.me/azimjaan21"), false),
              ),
              UserOptionsCard(
                optionText: 'Boshqa dasturlar',
                icon: AppIcons.otherApps,
                ontap: () => _launchURL(
                    Uri.parse("https://t.me/azimjaans_projects"), false),
              ),
              50.kH,
              LogOutButton(
                text: 'Chiqish',
                ontap: () async {
                  // Show confirmation dialog
                  bool? shouldLogout = await showDialog<bool>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: AppColors.background,
                        content: const Text('Akkauntdan chiqish?',
                            style: logOutNotifyText),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(false);
                            },
                            child: const Text('Yo\'q', style: noText),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(true);
                            },
                            child: const Text('Chiqish', style: exitText),
                          ),
                        ],
                      );
                    },
                  );

                  // If user confirmed, sign out
                  if (shouldLogout == true) {
                    await FirebaseAuth.instance.signOut();
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Akkauntdan chiqildi !'),
                        backgroundColor: AppColors.butColor,
                      ),
                    );
                    // Navigate to login screen
                    // ignore: use_build_context_synchronously
                    goToSignINscreen(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void goToSignINscreen(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const SignInScreen(),
      ),
      (Route<dynamic> route) => false,
    );
  }
}
