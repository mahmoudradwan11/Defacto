import 'package:defacto/core/controllers/store/store_cubit.dart';
import 'package:defacto/core/controllers/store/store_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:badges/badges.dart' as badges;

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DefactoCubit, DefactoStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = DefactoCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              items: [
                const BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.house),
                  label: 'Home',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_border),
                  label: 'Favorite',
                ),
                BottomNavigationBarItem(
                  icon: badges.Badge(
                    badgeAnimation: const badges.BadgeAnimation.slide(
                      animationDuration: Duration(seconds: 1),
                      colorChangeAnimationDuration: Duration(seconds: 1),
                      loopAnimation: false,
                      curve: Curves.fastOutSlowIn,
                      colorChangeAnimationCurve: Curves.easeInCubic,
                    ),
                    position: badges.BadgePosition.topEnd(top: -15, end: -12),
                    badgeStyle: badges.BadgeStyle(
                      padding: const EdgeInsets.all(3),
                      borderRadius: BorderRadius.circular(4),
                      badgeColor: Colors.red,
                    ),
                    badgeContent: Text(
                      '${cubit.cart.length}',
                      style: const TextStyle(color: Colors.white),
                    ),
                    child: const Icon(
                      Icons.add_shopping_cart,
                    ),
                  ),
                  label: 'Cart',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeIndex(index);
              },
            ),
          );
        });
  }
}
