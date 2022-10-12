import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/fonts.dart';

Widget result_answer(String result,int index){
  return AnimatedContainer(
    duration: Duration(milliseconds: 500),
    curve: Curves.ease,
    margin: EdgeInsets.only(top: 20),
    padding: EdgeInsets.all(8),
    width: 300,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: Colors.white,
        boxShadow:  [
          BoxShadow(
              color: result=="Correct"?Colors.green:Colors.red,
              blurRadius: 4
          )
        ]
    ),
    child: AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      margin: EdgeInsets.only(left: 4),
      child: Row(children:[
        Text("$index-answer:            ${result}",style: MyFonts.F_18.copyWith(fontSize: 16),),
      ]
      ),
    ),
  );
}