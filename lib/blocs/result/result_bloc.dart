import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quiz_app/repos/result_repository.dart';
import '../../models/score.dart';
import 'result_event.dart';
import 'result_state.dart';

class ResultBloc extends Bloc<ResultEvent, ResultState> {
  final ResultRepository _resultRepository;
  ResultBloc(this._resultRepository) : super(LoadingResultState()) {
    on<LoadResultEvent>((event, emit) async {
      emit(LoadingResultState());
      try {
        final results = await _resultRepository.getResults(event.emial);
        emit(ResultLoadedState(results));
      } catch (e) {
        emit(ResultErrorState(e.toString()));
      }
    });
  }
}
