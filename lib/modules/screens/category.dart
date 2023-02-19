import 'package:defacto/core/controllers/store/store_cubit.dart';
import 'package:defacto/core/controllers/store/store_states.dart';
import 'package:defacto/modules/widgets/builders/buildCateItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DefactoCubit, DefactoStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = DefactoCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              leading: Icon(Icons.arrow_back),
              centerTitle: true,
              title: const Text('Category'),
            ),
            body: SingleChildScrollView(
              child: Container(
                  color: Colors.white,
                  child: GridView.count(
                      childAspectRatio: 1 / 1,
                      mainAxisSpacing: 1.0,
                      crossAxisSpacing: 1.0,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      children: List.generate(
                          cubit.categoryModel!.data!.data!.length,
                          (index) => buildCateItem(
                              cubit.categoryModel!.data!.data![index],
                              context,
                              index)))),
            ),
          );
        });
  }
}
