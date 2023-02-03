import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../models/score.dart';

@immutable
abstract class QuizEvent extends Equatable {
  const QuizEvent();
}

class QuizLoadingEvent extends QuizEvent {
  @override
  List<Object?> get props => [];
}

class QuizSubmitEvent extends QuizEvent {
  final Score score;
  const QuizSubmitEvent(this.score);
  @override
  List<Object?> get props => [score];
}
