import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/constants.dart';
import '../../authentication/presentation/state/authentication/authentication_bloc.dart';

class AppBarLayout {
  static AppBar getAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: const Text(
        Constant.pluto,
        style: TextStyle(
          color: Colors.blue,
        ),
      ),
      actions: [
        Container(
          alignment: Alignment.center,
          width: 50,
          height: 40,
          child: ElevatedButton(
            onPressed: () {
              context.read<AuthenticationBloc>().add(const LogoutEvent());
            },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              primary: Colors.white70,
            ),
            child: const Icon(Icons.logout, color: Colors.black),
          ),
        )
      ],
    );
  }
}
