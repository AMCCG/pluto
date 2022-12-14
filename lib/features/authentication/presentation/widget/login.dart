import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluto/features/authentication/presentation/widget/loading.dart';
import '../state/authentication/authentication_bloc.dart';

import 'login_form.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: MediaQuery.of(context).size.width * double.infinity,
        height: MediaQuery.of(context).size.width * double.infinity,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  BlocBuilder<AuthenticationBloc, AuthenticationState>(
                      builder: (context, state) {
                    if (state is AuthenticationInitialLoadingState) {
                      return LoadingWidget.loadingM(context);
                    } else {
                      return const LoginForm();
                    }
                  }),
                  BlocBuilder<AuthenticationBloc, AuthenticationState>(
                      builder: (context, state) {
                    if (state is LoginLoadingState) {
                      return LoadingWidget.loadingM(context);
                    }
                    if (state is LoginFailedState) {
                      return AlertDialog(
                        title: const Text('Authentication Failed'),
                        content: const Text('login failed'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              context
                                  .read<AuthenticationBloc>()
                                  .add(const LogoutEvent());
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    }
                    return const SizedBox();
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
