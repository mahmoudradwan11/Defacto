import 'package:defacto/core/controllers/register/register_cubit.dart';
import 'package:defacto/core/controllers/register/register_states.dart';
import 'package:defacto/core/network/local/cache.dart';
import 'package:defacto/core/network/remote/constants.dart';
import 'package:defacto/modules/screens/home.dart';
import 'package:defacto/modules/screens/login.dart';
import 'package:defacto/modules/widgets/builders/default_form_feild.dart';
import 'package:defacto/modules/widgets/builders/defualt_botton.dart';
import 'package:defacto/modules/widgets/funtions/navigator.dart';
import 'package:defacto/modules/widgets/funtions/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Register extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            if (state.loginModel.status!) {
              print(state.loginModel.message);
              showToast(state.loginModel.message!, ToastStates.SUCCESS);
              print(state.loginModel.data!.token);
              CacheHelper.saveData(
                key: 'token',
                value: state.loginModel.data!.token,
              ).then((value) {
                token = state.loginModel.data!.token!;
                navigateAndFinish(
                  context,
                  const Home(),
                );
              });
            } else {
              print(state.loginModel.message);
            }
          }
        },
        builder: (context, state) {
          var cubit = RegisterCubit.get(context);
          return Scaffold(
              body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 100),
                    const Text(
                      'Create Account',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text('Create Account with '),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          FaIcon(
                            FontAwesomeIcons.facebook,
                            color: Colors.blue,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          FaIcon(
                            FontAwesomeIcons.twitter,
                            color: Colors.blue,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          FaIcon(FontAwesomeIcons.apple),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text('or'),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      width: 350,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black)),
                      child: defaultFieldForm(
                          controller: nameController,
                          keyboard: TextInputType.text,
                          valid: (value) {
                            if (value.isEmpty) {
                              return 'Please Enter Your name';
                            }
                            return null;
                          },
                          prefix: Icons.person,
                          hint: 'Full Name',
                          hintStyle: const TextStyle(color: Colors.grey),
                          show: false),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 50,
                      width: 350,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black)),
                      child: defaultFieldForm(
                          controller: phoneController,
                          keyboard: TextInputType.phone,
                          valid: (value) {
                            if (value.isEmpty) {
                              return 'Please Enter Your phone';
                            }
                            return null;
                          },
                          prefix: Icons.phone,
                          hint: 'phone',
                          hintStyle: const TextStyle(color: Colors.grey),
                          show: false),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 50,
                      width: 350,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black)),
                      child: defaultFieldForm(
                          controller: emailController,
                          keyboard: TextInputType.emailAddress,
                          valid: (value) {
                            if (value.isEmpty) {
                              return 'Please Enter Your Email';
                            }
                            return null;
                          },
                          prefix: Icons.email,
                          hint: 'Email',
                          hintStyle: const TextStyle(color: Colors.grey),
                          show: false),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 50,
                      width: 350,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black)),
                      child: defaultFieldForm(
                          controller: passwordController,
                          keyboard: TextInputType.emailAddress,
                          valid: (value) {
                            if (value.isEmpty) {
                              return 'Please Enter Your password';
                            }
                            return null;
                          },
                          prefix: Icons.lock,
                          hint: 'password',
                          hintStyle: const TextStyle(color: Colors.grey),
                          show: cubit.isPassword,
                          suffix: cubit.suffix,
                          suffixPress: () {
                            cubit.changePasswordVisibility();
                          }),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    DefaultButton(
                      backgroundColor: Colors.black,
                      buttonWidget: const Text(
                        'Create Account',
                        style: TextStyle(color: Colors.white),
                      ),
                      function: () {
                        if (formKey.currentState!.validate()) {
                          cubit.userRegister(
                              email: emailController.text,
                              name: nameController.text,
                              phone: phoneController.text,
                              password: passwordController.text);
                        }
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    DefaultButton(
                      backgroundColor: Colors.white,
                      buttonWidget: const Text(
                        'sign in ',
                        style: TextStyle(color: Colors.black),
                      ),
                      function: () {
                        navigateTo(context, Login());
                      },
                    )
                  ],
                ),
              ),
            ),
          ));
        },
      ),
    );
  }
}
