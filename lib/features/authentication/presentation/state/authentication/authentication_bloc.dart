import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/user.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  AuthenticationBloc() : super(const AuthenticationInitial()) {
    on<InitLoginEvent>((event, emit) async {
      emit(const AuthenticationInitialLoadingState());
      await Future.delayed(const Duration(seconds: 2), () {});
      final SharedPreferences prefs = await _prefs;
      String userJsonString = prefs.getString("user") ?? "";
      if (userJsonString == "") {
        emit(const LogoutState());
      } else {
        Map<String, dynamic> userMap = jsonDecode(userJsonString);
        User userDecode = User.fromJson(userMap);
        User user = User(
            email: userDecode.email,
            userName: "${userDecode.userName}_InitLoginEvent");
        emit(LoginState(
            isLogin: true, email: user.email, userName: user.userName));
      }
    });

    on<LoginEvent>((event, emit) async {
      emit(const LoginLoadingState());
      final SharedPreferences prefs = await _prefs;
      await Future.delayed(const Duration(seconds: 2), () {});
      if (event.email == "pluto1@microservice.com" &&
          event.password == "123456") {
        String userName = "Pluto1";
        User user = User(email: event.email, userName: userName);
        String json = jsonEncode(user);
        prefs.setString("user", json);
        emit(LoginState(
            isLogin: true, email: user.email, userName: user.userName));
      } else {
        emit(const LoginFailedState());
      }
    });
    on<LogoutEvent>((event, emit) async {
      emit(const LogoutLoadingState());
      await Future.delayed(const Duration(seconds: 2), () {});
      final SharedPreferences prefs = await _prefs;
      prefs.clear();
      emit(const LogoutState());
    });
  }
}
