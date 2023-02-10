import 'package:defacto/core/controllers/store/store_cubit.dart';
import 'package:defacto/core/controllers/store/store_states.dart';
import 'package:defacto/modules/widgets/builders/banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DefactoCubit, DefactoStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = DefactoCubit.get(context);
          if (cubit.homeModel == null) {
            return Scaffold(
                body: Center(
                  child: LoadingAnimationWidget.inkDrop(
                    color: Colors.black,
                    size: 30,
                  ),
                )
            );
          } else {
            return Scaffold(
              appBar: AppBar(
                title: Text('Home',style: TextStyle(fontSize: 20),),
              ),
              body:SingleChildScrollView(
                child: Column(
                  children: [
                     Container(
                       height: 200,
                         child: buildBanner(cubit.homeModel!)),
                  ],
                )
              )
              );
          }
        }
    );
  }
}

