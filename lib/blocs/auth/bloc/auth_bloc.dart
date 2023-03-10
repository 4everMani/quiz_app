import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quiz_app/models/user.dart';
import 'package:quiz_app/repos/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  AuthBloc(this._authRepository) : super(LoadAuthScreenState()) {
    on<LoadAuthScreenEvent>((event, emit) => emit(LoadAuthScreenState()));
    on<SignUpEvent>((event, emit) async {
      try {
        final user = await _authRepository.signUp(event.signup);
        emit(LoggedInState(user));
      } catch (e) {
        final err = e.toString();
        emit(AuthErrorState(err, err));
      }
    });
    on<LogInEvent>((event, emit) async {
      try {
        final user = await _authRepository.login(event.user);
        emit(LoggedInState(user));
      } catch (e) {
        final err = e.toString();
        emit(AuthErrorState(err, err));
      }
    });

    on<ImageChangeEvent>(
      (event, emit) {
        final user = event.user;
        user.imageUrl = event.imagePath;
        emit(ImageChangeState(event.imagePath, user));
      },
    );
    on<LogoutEvent>(
      (event, emit) {
        emit(LogOutState());
      },
    );
  }
}
