import 'package:flutter_bloc/flutter_bloc.dart';

import 'authentication_bloc.dart';
import 'authentication_event.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc()
      : super(AuthenticationState(isLogin: false, username: "")) {
    on<LoginEvent>(((event, emit) async {
      emit(LoginState("User1"));
    }));
    on<LogoutEvent>(((event, emit) async {
      emit(LogoutState());
    }));
  }
}
