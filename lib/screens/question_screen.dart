import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/display-question.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  static const routeName = '/category-meals';

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final topicName = arguments['topicName'] ?? '';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(topicName),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.deepOrange, Colors.purple],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
          ),
        ),
      ),
      body: DisplayQuestion(),
    );
  }
}
