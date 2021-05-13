part of 'authentication_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoadingState extends AuthState {
  const AuthLoadingState();

  @override
  List<Object> get props => [];
}

class AuthanticatedState extends AuthState {
  const AuthanticatedState();

  @override
  List<Object> get props => [];
}

class UnAuthanticatedState extends AuthState {
  const UnAuthanticatedState();

  @override
  List<Object> get props => [];
}

class AuthErrorState extends AuthState {
  const AuthErrorState({required this.error});
  final String error;

  @override
  List<Object> get props => [];
}
