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
      bottom: _generatePreferredSize(),
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

  static PreferredSize _generatePreferredSize() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Container(
              height: 50,
              child: TextButton(
                onPressed: () {},
                child: const Icon(Icons.home, color: Colors.black),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 50,
              child: TextButton(
                onPressed: () {},
                child: const Icon(Icons.group, color: Colors.black),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 50,
              child: TextButton(
                onPressed: () {},
                child: const Icon(Icons.ondemand_video_rounded,
                    color: Colors.black),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 50,
              child: TextButton(
                onPressed: () {},
                child: const Icon(Icons.feed_outlined, color: Colors.black),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 50,
              child: TextButton(
                onPressed: () {},
                child: const Icon(Icons.notifications, color: Colors.black),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 50,
              child: TextButton(
                onPressed: () {},
                child: const Icon(Icons.menu, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
