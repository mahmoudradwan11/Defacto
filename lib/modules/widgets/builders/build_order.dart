import 'package:defacto/core/controllers/store/store_cubit.dart';
import 'package:defacto/models/store_models/order_model.dart';
import 'package:flutter/material.dart';

Widget buildOrderItem(OrderData order, date, context) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          height: 100,
          decoration: BoxDecoration(
              color: Colors.grey[300],
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(10)),
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      const Text(
                        'Order Date:',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      const Spacer(),
                      Text('${order.date}'),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      const Text(
                        'Customer Name:',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      Spacer(),
                      Text(DefactoCubit.get(context).userModel!.data!.name!),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      const Text(
                        'Order Status:',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      const Spacer(),
                      if (date == order.date) const Text('New'),
                      if (date != order.date) const Text('achieved')
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
