import 'package:flutter/material.dart';
import 'package:quizz_game/pages/game_play.dart';
import 'package:quizz_game/pages/login_page_1.1.dart';
import 'package:quizz_game/pages/register_page_1.3.dart';
import 'package:quizz_game/utils/questions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home:GamePlay(questions: all_questions) ,
    );
  }
}
