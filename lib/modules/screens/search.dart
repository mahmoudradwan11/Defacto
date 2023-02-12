import 'package:defacto/core/controllers/store/store_cubit.dart';
import 'package:defacto/core/controllers/store/store_states.dart';
import 'package:defacto/modules/widgets/builders/divider.dart';
import 'package:defacto/modules/widgets/builders/search_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DefactoCubit, DefactoStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = DefactoCubit.get(context);
          if (cubit.searchModel == null) {
            return Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  title: const Text(
                      'Find Your Product'
                  ),
                ),
                body: Center(
                  child:SvgPicture.asset('images/bro.svg')
                ));
          } else {
            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: const Text(
                    'Find Your Product'
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView.separated(
                    itemBuilder:(context,index)=>buildSearchItem(cubit.searchModel!.data!.data![index],context),
                    separatorBuilder:(context,index)=>const BuildDivider(),
                    itemCount:cubit.searchModel!.data!.data!.length
                ),
              ),
            );
          }
        }
    );
  }
}
