import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_topik_korean_quiz/auth/widgets/custom_button.dart';
import 'package:get_topik_korean_quiz/auth/widgets/custom_textfiled.dart';
import 'package:get_topik_korean_quiz/auth/widgets/text_reset_password.dart';
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
  void dispose() {
    _email.dispose();
    _password.dispose();
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
                    "Akkauntga kirish",
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
                  15.kH,
                  Padding(
                    padding: const EdgeInsets.only(right: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ResetTextPassword(
                          onTap: () => Navigator.of(context)
                              .pushNamed(RouteName.resetPassword),
                        ),
                      ],
                    ),
                  ),
                  40.kH,
                  CustomButton(
                    text: 'Kirish',
                    buttonColor: AppColors.butColor,
                    ontap: () =>
                        Navigator.of(context).pushNamed(RouteName.home),
                  ),
                  30.kH,
                  CustomButton(
                    text: "Ro'yxatdan o'tish",
                    buttonColor: AppColors.regColor,
                    ontap: () =>
                        Navigator.of(context).pushNamed(RouteName.signUp),
                  ),
                  30.kH,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
