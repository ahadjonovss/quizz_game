import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quizz_game/pages/home_page_2.0.dart';
import 'package:quizz_game/pages/register_page_1.3.dart';
import 'package:quizz_game/utils/project_images.dart';
import 'package:quizz_game/widgets/navigator_widget.dart';

import '../utils/fonts.dart';

class NumberConfirm extends StatefulWidget {
  const NumberConfirm({Key? key}) : super(key: key);

  @override
  State<NumberConfirm> createState() => _NumberConfirmState();
}

class _NumberConfirmState extends State<NumberConfirm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 20,),
              Center(
                child: Text("Otp",style: MyFonts.F_18.copyWith(fontSize: 28)),
              ),
              SizedBox(height: 50,),
              SvgPicture.asset(MyImages.logo_svg,height: 60,),
              SizedBox(height: 70,),
              Text("Enter your 6 digit otp here",style: MyFonts.F_18.copyWith(color: Colors.grey,fontSize: 19),),
              SizedBox(height: 38,),
              Text("_ _ _ _ _ _",style: MyFonts.F_18.copyWith(fontSize: 32)),
              SizedBox(height: 40,),
              navigator("Login", context, HomePage()),
              SizedBox(height: 10,),
              Text("login with social media",style: MyFonts.F_18.copyWith(color: Colors.grey,fontSize: 18),),
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 107),
                  height: 200,
                  width: 260,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(MyImages.bottom_pic),
                      fit: BoxFit.cover
                    )
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
