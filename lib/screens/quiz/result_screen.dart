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
  ResultScreen(this.email);
  final String email;
  static const String resultTabUrl = '/result';

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen>
    with AutomaticKeepAliveClientMixin<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => ResultRepository(),
      child: BlocProvider(
        create: (context) => ResultBloc(
          RepositoryProvider.of<ResultRepository>(context),
        )..add(LoadResultEvent(widget.email)),
        child: BlocBuilder<ResultBloc, ResultState>(builder: ((context, state) {
          if (state is LoadingResultState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ResultLoadedState) {
            state.scores.sort((a, b) => a.submittedAt.compareTo(b.submittedAt));
            var scores = state.scores.reversed.toList();
            if (scores.isNotEmpty) {
              return SizedBox(
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
    );
  }

  @override
  bool get wantKeepAlive {
    return true;
  }
}
