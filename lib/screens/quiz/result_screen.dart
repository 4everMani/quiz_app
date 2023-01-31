import 'package:flutter/material.dart';
import 'package:quiz_app/models/score.dart';
import 'package:quiz_app/widgets/quiz/result.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen();

  static const String resultTabUrl = '/result';
  final scores = [
    Score(7, 6, '', 'Java'),
    Score(5, 3, '', 'DotNet'),
    Score(9, 6, '', 'JavaScript'),
    Score(8, 6, '', 'Flutter'),
    Score(6, 6, '', 'Dart'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        itemBuilder: ((context, index) {
          return Result(
              correctAnswers: scores[index].correctAnswer,
              questionAttempted: scores[index].questionAttempted,
              topic: scores[index].topic);
        }),
        itemCount: scores.length,
      ),
    );
  }
}
