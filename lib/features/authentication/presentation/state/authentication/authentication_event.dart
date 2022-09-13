part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  final String email;
  final String password;

  const AuthenticationEvent(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}

class InitLoginEvent extends AuthenticationEvent {
  const InitLoginEvent() : super('', '');
}

class LoginEvent extends AuthenticationEvent {
  const LoginEvent(email, password) : super(email, password);
}

class LogoutEvent extends AuthenticationEvent {
  const LogoutEvent() : super('', '');
}

class LoginFailedEvent extends AuthenticationEvent {
  const LoginFailedEvent() : super('', '');
}
