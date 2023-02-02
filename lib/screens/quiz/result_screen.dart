import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/blocs/result/result_bloc.dart';
import 'package:quiz_app/blocs/result/result_state.dart';
import 'package:quiz_app/models/score.dart';
import 'package:quiz_app/repos/quiz_repository.dart';
import 'package:quiz_app/repos/result_repository.dart';
import 'package:quiz_app/widgets/quiz/result.dart';

import '../../blocs/quiz/quiz_blocs.dart';
import '../../blocs/result/result_event.dart';

class ResultScreen extends StatefulWidget {
  ResultScreen();
  static const String resultTabUrl = '/result';
  static String email = '';
  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  Future<bool> _willPopScopeCall() async {
    // int count = 0;
    // Navigator.of(context).popUntil((route) => count++ >= 2);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    ResultScreen.email = arguments['email'] ?? '';
    return WillPopScope(
      onWillPop: _willPopScopeCall,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text("Scores"),
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
          create: (context) => ResultRepository(),
          child: BlocProvider(
            create: (context) => ResultBloc(
              RepositoryProvider.of<ResultRepository>(context),
            )..add(LoadResultEvent(ResultScreen.email)),
            child: BlocBuilder<ResultBloc, ResultState>(
                builder: ((context, state) {
              if (state is LoadingResultState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is ResultLoadedState) {
                state.scores
                    .sort((a, b) => a.submittedAt.compareTo(b.submittedAt));
                var scores = state.scores.reversed.toList();
                if (scores.isNotEmpty) {
                  return Container(
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                      itemBuilder: ((context, index) {
                        return Result(
                          score: scores[index],
                        );
                      }),
                      itemCount: scores.length,
                    ),
                  );
                } else {
                  return const Center(
                    child: Text("No Quiz taken yet"),
                  );
                }
              }
              if (state is ResultErrorState) {
                return Center(
                  child: Text(state.error),
                );
              }
              return Container();
            })),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive {
    return true;
  }
}
