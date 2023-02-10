import 'package:defacto/core/controllers/store/store_cubit.dart';
import 'package:defacto/core/controllers/store/store_states.dart';
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
            return const Scaffold(
              body: Center(
                child: Text('Products'),
              ),
            );
          }
        }
    );
  }
}
