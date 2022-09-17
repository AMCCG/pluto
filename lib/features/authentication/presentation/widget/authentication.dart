import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../feed/presentation/main_feed.dart';
import '../state/authentication/authentication_bloc.dart';
import 'login.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({Key? key}) : super(key: key);

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          buildAuthenticationBlocConsumer(),
        ],
      ),
    );
  }

  BlocConsumer<AuthenticationBloc, AuthenticationState>
      buildAuthenticationBlocConsumer() {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is LogoutState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('LogoutState')));
        }
      },
      builder: (context, state) {
        if (state is LoginState || state is LogoutLoadingState) {
          return MainFeedPage(
            title: state.userName,
          );
        }
        return const LoginWidget();
      },
    );
  }
}
