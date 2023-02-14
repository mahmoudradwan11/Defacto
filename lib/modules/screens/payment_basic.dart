import 'package:defacto/core/controllers/payment/payment_cubit.dart';
import 'package:defacto/core/controllers/payment/payment_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentBasic extends StatelessWidget {
  const PaymentBasic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentStates>(
        listener: (context, state) {},
    builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:const Text(
            'Payment With Defacto',
          ),
        ),
      );
    }
    );
  }
}
