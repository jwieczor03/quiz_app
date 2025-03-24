import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.chooseAnswer, {Key? key}) : super(key: key);

  final void Function(String answer, int score) chooseAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;
  var score = 0;

  void answerQuestion(String answer) {
    if (answer == questions[currentQuestionIndex].options[0]) {
      score++;
    }
    setState(() {
      widget.chooseAnswer(answer, score);
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(90),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.question,
              style: TextStyle(color: Colors.black, fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            ...currentQuestion.getShuffelsOptions().map((answer) {
              return AnswerButton(answer, () {
                answerQuestion(answer);
              });
            }).toList(),
            SizedBox(height: 30),
            Text("Your Score: $score"),
          ],
        ),
      ),
    );
  }
}
