import 'package:flutter_bloc/flutter_bloc.dart';

import 'authentication_bloc.dart';
import 'authentication_event.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc()
      : super(AuthenticationState(isLogin: false, email: "", userName: "")) {
    on<LoginEvent>(((event, emit) async {
      // if (event.email == "pluto1@microservice.com" &&
      //     event.password == "123456") {
      //   emit(LoginState(event.email, event.password));
      // } else {
      emit(LoginFailedState());
      // }
    }));
    on<LogoutEvent>(((event, emit) async {
      emit(LogoutState());
    }));
  }
}
