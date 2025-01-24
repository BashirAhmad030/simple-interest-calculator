import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:simple_interest_calculator/screen.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.gif(
      backgroundColor: Theme.of(context).primaryColorDark,
      gifPath: 'assets/money.png',
      gifWidth: 269,
      gifHeight: 474,
      nextScreen: const SIForm(),
      duration: const Duration(milliseconds: 3515),
      onInit: () async {
        debugPrint("onInit");
      },
      onEnd: () async {
        debugPrint("onEnd 1");
      },
    );
  }
}
