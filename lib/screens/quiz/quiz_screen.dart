import 'package:flutter/material.dart';
import '../../widgets/quiz/quiz_item.dart';
import 'package:simple_icons/simple_icons.dart';

import '../../models/topic.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final topics = <Topic>[
    Topic(
      name: 'JavaScript',
      imageUrl: 'assets/js.png',
      backgroundColor: Colors.blue,
      icon: SimpleIcons.javascript,
    ),
    Topic(
      name: 'DotNet',
      imageUrl: 'assets/dotnet1.png',
      backgroundColor: Colors.orange,
      icon: SimpleIcons.dotnet,
    ),
    Topic(
      name: 'Node Js',
      imageUrl: 'assets/nodejs.png',
      backgroundColor: Colors.purple,
      icon: SimpleIcons.nodedotjs,
    ),
    Topic(
      name: 'Dart',
      imageUrl: 'assets/dart.png',
      backgroundColor: Colors.blue,
      icon: SimpleIcons.flutter,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      padding: const EdgeInsets.all(10),
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
        children: topics
            .map((topic) => QuizItem(
                  topic: topic,
                ))
            .toList(),
      ),
    );
  }
}
