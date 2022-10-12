import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quizz_game/utils/fonts.dart';
import 'package:quizz_game/utils/project_images.dart';
import 'package:quizz_game/utils/questions.dart';
import 'package:quizz_game/widgets/test_widget.dart';

class TestMenu extends StatelessWidget {
  const TestMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                height: 50,
                width: 400,
                decoration: BoxDecoration(
                  color: Colors.lightBlue.shade900,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),bottomRight: Radius.circular(25)),
                  
                ),
                child: Center(
                  child: Container(
                    width: 90,
                      child: Image.asset(MyImages.logo_dark)),
                ),
              ), //AppBart
              Container(
                margin: EdgeInsets.all(5),
                height: 150,
                width: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage (MyImages.test_banner),
                    fit: BoxFit.cover
                  )
                ),
              ),
              test_banner(context,programming_questions,Colors.redAccent,"Programming"),
              test_banner(context,mt_questions,Colors.blueAccent,"Mother\ntongue"),
              test_banner(context,history_questions,Colors.deepPurpleAccent,"History"),

            ],
          ),
        ),
      ),
    );
  }
}
