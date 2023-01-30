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

class LogInEvent extends AuthEvent {
  final User user;
  const LogInEvent(this.user);

  @override
  List<Object> get props => [user];
}

class ImageChangeEvent extends AuthEvent {
  final String imagePath;
  final User user;
  const ImageChangeEvent(this.imagePath, this.user);

  @override
  List<Object> get props => [imagePath, user];
}

class LogoutEvent extends AuthEvent {}
