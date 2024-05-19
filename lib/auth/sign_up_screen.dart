import 'dart:developer';

import 'package:get_topik_korean_quiz/tools/file_importer.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _auth = AuthService();

  final _email = TextEditingController();
  final _password = TextEditingController();
  final _name = TextEditingController();
  bool _isLoading = false;

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
                  _isLoading
                      ? CircularProgressIndicator(
                          color: AppColors.gettopikColor,
                        )
                      : Column(
                          children: [
                            CustomButton(
                              text: "Ro'yxatdan o'tish",
                              buttonColor: AppColors.butColor,
                              ontap: _signUp,
                            ),
                            25.kH,
                            GoogleButton(
                              text: 'Google orqali',
                              ontap: () async {
                                await AuthService().signInWithGoogle();
                              },
                            ),
                          ],
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void goToHome1(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ),
      (Route<dynamic> route) => false,
    );
  }

  Future<void> _signUp() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final user = await _auth.createUserWithEmailAndPassword(
          _email.text, _password.text);

      if (user != null) {
        log("User Created Successfully");
        // ignore: use_build_context_synchronously
        goToHome1(context);
      } else {
        log("Something went wrong in SignUp");
      }
    } catch (e) {
      log("Error during sign up: $e");
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
}
