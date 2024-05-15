import 'package:get_topik_korean_quiz/auth/widgets/custom_button.dart';
import 'package:get_topik_korean_quiz/auth/widgets/custom_textfiled.dart';
import 'package:get_topik_korean_quiz/tools/extentions/sized_box_extention.dart';
import 'package:get_topik_korean_quiz/tools/file_importer.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Column(
          children: [
            const Spacer(),
            const Text("Sign in"),
            30.kH,
            CustomTextField(
              hintText: 'Email',
              isPassword: false,
              controller: _email,
            ),
            10.kH,
            CustomTextField(
              hintText: 'Password',
              isPassword: true,
              controller: _password,
            ),
            30.kH,
            CustomButton(
              text: 'Sign in',
              ontap: () => Navigator.of(context).pushNamed(RouteName.home),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
