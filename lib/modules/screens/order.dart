import 'package:defacto/core/controllers/store/store_cubit.dart';
import 'package:defacto/core/controllers/store/store_states.dart';
import 'package:defacto/modules/widgets/builders/build_order.dart';
import 'package:defacto/modules/widgets/builders/divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class OrderHistory extends StatelessWidget {
  const OrderHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DefactoCubit, DefactoStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = DefactoCubit.get(context);
          return Scaffold(
          appBar: AppBar(
            title:const Text('Order History'),
            centerTitle: true,
          ),
            body: ListView.separated(
                itemBuilder:(context,index)=>buildOrderItem(cubit.orderModel!.data!.data![index],
                  DateFormat('dd / MM / yyyy').format(DateTime.now()),context,
                ),
                separatorBuilder:(context,index)=>const BuildDivider(),
                itemCount:cubit.orderModel!.data!.data!.length
            ),
    );
    }
    );
  }
}
