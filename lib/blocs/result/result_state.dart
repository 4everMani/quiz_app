import 'package:equatable/equatable.dart';

import '../../models/score.dart';

abstract class ResultState extends Equatable {
  const ResultState();

  @override
  List<Object> get props => [];
}

class LoadingResultState extends ResultState {
  @override
  List<Object> get props => [];
}

class ResultLoadedState extends ResultState {
  final List<Score> scores;
  const ResultLoadedState(this.scores);

  @override
  List<Object> get props => [scores];
}

//quiz error loading state
class ResultErrorState extends ResultState {
  final String error;
  const ResultErrorState(this.error);
  @override
  List<Object> get props => [error];
}
