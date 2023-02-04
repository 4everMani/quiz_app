import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/models/topic.dart';

import '../../blocs/quiz/quiz_blocs.dart';
import '../../models/user.dart';
import '../../screens/quiz/question_screen.dart';

class QuizItem extends StatelessWidget {
  final Topic topic;
  final String email;
  const QuizItem({required this.topic, required this.email});

  /// moving to quiz screen
  void openQuiz(String topicName, BuildContext ctx) {
    Navigator.of(ctx).pushNamed(QuestionScreen.routeName,
        arguments: {'topicName': topicName, 'email': email});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() => openQuiz(topic.name!, context)),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: topic.backgroundColor,
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              topic.icon,
              color: Colors.white,
              size: 50,
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              topic.name!,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
