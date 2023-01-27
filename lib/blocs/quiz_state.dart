import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:quiz_app/models/question.dart';

@immutable
abstract class QuizState extends Equatable {}

// Quiz loading state
class QuizLoadingState extends QuizState {
  @override
  List<Object?> get props => [];
}

//Quiz loaded state
class QuizLoadedState extends QuizState {
  final List<Question> questions;
  QuizLoadedState(this.questions);
  @override
  List<Object?> get props => [questions];
}

//quiz error loading state
class QuizErrorState extends QuizState {
  final String error;
  QuizErrorState(this.error);
  @override
  List<Object?> get props => [error];
}
