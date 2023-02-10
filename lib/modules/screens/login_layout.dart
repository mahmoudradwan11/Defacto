import 'package:defacto/modules/screens/home.dart';
import 'package:defacto/modules/screens/login.dart';
import 'package:defacto/modules/screens/register.dart';
import 'package:defacto/modules/widgets/builders/defualt_botton.dart';
import 'package:defacto/modules/widgets/funtions/navigator.dart';
import 'package:flutter/material.dart';

class LoginLayout extends StatelessWidget {
  const LoginLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Image(
            image: AssetImage('images/login.png'),
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 100,
            left: 30,
            child: DefaultButton(
                width: 150,
                borderColor: Colors.white,
                backgroundColor: Colors.transparent,
                buttonWidget: const Text(
                  'Sign in',
                  style: TextStyle(color: Colors.white),
                ),
                function: () {
                  navigateTo(context, Login());
                }),
          ),
          Positioned(
            bottom: 100,
            right: 30,
            child: DefaultButton(
                borderColor: Colors.white,
                backgroundColor: Colors.transparent,
                width: 150,
                buttonWidget: const Text(
                  'Sign up',
                  style: TextStyle(color: Colors.white),
                ),
                function: () {
                  navigateTo(context, Register());
                }),
          ),
          const Positioned(
            left: 30,
            bottom: 250,
            child: Text(
              'Sign In Or Sign Up',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 25),
            ),
          ),
          Positioned(
            left: 30,
            bottom: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'sign in if you have an account or sign up',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 15),
                ),
                Text(
                  'to create an account.',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 15),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
