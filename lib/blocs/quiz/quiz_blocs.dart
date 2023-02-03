import 'package:flutter_bloc/flutter_bloc.dart';
import './quiz_events.dart';
import './quiz_state.dart';

import '../../repos/quiz_repository.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  final QuizRepository _quizRepository;

  QuizBloc(this._quizRepository) : super(QuizLoadingState()) {
    on<QuizLoadingEvent>((event, emit) async {
      emit(QuizLoadingState());
      try {
        final questions = await _quizRepository.fetchQuestions();
        emit(QuizLoadedState(questions));
      } catch (e) {
        emit(QuizErrorState(e.toString()));
      }
    });
    on<QuizSubmitEvent>(
      (event, emit) async {
        try {
          final _ = await _quizRepository.submitQuiz(event.score);
        } catch (e) {
          emit(QuizErrorState(e.toString()));
        }
      },
    );
  }
}
