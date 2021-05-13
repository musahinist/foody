part of 'authentication_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AppStartedEvent extends AuthEvent {
  const AppStartedEvent();
  @override
  List<Object> get props => [];
}

class AuthRequestedEvent extends AuthEvent {
  const AuthRequestedEvent();
  @override
  List<Object> get props => [];
  @override
  String toString() => 'AuthRequestedEvent';
}

class GoogleSignInEvent extends AuthEvent {
  const GoogleSignInEvent();
  @override
  List<Object> get props => [];
  @override
  String toString() => 'GoogleSignInEvent';
}

class EmailSignInEvent extends AuthEvent {
  const EmailSignInEvent({required this.email, required this.password});
  final String email;
  final String password;
  @override
  List<Object> get props => [];
  @override
  String toString() => 'GoogleSignInEvent';
}

class EmailSignUpEvent extends AuthEvent {
  const EmailSignUpEvent({required this.email, required this.password});
  final String email;
  final String password;
  @override
  List<Object> get props => [];
  @override
  String toString() => 'GoogleSignInEvent';
}

class PhoneSignInEvent extends AuthEvent {
  const PhoneSignInEvent({required this.phone});
  final String phone;
  @override
  List<Object> get props => [];
  @override
  String toString() => 'GoogleSignInEvent';
}

class SignOutEvent extends AuthEvent {
  const SignOutEvent();
  @override
  List<Object> get props => [];
  @override
  String toString() => 'GoogleSignInEvent';
}
