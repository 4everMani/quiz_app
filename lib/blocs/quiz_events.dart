import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class QuizEvent extends Equatable {
  const QuizEvent();
}

class QuizLoadingEvent extends QuizEvent {
  @override
  List<Object?> get props => [];
}
