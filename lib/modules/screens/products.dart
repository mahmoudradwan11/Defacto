import 'package:defacto/core/controllers/store/store_cubit.dart';
import 'package:defacto/core/controllers/store/store_states.dart';
import 'package:defacto/modules/screens/search.dart';
import 'package:defacto/modules/widgets/builders/banner.dart';
import 'package:defacto/modules/widgets/funtions/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'notefication.dart';

class ProductsScreen extends StatelessWidget {
  var searchController = TextEditingController();
  ProductsScreen({Key? key}) : super(key: key);

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
            ));
          } else {
            return Scaffold(
                appBar: AppBar(
                  actions: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: IconButton(
                          onPressed: () {
                            navigateTo(context, const NotificationScreen());
                          },
                          icon: const Icon(
                              Icons.notification_important_outlined)),
                    )
                  ],
                ),
                body: SingleChildScrollView(
                    child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              height: 55,
                              child: Center(
                                child: TextField(
                                  controller: searchController,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Search For Products',
                                      prefixIcon: Icon(
                                        Icons.search_outlined,
                                        color: Colors.black,
                                      )),
                                  onSubmitted: (value) {
                                    cubit.search(value);
                                    navigateTo(context,const SearchScreen());
                                  },
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                              height: 50,
                              width: 40,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black)),
                              child: const Icon(Icons.filter_list))
                        ],
                      ),
                    ),
                    Container(
                        height: 200, child: buildBanner(cubit.homeModel!)),
                  ],
                )));
          }
        });
  }
}
