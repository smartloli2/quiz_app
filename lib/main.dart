import 'package:flutter/material.dart';

import './quiz.dart';
import './result..dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s you favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 1},
        {'text': 'Snake', 'score': 10},
        {'text': 'Elephant', 'score': 2},
        {'text': 'Lion', 'score': 3},
      ],
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': [
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
      ],
    },
  ];

  var _qIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _qIndex = 0;
      _totalScore = 0;
    });
  }

  void _onAnswered(int score) {
    _totalScore += score;

    setState(() {
      _qIndex++;
    });
    print('Nice - qI: $_qIndex');
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My lovely app'),
        ),
        body: (_qIndex < _questions.length)
            ? Quiz(
                onAnswered: _onAnswered,
                questions: _questions,
                qIndex: _qIndex,
              )
            : Result(
                resultScore: _totalScore,
                resetHandler: _resetQuiz,
              ),
      ),
    );
  }
}
