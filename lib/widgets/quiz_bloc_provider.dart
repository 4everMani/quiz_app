import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/widgets/display-question.dart';
import '../blocs/quiz_blocs.dart';
import '../blocs/quiz_events.dart';
import '../blocs/quiz_state.dart';
import '../repos/quiz_repository.dart';

class QuizBlocProvider extends StatelessWidget {
  const QuizBlocProvider({super.key});

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
            return DisplayQuestion(questions: state.questions);
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
