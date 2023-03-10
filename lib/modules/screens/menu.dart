import 'package:defacto/core/controllers/store/store_cubit.dart';
import 'package:defacto/core/controllers/store/store_states.dart';
import 'package:defacto/modules/screens/cantact.dart';
import 'package:defacto/modules/screens/order.dart';
import 'package:defacto/modules/widgets/funtions/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);
  @override
  State<MenuPage> createState() => _MenuPageState();
}
class _MenuPageState extends State<MenuPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DefactoCubit.get(context).getUserData();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DefactoCubit, DefactoStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = DefactoCubit.get(context);
          return Scaffold(
              backgroundColor: Colors.grey[200],
              body: Padding(
                padding: const EdgeInsets.only(left: 30, top: 30),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 100,
                        width: double.infinity,
                        child: Row(
                          children: [
                            const CircleAvatar(
                                radius: 40,
                                backgroundImage: AssetImage('images/user.png')),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${cubit.userModel!.data!.name}',
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  '${cubit.userModel!.data!.phone}',
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 18),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: Container(
                          width: 300,
                          child: ListView(
                            physics: const BouncingScrollPhysics(),
                            children: [
                              Container(
                                color: Colors.transparent,
                                height: 50,
                                width: 300,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: const [
                                    Icon(
                                      Icons.location_on_outlined,
                                      size: 30,
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Text(
                                      'Cario',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                color: Colors.transparent,
                                height: 50,
                                width: 300,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: const [
                                    Icon(
                                      Icons.payment_rounded,
                                      size: 30,
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Text(
                                      'Payment Method ',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  navigateTo(context, const OrderHistory());
                                },
                                child: Container(
                                  color: Colors.transparent,
                                  height: 50,
                                  width: 300,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: const [
                                      Icon(
                                        Icons.history,
                                        size: 30,
                                      ),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Text(
                                        'Order History ',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                color: Colors.transparent,
                                height: 50,
                                width: 300,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: const [
                                    Icon(
                                      Icons.language,
                                      size: 30,
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Text(
                                      'Language',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    SizedBox(
                                      width: 80,
                                    ),
                                    Text(
                                      'en',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 20),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                color: Colors.transparent,
                                height: 50,
                                width: 300,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: const [
                                    Icon(
                                      Icons.notification_important,
                                      size: 30,
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Text(
                                      'Notification ',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                color: Colors.transparent,
                                height: 50,
                                width: 300,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: const [
                                    Icon(
                                      Icons.policy,
                                      size: 30,
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Text(
                                      'Policy',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  navigateTo(context, ContactUs());
                                },
                                child: Container(
                                  color: Colors.transparent,
                                  height: 50,
                                  width: 300,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: const [
                                      Icon(
                                        Icons.history,
                                        size: 30,
                                      ),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Text(
                                        'Contact Us',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 80,
                        color: Colors.transparent,
                        child: Row(
                          children: [
                            const Text(
                              'Defacto',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 25),
                            ),
                            const Spacer(),
                            Container(
                                height: 80,
                                child: Lottie.asset('lottie/defacto.json'))
                          ],
                        ),
                      )
                    ]),
              ));
        });
  }
}
