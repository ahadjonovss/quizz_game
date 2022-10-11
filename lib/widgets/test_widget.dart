import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizz_game/pages/game_play.dart';
import 'package:quizz_game/utils/questions.dart';

import '../utils/fonts.dart';

Widget test_banner(BuildContext context){
  return InkWell(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>GamePlay(questions: all_questions)));
    },
    child: Container(
      margin: EdgeInsets.all(5),
      height: 130,
      width: 400,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Colors.redAccent,
                Colors.redAccent.withOpacity(0.8)
              ]
          ),
          borderRadius: BorderRadius.circular(20)
      ),
      child: Container(
        padding: EdgeInsets.only(left: 20,right: 30),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Programming\ntest",style: MyFonts.F_18.copyWith(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w600),),
              Text("Unlimited\nhours",style: MyFonts.F_18.copyWith(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w600),),
              Text("\$500",style: MyFonts.F_18.copyWith(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600),),


            ],
          ),
        ),
      ),
    ),
  );
}