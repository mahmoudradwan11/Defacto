import 'package:defacto/core/controllers/store/store_cubit.dart';
import 'package:defacto/modules/widgets/builders/diraction.dart';
import 'package:defacto/modules/widgets/funtions/toast.dart';
import 'package:flutter/material.dart';

Widget buildCartItem(Map model, context) => Dismissible(
  key: Key(model['id'].toString()),
  direction: DismissDirection.endToStart,
  background: buildDirectionalDismess(),
  onDismissed:(direction){
    DefactoCubit.get(context).deleteCartData(id: model['id']);
    showToast('Deleted', ToastStates.ERROR);
  },
  child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.grey[300],
          child: Row(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage('${model['image']}'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 107,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '${model['name']}',
                          style: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              '${model['price']}',
                              style: const TextStyle(
                                  color: Colors.black, fontWeight: FontWeight.w500),
                            ),
                            Spacer(),
                            Row(
                              children: [
                                const Text('Count : '),
                                Text(
                                  '${model['counter']}',
                                  style: const TextStyle(
                                    color: Colors.black, fontWeight: FontWeight.w500,),
                                ),
                              ],
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
);
