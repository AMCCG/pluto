class AuthenticationState {
  String username;
  bool isLogin;
  AuthenticationState({required this.isLogin, required this.username});
}

class LoginState extends AuthenticationState {
  LoginState(username) : super(isLogin: true, username: username);
}

class LogoutState extends AuthenticationState {
  LogoutState() : super(isLogin: false, username: "");
}
