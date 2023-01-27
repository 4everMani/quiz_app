import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:http/http.dart' as http;
import 'package:quiz_app/blocs/quiz_blocs.dart';
import 'package:quiz_app/repos/quiz_repository.dart';

import '../models/question.dart';
import '../widgets/display-question.dart';
import '../widgets/quiz_bloc_provider.dart';

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
        body: RepositoryProvider(
          create: (context) => QuizRepository(topicName),
          child: const QuizBlocProvider(),
        ));
  }
}


// FutureBuilder(
//           future: fetchQuestions(topicName),
//           builder: ((context, snapshot) {
//             if (snapshot.data == null) {
//               return const Center(
//                 child: CircularProgressIndicator(
//                   color: Colors.pinkAccent,
//                 ),
//               );
//             } else {
//               return DisplayQuestion(
//                 questions: snapshot.data!,
//               );
//             }
//           })),
