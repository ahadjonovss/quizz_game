import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizz_game/utils/fonts.dart';

Widget navigator(String str,BuildContext context,dynamic Page){
  return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Page));
      },
      child: Container(
        height: 60,
        width: 270,
        decoration: BoxDecoration(
          color: Color(0xFFFCA82F),
          borderRadius: BorderRadius.circular(4)
        ),
        child: Center(
            child: Text(str,style: MyFonts.F_18.copyWith(color: Colors.white),)),
      ));
}

