import 'package:flutter/material.dart';
import 'package:quizz_game/widgets/result_widget.dart';

import '../utils/fonts.dart';

class ResultPage extends StatelessWidget {
   final Map<int,String> results;
   const ResultPage({Key? key,required this.results}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Container(
            child: Column(
              children: [
                SizedBox(height: 24,),
                Center(
                  child: Text("Your Result",style: MyFonts.F_18.copyWith(fontSize: 28)),
                ),
                Container(
                  padding: EdgeInsets.only(left: 30,right: 30),
                  height: 700,
                  width: 400,
                  child: ListView.builder(
                      itemBuilder: (context, index) => result_answer(results[index+1].toString(),index+1),
                    itemCount: results.length,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
