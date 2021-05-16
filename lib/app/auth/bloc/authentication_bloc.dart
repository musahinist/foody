import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/route_manager.dart';

import '../../../util/http/http_exception.dart';
import '../data/auth_repo.dart';
import '../page/sign_in_page.dart';
import '../page/splash_page.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial());
  // factory AuthBloc() => _singleton;
  // AuthBloc._internal() : super(AuthInitial());
  // static final AuthBloc _singleton = AuthBloc._internal();

  // @override
  // Future<void> close() async {
  //   await _singleton.close();
  //   return super.close();
  // }

  final AuthRepo _authRepo = AuthRepo();
  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is AppStartedEvent) {
      yield const AuthLoadingState();
      try {
        final bool isSignedIn = await _authRepo.isSignedIn();
        if (isSignedIn) {
          //getUser
          //getHomePageData
          yield const AuthanticatedState();
        } else {
          yield const UnAuthanticatedState();
        }
      } catch (e) {
        yield AuthErrorState(error: HttpException.handleError(e));
      }
    }
    if (event is GoogleSignInEvent) {
      final User? user = await _authRepo.signInWithGoogle();
    }
    if (event is EmailSignUpEvent) {
      await _authRepo.signUp(email: event.email, password: event.password);
      Get.offAllNamed(SplashPage.$PATH);
      yield const AuthanticatedState();
    }
    if (event is EmailSignInEvent) {
      try {
        await _authRepo.signInWithCredentials(
            email: event.email, password: event.password);
        Get.offAllNamed(SplashPage.$PATH);
      } on FirebaseAuthException catch (e) {
        Get.snackbar('Error', e.message!);
      }
    }
    if (event is SignOutEvent) {
      await _authRepo.signOut();
      Get.offAllNamed(SignInPage.$PATH);
    }
  }
}
