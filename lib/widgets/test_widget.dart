import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizz_game/models/question_model.dart';
import 'package:quizz_game/pages/game_play.dart';
import 'package:quizz_game/utils/project_images.dart';
import 'package:quizz_game/utils/questions.dart';

import '../utils/fonts.dart';

Widget test_banner(BuildContext context, List<Question> questions,Color clr,String name){
  return InkWell(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>GamePlay(questions: questions)));
    },
    child: Container(
      margin: EdgeInsets.all(5),
      height: 130,
      width: 400,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                clr,
                clr.withOpacity(0.8)
              ]
          ),
          borderRadius: BorderRadius.circular(20)
      ),
      child: Stack(
        children:[
          Positioned(
            right: 10,
              top: 5,
              child: Container(
                height: 40,
                width: 40,
                decoration:const  BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage (MyImages.book),
                    fit: BoxFit.cover
                  )
                ),
              )
          ),
          Container(
            padding: EdgeInsets.only(left: 20,right: 30),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(name,style: MyFonts.F_18.copyWith(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w600),),
                  Text("${questions.length*15/60}\nminutes",style: MyFonts.F_18.copyWith(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w600),),
                  Text("\$500",style: MyFonts.F_18.copyWith(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600),),


                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}