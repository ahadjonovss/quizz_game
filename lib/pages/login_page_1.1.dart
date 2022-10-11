import 'package:flutter/material.dart';
import 'package:quizz_game/pages/number_confirm_page_1.2.dart';
import 'package:quizz_game/utils/fonts.dart';
import 'package:quizz_game/utils/project_images.dart';
import 'package:quizz_game/widgets/text_filed.dart';

import '../widgets/navigator_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}
TextEditingController controller= TextEditingController();

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            child: Column(
              children: [
                SizedBox(height: 24,),
                Center(
                  child: Text("Login",style: MyFonts.F_18.copyWith(fontSize: 28)),
                ), //Login
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 40),
                    height: 240,
                    width: 225,
                    decoration: const BoxDecoration(
                      image:  DecorationImage(
                        image: AssetImage(MyImages.intro_pic),
                        fit: BoxFit.cover
                      )
                    ),
                  ),
                ),
                SizedBox(height: 50,),//pic
                textfield("Enter your mobile number"),
                SizedBox(height: 28,),//Enter mobile number
                navigator("Login",context,NumberConfirm()),
                SizedBox(height: 230,),
                Text("term’s and conditons apply",style: MyFonts.F_18.copyWith(color: Colors.grey,fontSize: 12),),
                Text("POWERD BY - sparrowdevops.com",style: MyFonts.F_18.copyWith(color: Colors.grey,fontSize: 16),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
