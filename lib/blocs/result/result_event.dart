import 'package:equatable/equatable.dart';

abstract class ResultEvent extends Equatable {
  const ResultEvent();

  @override
  List<Object> get props => [];
}

class LoadResultEvent extends ResultEvent {
  final String emial;
  const LoadResultEvent(this.emial);

  @override
  List<Object> get props => [emial];
}
