import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quiz_app/repos/quiz_repository.dart';

import '../../widgets/quiz/quiz_bloc_provider.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({super.key});

  static const routeName = '/category-question';

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final topicName = arguments['topicName'] ?? '';
    final email = arguments['email'];
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(topicName.toString()),
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
          create: (context) => QuizRepository(topicName.toString()),
          child: QuizBlocProvider(email!, topicName),
        ));
  }
}
