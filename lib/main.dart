import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pluto/features/authentication/presentation/widget/login.dart';

import 'package:pluto/routes/route.dart';
import 'features/authentication/presentation/state/authentication/authentication_bloc.dart';

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
    context.read<AuthenticationBloc>().add(LogoutEvent());
    return MaterialApp(
      title: 'Pluto',
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
          if (state is LoginState) {
            return MyHomePage(
              title: state.email,
            );
          }
          return const LoginWidget();
        }),
      ),
    );
  }
}

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
        homePage: (context) => const MyHomePage(title: 'Home Page'),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headline4,
                ),
                SizedBox(
                  width: 120,
                  height: 60,
                  child: TextButton(
                    onPressed: () {
                      context.read<AuthenticationBloc>().add(LogoutEvent());
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                    ),
                    child: const Text(
                      'Log Out',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
