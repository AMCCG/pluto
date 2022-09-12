import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(const AuthenticationInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(LoginLoadingState());
      await Future.delayed(const Duration(seconds: 2), () {});
      if (event.email == "pluto1@microservice.com" &&
          event.password == "123456") {
        emit(LoginState(
            isLogin: true, email: event.email, userName: event.password));
      } else {
        emit(const LoginFailedState());
      }
    });
    on<LogoutEvent>((event, emit) {
      emit(const LogoutState());
    });
  }
}
