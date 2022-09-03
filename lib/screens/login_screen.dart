import "package:flutter/material.dart";
import 'package:lets_meet/services/auth_methods.dart';
import 'package:lets_meet/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthMethods _authMethods = AuthMethods();

  void googleSignIn() async {
    bool result = await _authMethods.signInWithGoogle(context);
    if (result) {
      Navigator.pushNamed(context, '/home-route');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Start or Join a new meeting",
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w300,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(60.0),
            child: Image.asset(
              "assets/images/onBoarding.png",
            ),
          ),
          CustomButton(
            text: "Google Sign In",
            onPressed: googleSignIn,
          ),
        ],
      ),
    );
  }
}
