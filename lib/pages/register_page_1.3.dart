import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quizz_game/pages/home_page_2.0.dart';
import 'package:quizz_game/pages/login_page_1.1.dart';
import 'package:quizz_game/pages/test_menu.dart';
import 'package:quizz_game/widgets/text_filed.dart';

import '../utils/fonts.dart';
import '../utils/project_images.dart';
import '../widgets/navigator_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            child: Column(
              children: [
                SizedBox(height: 20,),
                Center(
                  child: Text("Register",style: MyFonts.F_18.copyWith(fontSize: 28)),
                ),
                SizedBox(height: 50,),
                SvgPicture.asset(MyImages.logo_svg,height: 60,),
                SizedBox(height: 60,),
                textfield("Enter your mobile number"),
                SizedBox(height: 20,),
                textfield("Password"),
                SizedBox(height: 20,),
                textfield("Confirm Password"),
                SizedBox(height: 50,),
                navigator("Register",context,TestMenu()),
                SizedBox(height: 20,),
                InkWell(
                  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));},
                    child: Text("if you have already account click here",style: MyFonts.F_18.copyWith(color: Colors.grey,fontSize: 16),))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
