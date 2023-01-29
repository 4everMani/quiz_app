part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class LoadAuthScreenState extends AuthState {}

class LoggedInState extends AuthState {
  final User user;
  const LoggedInState(this.user);

  @override
  List<Object> get props => [user];
}

class LogOutState extends AuthState {}

class AuthErrorState extends AuthState {
  final String message;
  final String statusCode;
  const AuthErrorState(this.message, this.statusCode);

  @override
  List<Object> get props => [message, statusCode];
}

class ImageChangeState extends AuthState {
  final String imagePath;
  const ImageChangeState(this.imagePath);

  @override
  List<Object> get props => [imagePath];
}
