class AuthenticationState {
  String email;
  String userName;
  bool isLogin;
  AuthenticationState(
      {required this.isLogin, required this.email, required this.userName});
}

class LoginState extends AuthenticationState {
  LoginState(email, userName)
      : super(isLogin: true, email: email, userName: userName);
}

class LogoutState extends AuthenticationState {
  LogoutState() : super(isLogin: false, email: "", userName: "");
}

class LoginFailedState extends AuthenticationState {
  LoginFailedState() : super(isLogin: false, email: "", userName: "");
}
