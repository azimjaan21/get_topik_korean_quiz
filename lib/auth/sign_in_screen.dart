// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'dart:io'; // Required for InternetAddress lookup
import 'package:get_topik_korean_quiz/tools/file_importer.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _auth = AuthService();

  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _isLoading = false;
  bool _isConnected = true; // Assume connected by default

  @override
  void initState() {
    super.initState();
    _checkInternetConnection();
  }

  Future<void> _checkInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        setState(() {
          _isConnected = true;
        });
      }
    } on SocketException catch (_) {
      setState(() {
        _isConnected = false;
      });
    }
  }

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
                  _isLoading
                      ? CircularProgressIndicator(
                          color: AppColors.gettopikColor)
                      : Column(
                          children: [
                            CustomButton(
                              text: 'Kirish',
                              buttonColor: AppColors.butColor,
                              ontap: () => _login(context),
                            ),
                            25.kH,
                            CustomButton(
                              text: "Ro'yxatdan o'tish",
                              buttonColor: AppColors.regColor,
                              ontap: () => Navigator.of(context)
                                  .pushNamed(RouteName.signUp),
                            ),
                            25.kH,
                            GoogleButton(
                              text: 'Google orqali',
                              ontap: () async {
                                await AuthService().signInWithGoogle();
                              },
                            ),
                            25.kH,
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

  void goToHome(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ),
    );
  }

  Future<void> _login(BuildContext context) async {
    // Check connectivity before attempting login
    if (!_isConnected) {
      ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(
          backgroundColor: AppColors.gettopikColor,
          content: const Text("Internet aloqasi yo'q!", style: TextStyle(color: Colors.black),),
        ),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final user = await _auth.loginUserWithEmailAndPassword(
        _email.text,
        _password.text,
      );

      if (user != null) {
        log("User Logged In Successfully");
        goToHome(context);
      } else {
        log("Something went wrong in Log In...(not registered user!)");
        ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(
             backgroundColor: AppColors.gettopikColor,
            content: const Text("Avval ro'yxatdan o'ting!"),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      log("FirebaseAuthException: ${e.code}");
      if (e.code == 'user-not-found') {
        log("User not found");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("User not registered. Please sign up."),
          ),
        );
      } else if (e.code == 'wrong-password') {
        log("Wrong password");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Incorrect password. Please try again."),
          ),
        );
      } else {
        log("Error during login: $e");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Error during login: ${e.message}"),
          ),
        );
      }
    } catch (e) {
      log("Error during login: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error during login: $e"),
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
}
