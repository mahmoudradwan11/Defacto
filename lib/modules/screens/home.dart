import 'package:defacto/core/controllers/store/store_cubit.dart';
import 'package:defacto/core/controllers/store/store_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

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
            bottomNavigationBar:Padding(
              padding: const EdgeInsets.only(left:10,right: 10,bottom: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left:5,right: 5,bottom: 5,top:5),
                  child: GNav(

                    tabBorderRadius:20,
                    gap:5,
                    backgroundColor: Colors.black,
                    color: Colors.white,
                    activeColor: Colors.black,
                    tabBackgroundColor: Colors.white,
                    onTabChange:(index)
                    {
                      cubit.changeIndex(index);
                    },
                    padding:const EdgeInsets.all(10),
                    tabs:cubit.tabs,
                  ),
                ),
              ),
            ),
          );
        });
  }
}
