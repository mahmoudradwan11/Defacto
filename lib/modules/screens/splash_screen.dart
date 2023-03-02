import 'dart:async';
import 'package:defacto/modules/widgets/funtions/navigator.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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
    _timer = Timer(const Duration(seconds: 5), _goNext);
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
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset('lottie/shopping.json',height: 300,
              ),
            ],
          ),
        )
    );
  }

  @override
  dispose() {
    _timer!.cancel();
    super.dispose();
  }
}
