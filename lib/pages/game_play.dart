import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quizz_game/models/question_model.dart';
import 'package:quizz_game/pages/result_page.dart';
import 'package:quizz_game/utils/fonts.dart';
import 'package:quizz_game/widgets/timer_widget.dart';

import '../models/option_model.dart';

class GamePlay extends StatefulWidget {
  List<Question> questions;
  int currentQuestion=0;
  String nextButton="Next";
  Map<int,String> result={};




  GamePlay({Key? key,required this.questions}) : super(key: key);


  @override
  State<GamePlay> createState() => _GamePlayState();
}

class _GamePlayState extends State<GamePlay> {
  int start=15;

  @override
  void initState() {
    super.initState();

    Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          if(start!=0)
          start--;
          else{
            next();
            start=15;
          }


        });
    }
    );
  }

  void ontap() {
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40,),
              Center(child: Text("Programming Test",style: MyFonts.F_18,)),
              SizedBox(height: 18,),
              Container(
                margin: EdgeInsets.only(left: 40),
                width: 300,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  border: Border.all(color: Colors.grey)
                ),
                child: Stack(
                  children:[
                    Positioned(
                      child: Container(
                        width: 200,
                        height: 20,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0,1)
                              )
                            ]
                        ),),
                      top: 10,
                      left: 50,
                    ),
                    AnimatedPositioned(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.bounceInOut,
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                          height: 20,
                          width: widget.currentQuestion*(200/widget.questions.length),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32),
                              color: Colors.orange
                          ),
                        ),
                      top: 10,
                      left: 50,
                    ),
                    Positioned(
                        child: Text("${widget.currentQuestion+1}/${widget.questions.length}"),
                    top: 10,
                    right: 15,),
                    Positioned(
                      top: 6,
                      left: 10,
                      child: timer(start),),
                    Positioned(
                      top: 1,
                      right: 262,
                      child: TweenAnimationBuilder<double>(
                        builder: (BuildContext context, value, Widget? child) {
                          return CircularProgressIndicator(
                            strokeWidth: 2,
                            backgroundColor: Colors.transparent,
                            color: Colors.red,
                            value: value,
                          );
                        },
                        tween: Tween<double>(begin: 0.0, end: start / 15),
                        duration: Duration(seconds: 1),
                      ),
                    )
                  ]
                ),
              ),//progress
              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.only(left: 40,right: 20),
                width: 400,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Question - ${widget.currentQuestion+1}",style: MyFonts.F_18.copyWith(color: Colors.deepPurple,fontSize: 20),),
                    Text(widget.questions[widget.currentQuestion].title,style: MyFonts.F_18.copyWith(fontSize: 18,),),
                    options(widget.questions[widget.currentQuestion].options[0],ontap),
                    options(widget.questions[widget.currentQuestion].options[1],ontap),
                    options(widget.questions[widget.currentQuestion].options[2],ontap),
                    options(widget.questions[widget.currentQuestion].options[3],ontap),
                    InkWell(
                    onTap: () {
                      next();
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 16,top: 50),
                      height: 50,
                      width: 270,
                      decoration: BoxDecoration(
                          color: Colors.lightBlue.shade900,
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child: Center(
                          child: Text(widget.nextButton,style: MyFonts.F_18.copyWith(color: Colors.white),)),
                    )),


                  ],
                ),
              ) //question

            ],
          ),
        ),
      ),
    );
  }
  void next(){
    if(widget.nextButton=="Finish"){
      if(widget.result.length!=widget.questions.length)
      {
        List q_result=widget.questions[widget.currentQuestion].options.map((e) => e.isSelected==true && e.isTrue==true).toList();
        widget.result[widget.currentQuestion+1]=q_result.contains(true)?"Correct":"Incorrect";
      }
      print(widget.result);
      for(int i=0;i<widget.questions.length;i++){
        for(int j=0;j<widget.questions[i].options.length;j++){
          widget.questions[i].options[j].isSelected=false;
        }
      }
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ResultPage(results: widget.result)));
    }
    if(widget.currentQuestion==widget.questions.length-2)
      widget.nextButton="Finish";
    int falses=0;
    List selecteds=widget.questions[widget.currentQuestion].options.map((e) => e.isSelected).toList();
    selecteds.forEach((element) {
      if(element==false)
        falses++;
    });
    if(falses==3){
      setState(() {
        List q_result=widget.questions[widget.currentQuestion].options.map((e) => e.isSelected==true && e.isTrue==true).toList();
        widget.result[widget.currentQuestion+1]=q_result.contains(true)?"Correct":"Incorrect";
        if(widget.currentQuestion!=widget.questions.length-1){
          widget.currentQuestion++;
          start+=15;
        }


      });
    }
    if(falses<3 || falses==4){
      if(falses==4){
        widget.result[widget.currentQuestion+1]="Incorrect";
        if(widget.currentQuestion!=widget.questions.length-1)
          widget.currentQuestion++;

      }
      var snackBar = SnackBar(
          dismissDirection: DismissDirection.horizontal,
          content: Text(falses<4 && widget.nextButton!="Finish"?'Faqatgina bitta javobni tanlang!':"Javob tanlanmadi!",style: TextStyle(color: Colors.red),));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}

Widget options(Option myoption,Function set){
  return InkWell(
    onTap: (){
      myoption.isSelected=!myoption.isSelected;
      set();
    },
    child: Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.all(8),
      width: 300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: myoption.isSelected?Colors.green:Colors.white,
          boxShadow: const [
            BoxShadow(
                color: Colors.grey,
                blurRadius: 4
            )
          ]
      ),
      child: Container(
          margin: EdgeInsets.only(left: 4),
          child: Text(myoption.title,style: MyFonts.F_18.copyWith(fontSize: 16),)),
    ),
  );
}





