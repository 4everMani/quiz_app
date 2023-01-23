import 'package:flutter/material.dart';
import 'package:quiz_app/models/topic.dart';

class QuizItem extends StatelessWidget {
  final Topic topic;
  const QuizItem({required this.topic});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
