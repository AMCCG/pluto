part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  final bool isLogin;
  final String email;
  final String userName;

  const AuthenticationState(this.isLogin, this.email, this.userName);

  @override
  List<Object> get props => [isLogin, email, userName];
}

class AuthenticationInitial extends AuthenticationState {
  const AuthenticationInitial() : super(false, "", "");
}

class AuthenticationInitialLoadingState extends AuthenticationState {
  const AuthenticationInitialLoadingState() : super(false, "", "");
}

class LoginState extends AuthenticationState {
  const LoginState({required isLogin, required email, required userName})
      : super(isLogin, email, userName);
}

class LoginLoadingState extends AuthenticationState {
  const LoginLoadingState() : super(false, "", "");
}

class LogoutState extends AuthenticationState {
  const LogoutState() : super(false, "", "");
}

class LogoutLoadingState extends AuthenticationState {
  const LogoutLoadingState() : super(false, "", "");
}

class LoginFailedState extends AuthenticationState {
  const LoginFailedState() : super(false, "", "");
}
