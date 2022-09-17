import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluto/constants/constants.dart';

import 'package:pluto/features/authentication/presentation/widget/login.dart';
import 'package:pluto/features/register/presentation/state/register/register_bloc.dart';
import 'package:pluto/features/register/presentation/widget/register_page.dart';

import 'package:pluto/routes/route.dart';
import 'features/authentication/presentation/state/authentication/authentication_bloc.dart';
import 'features/authentication/presentation/widget/authentication.dart';

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
    final registerBloc = BlocProvider<RegisterBloc>(create: (context) {
      return RegisterBloc();
    });
    return MultiBlocProvider(
        providers: [authenticationBloc, registerBloc], child: const AppView());
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
      initialRoute: '/authentication',
      routes: {
        '/authentication': (context) => const AuthenticationPage(),
        '/register': (context) => const RegisterPage(),
      },
      // home: AuthenticationPage(),
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
