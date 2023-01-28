part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class SignUpEvent extends AuthEvent {
  final User signup;
  const SignUpEvent(this.signup);

  @override
  List<Object> get props => [signup];
}

class LoadAuthScreenEvent extends AuthEvent {}

class LogInEvent extends AuthEvent {}

class LogoutEvent extends AuthEvent {}
