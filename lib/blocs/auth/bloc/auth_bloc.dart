import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quiz_app/models/user.dart';
import 'package:quiz_app/repos/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  AuthBloc(this._authRepository) : super(LoadAuthScreenState()) {
    on<SignUpEvent>((event, emit) async {
      try {
        final username = await _authRepository.SignUp(event.signup);
        emit(PopWelcomeScreenState());
        emit(LoggedInState());
        print(username);
      } catch (e) {
        print(e);
      }
    });
    on<LoadAuthScreenEvent>((event, emit) => emit(LoadAuthScreenState()));
  }
}
