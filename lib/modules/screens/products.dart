import 'package:defacto/core/controllers/store/store_cubit.dart';
import 'package:defacto/core/controllers/store/store_states.dart';
import 'package:defacto/modules/screens/search.dart';
import 'package:defacto/modules/widgets/builders/banner.dart';
import 'package:defacto/modules/widgets/builders/product_item.dart';
import 'package:defacto/modules/widgets/funtions/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'notefication.dart';
import 'package:badges/badges.dart' as badges;

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
                size: 20,
              ),
            ));
          } else {
            return Scaffold(
                appBar: AppBar(
                  title: Row(
                    children:const [
                      Text('Shopping with'),
                      SizedBox(
                        width: 5,
                      ),
                      Text('Defacto',style: TextStyle(
                        color: Colors.red
                      ),),
                    ],
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: IconButton(
                          onPressed: () {
                            navigateTo(context, const NotificationScreen());
                          },
                          icon: badges.Badge(
                            badgeAnimation:const badges.BadgeAnimation.slide(
                              animationDuration: Duration(seconds: 1),
                              colorChangeAnimationDuration: Duration(seconds: 1),
                              loopAnimation: false,
                              curve: Curves.fastOutSlowIn,
                              colorChangeAnimationCurve: Curves.easeInCubic,
                            ),
                            position: badges.BadgePosition.topEnd(top: -15, end: -12),
                            badgeStyle: badges.BadgeStyle(
                              padding: const EdgeInsets.all(3),
                              borderRadius: BorderRadius.circular(4),
                              badgeColor: Colors.red,
                            ),
                            badgeContent: Text('${cubit.notificationModel!.data!.data!.length}',style: const TextStyle(
                              color: Colors.white
                            ),),
                            child: const Icon(Icons.notification_important_outlined),
                          )
                      ),
                    )
                  ],
                ),
                body: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
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
                                  borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.black)),
                                child: const Icon(Icons.filter_list))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            height: 200, child: buildBanner(cubit.homeModel!)),
                      ),
                      const Padding(
                        padding:  EdgeInsets.all(8.0),
                        child: Text('Offer of Today',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 220,
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder:(context,index)=>buildProductItem(cubit.homeModel!.data!.popular![index],context),
                              separatorBuilder:(context,index)=>Container(
                                height: 200,
                                width: 10,
                                color: Colors.white,
                              ),
                              itemCount:cubit.homeModel!.data!.popular!.length
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Suggested For you',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 220,
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder:(context,index)=>buildProductItem(cubit.homeModel!.data!.products![index],context),
                              separatorBuilder:(context,index)=>Container(
                                height: 200,
                                width: 10,
                                color: Colors.white,
                              ),
                              itemCount:cubit.homeModel!.data!.products!.length
                          ),
                        ),
                      ),
                      const Padding(
                        padding:  EdgeInsets.all(8.0),
                        child: Text('Best Seller ',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 220,
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder:(context,index)=>buildProductItem(cubit.homeModel!.data!.exclusive![index],context),
                              separatorBuilder:(context,index)=>Container(
                                height: 200,
                                width: 10,
                                color: Colors.white,
                              ),
                              itemCount:cubit.homeModel!.data!.exclusive!.length
                          ),
                        ),
                      ),
                      const Padding(
                        padding:  EdgeInsets.all(8.0),
                        child: Text('Exclusive',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 220,
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder:(context,index)=>buildProductItem(cubit.homeModel!.data!.forYou![index],context),
                              separatorBuilder:(context,index)=>Container(
                                height: 200,
                                width: 10,
                                color: Colors.white,
                              ),
                              itemCount:cubit.homeModel!.data!.forYou!.length
                          ),
                        ),
                      ),
                    ],
                  )),
                ));
          }

        });
  }
}
