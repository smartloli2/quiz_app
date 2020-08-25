import 'package:flutter/material.dart';
import './answer.dart';
import './question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Function onAnswered;
  final qIndex;

  Quiz({
    @required this.questions,
    @required this.onAnswered,
    @required this.qIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(questions[qIndex]['questionText']),
        ...(questions[qIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(() => onAnswered(answer['score']), answer['text']);
        }).toList(),
      ],
    );
  }
}
