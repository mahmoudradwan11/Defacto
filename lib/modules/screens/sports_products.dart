import 'package:defacto/core/controllers/store/store_cubit.dart';
import 'package:defacto/core/controllers/store/store_states.dart';
import 'package:defacto/modules/widgets/builders/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SportsProducts extends StatelessWidget {
  const SportsProducts({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DefactoCubit, DefactoStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = DefactoCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Sports ',
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Container(
                  color: Colors.white,
                  child: GridView.count(
                    childAspectRatio: 1 / 1.17,
                    mainAxisSpacing: 1.0,
                    crossAxisSpacing: 1.0,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    children: List.generate(
                        cubit.homeModel!.data!.products!.length,
                        (index) => buildProductItem(
                            cubit.homeModel!.data!.forYou![index], context)),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
