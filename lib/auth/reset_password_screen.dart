// ignore_for_file: use_build_context_synchronously

import 'package:get_topik_korean_quiz/tools/colors.dart';
import 'package:get_topik_korean_quiz/tools/file_importer.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Pochtangizni tekshiring !'),
          backgroundColor: AppColors.butColor,
        ),
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.message}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.topBarColor,
        body: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                30.kH,
                Image.asset(
                  'assets/images/gettopik.png',
                  height: 150,
                ),
                30.kH,
                const Text(
                  "Parolni qayta o'rnatish\nuchun pochtangizni kiriting",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                30.kH,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextFormField(
                    style: fieldText,
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintStyle: hintText,
                      hintText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: AppColors.butColor, width: 2),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email kiritishingiz kerak';
                      }
                      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(value)) {
                        return 'Iltimos, to\'g\'ri email kiriting';
                      }
                      return null;
                    },
                  ),
                ),
                30.kH,
                CustomButton(
                  text: 'Parolni tiklash',
                  ontap: () async {
                    if (_formKey.currentState?.validate() ?? false) {
                      await passwordReset();
                    }
                    Navigator.pop(context);
                  },
                  buttonColor: AppColors.butColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
