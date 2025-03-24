import 'package:flutter/material.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class Homescreen extends StatelessWidget {
  const Homescreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            'https://d1ymz67w5raq8g.cloudfront.net/Pictures/2000xAny/6/5/5/509655_shutterstock_1506580442_769367.jpg',
            width: 300,
          ),
          SizedBox(height: 20),
          Text(
            'Welcome to the Quiz App',
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
          SizedBox(height: 200),
          ElevatedButton.icon(
            onPressed: () {
              startQuiz();
            },
            label: Text('Start Quiz'),
            icon: Icon(Icons.play_arrow),
          ),
        ],
      ),
    );
  }
}
