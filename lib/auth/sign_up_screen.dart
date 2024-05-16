import 'package:get_topik_korean_quiz/auth/widgets/name_textField.dart';
import 'package:get_topik_korean_quiz/tools/file_importer.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _name = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _name.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.topBarColor,
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  40.kH,
                  Image.asset(
                    'assets/images/gettopik.png',
                    height: 150,
                  ),
                  20.kH,
                  const Text(
                    "Ro'yxatdan o'tish",
                    style: randomTexth1,
                  ),
                  30.kH,
                  CustomNameTextField(
                    hintText: 'Ismingiz',
                    controller: _name,
                  ),
                  10.kH,
                  CustomTextField(
                    hintText: 'Email',
                    isPassword: false,
                    controller: _email,
                  ),
                  10.kH,
                  CustomTextField(
                    hintText: 'Parol',
                    isPassword: true,
                    controller: _password,
                  ),
                  40.kH,
                  CustomButton(
                    text: "Ro'yxatdan o'tish",
                    buttonColor: AppColors.butColor,
                    ontap: () =>
                        Navigator.of(context).pushNamed(RouteName.signUp),
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
