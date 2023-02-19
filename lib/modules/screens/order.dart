import 'package:defacto/core/controllers/store/store_cubit.dart';
import 'package:defacto/core/controllers/store/store_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderHistory extends StatelessWidget {
  const OrderHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DefactoCubit, DefactoStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
          appBar: AppBar(
            title:const Text('Order History'),
            centerTitle: true,
          ),
    );
    }
    );
  }
}
