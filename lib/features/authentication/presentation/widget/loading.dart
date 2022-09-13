import 'package:flutter/material.dart';

class LoadingWidget {
  static Widget loadingL(BuildContext context) {
    return Center(
      child: Container(
          width: MediaQuery.of(context).size.width * 0.60,
          height: MediaQuery.of(context).size.width * 0.60,
          color: Colors.white.withOpacity(.1),
          child: const CircularProgressIndicator()),
    );
  }

  static Widget loadingM(BuildContext context) {
    return Center(
      child: Container(
          width: MediaQuery.of(context).size.width * 0.40,
          height: MediaQuery.of(context).size.width * 0.40,
          color: Colors.white.withOpacity(.1),
          child: const CircularProgressIndicator()),
    );
  }

  static Widget loadingS(BuildContext context) {
    return Center(
      child: Container(
          width: MediaQuery.of(context).size.width * 0.25,
          height: MediaQuery.of(context).size.width * 0.25,
          color: Colors.white.withOpacity(.1),
          child: const CircularProgressIndicator()),
    );
  }
}
