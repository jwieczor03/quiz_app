import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/homeScreen.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;
  List<String> selectedAnswers = [];

  @override
  void initState() {
    activeScreen = Homescreen(changeScreen);
    super.initState();
  }

  int bestScore = 0;

  void setBestScore(int score) {
    if (score > bestScore) {
      setState(() {
        bestScore = score;
      });
    }
  }

  void resetQuiz() {
    setState(() {
      activeScreen = Homescreen(changeScreen);
      selectedAnswers = [];
    });
  }

  void chooseAnswer(String answer, int score) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        setBestScore(score);
        activeScreen = ResultScreen(bestScore, selectedAnswers, resetQuiz);
      });
    }
  }

  void changeScreen() {
    setState(() {
      activeScreen = QuestionsScreen(chooseAnswer);
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.green],
              begin: startAlignment,
              end: endAlignment,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
