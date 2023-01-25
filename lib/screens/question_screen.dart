import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import '../models/question.dart';
import '../widgets/display-question.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  static const routeName = '/category-meals';

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  Future<List<Question>> fetchQuestions(String topic) async {
    var url =
        'https://quiz-app-2fb27-default-rtdb.asia-southeast1.firebasedatabase.app/${topic.replaceAll(' ', '')}.json';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var output = jsonDecode(response.body);
        List<Question> questionList = [];
        for (var que in output) {
          List<String> options = [];
          for (var opt in que['options']) {
            options.add(opt);
          }
          var quest = Question(que['question'], options, que['correctAnswer']);
          questionList.add(quest);
        }
        return questionList;
      } else {
        throw Exception();
      }
    } catch (error) {
      rethrow;
    }
  }

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
      body: FutureBuilder(
          future: fetchQuestions(topicName),
          builder: ((context, snapshot) {
            if (snapshot.data == null) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.pinkAccent,
                ),
              );
            } else {
              return DisplayQuestion(
                questions: snapshot.data!,
              );
            }
          })),
    );
  }
}
