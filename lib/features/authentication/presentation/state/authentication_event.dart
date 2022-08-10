import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AuthenticationEvent {}

class LoginEvent extends AuthenticationEvent {}

class LogoutEvent extends AuthenticationEvent {}

class AuthenticationState {
  String userName = "";
  bool _isLogin;

  bool get isLogin => _isLogin;

  void setIsLogin(bool status) {
    _isLogin = status;
  }

  AuthenticationState(this._isLogin);
}

class LoginState extends AuthenticationState {
  LoginState() : super(true);
}

class LogoutState extends AuthenticationState {
  LogoutState() : super(false);
}

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationState(false)) {
    on<LoginEvent>(((event, emit) async {
      state.userName = "User1 Login";
      state.setIsLogin(true);
      emit(LoginState());
    }));
    on<LogoutEvent>(((event, emit) async {
      state.userName = "False False";
      state.setIsLogin(false);
      emit(LogoutState());
    }));
  }
}
