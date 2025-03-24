import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_summary.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen(
    this.bestScore,
    this.selectedAnswers,
    this.resetQuiz, {
    super.key,
  });

  final List<String> selectedAnswers;
  final void Function() resetQuiz;
  final int bestScore;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summaryData = [];
    for (int i = 0; i < selectedAnswers.length; i++) {
      summaryData.add({
        'question_intex': i,
        'question': questions[i].question,
        'correct answer': questions[i].options[0],
        'user_answer': selectedAnswers[i],
      });
    }
    return summaryData;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final totalCorrectAnswers =
        summaryData
            .where((data) => data['correct answer'] == data['user_answer'])
            .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(90),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $totalCorrectAnswers out of $numTotalQuestions questions correctly!',
              style: TextStyle(color: Colors.black, fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            QuestionSummary(summaryData),
            SizedBox(height: 30),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 10,
                ),
                backgroundColor: Colors.lightGreen,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                resetQuiz();
              },
              label: Text("RESET"),
              icon: Icon(Icons.restore),
            ),
            SizedBox(height: 30),
            Text('Best Score: $bestScore'),
          ],
        ),
      ),
    );
  }
}
