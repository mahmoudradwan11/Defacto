import 'dart:async';
import 'package:defacto/modules/widgets/funtions/navigator.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  Widget nextScreen;
  SplashScreen({Key? key, required this.nextScreen}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState(nextScreen);
}

class _SplashScreenState extends State<SplashScreen> {
  _SplashScreenState(this.nextScreen);
  Widget nextScreen;
  Timer? _timer;
  _startDelay() {
    _timer = Timer(const Duration(seconds: 3), _goNext);
  }

  void _goNext() {
    //navigateAndReplace(context,Routes.onBoardingRoute);
    navigateAndFinish(context, nextScreen);
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(
            child: Image(
          image: AssetImage('images/shopping.png'),
        )));
  }

  @override
  dispose() {
    _timer!.cancel();
    super.dispose();
  }
}
