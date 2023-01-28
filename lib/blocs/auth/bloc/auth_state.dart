part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class LoadAuthScreenState extends AuthState {}

class LoggedInState extends AuthState {}

class LogOutState extends AuthState {}

class PopWelcomeScreenState extends AuthState {}
