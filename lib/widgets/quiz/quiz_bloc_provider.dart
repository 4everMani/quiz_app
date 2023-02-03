import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './display-question.dart';
import '../../blocs/quiz/quiz_blocs.dart';
import '../../blocs/quiz/quiz_events.dart';
import '../../blocs/quiz/quiz_state.dart';
import '../../repos/quiz_repository.dart';

class QuizBlocProvider extends StatelessWidget {
  const QuizBlocProvider(this.email, this.topic);

  final String email;
  final String topic;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuizBloc(
        RepositoryProvider.of<QuizRepository>(context),
      )..add(QuizLoadingEvent()),
      child: BlocBuilder<QuizBloc, QuizState>(
        builder: ((context, state) {
          if (state is QuizLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is QuizLoadedState) {
            return DisplayQuestion(
                questions: state.questions, email: email, topic: topic);
          }
          if (state is QuizErrorState) {
            return Center(
              child: Text(state.error),
            );
          }
          return Container();
        }),
      ),
    );
  }
}
