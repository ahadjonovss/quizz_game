import 'package:flutter/material.dart';
import 'package:quizz_game/utils/fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Center(
                child: Text("Login",style: MyFonts.F_18),
              )
            ],
          ),
        ),
      ),
    );
  }
}
