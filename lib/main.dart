import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluto/constants/constants.dart';

import 'package:pluto/features/authentication/presentation/widget/login.dart';

import 'package:pluto/routes/route.dart';
import 'features/authentication/presentation/state/authentication/authentication_bloc.dart';
import 'features/feed/presentation/main_feed.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authenticationBloc =
        BlocProvider<AuthenticationBloc>(create: (context) {
      return AuthenticationBloc();
    });
    return MultiBlocProvider(
        providers: [authenticationBloc], child: const AppView());
  }
}

class AppView extends StatefulWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  @override
  Widget build(BuildContext context) {
    context.read<AuthenticationBloc>().add(const InitLoginEvent());
    return MaterialApp(
      title: Constant.pluto,
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          // if (state is LoginState) {
          //   ScaffoldMessenger.of(context)
          //       .showSnackBar(SnackBar(content: Text('LoginState')));
          // }
          // if (state is LogoutState) {
          //   ScaffoldMessenger.of(context)
          //       .showSnackBar(SnackBar(content: Text('LogoutState')));
          // }
          // if (state is LoginFailedState) {
          //   ScaffoldMessenger.of(context)
          //       .showSnackBar(SnackBar(content: Text('Authentication Failed')));
          // }
        },
        builder: ((context, state) {
          if (state is LoginState || state is LogoutLoadingState) {
            return MainFeedPage(
              title: state.userName,
            );
          }
          return const LoginWidget();
        }),
      ),
    );
  }
}

// Don't user
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pluto',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: homePage,
      routes: {
        loginPage: (context) => const LoginWidget(),
      },
    );
  }
}
