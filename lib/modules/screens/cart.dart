import 'package:defacto/core/controllers/store/store_cubit.dart';
import 'package:defacto/core/controllers/store/store_states.dart';
import 'package:defacto/modules/widgets/builders/cart_item.dart';
import 'package:defacto/modules/widgets/builders/divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Cart extends StatelessWidget {
  var searchController  = TextEditingController();
   Cart({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DefactoCubit, DefactoStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = DefactoCubit.get(context);
          var cart = cubit.cart;
          var search = cubit.searchRecord;
          return  Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text('Cart'),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
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
                              hintText: 'Search By Price',
                              prefixIcon: Icon(
                                Icons.search_outlined,
                                color: Colors.black,
                              )),
                          onSubmitted: (value) {
                            cubit.getSpicalRecord(value);
                            //navigateTo(context,const SearchScreen());
                          },
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding:  EdgeInsets.all(8.0),
                    child:  Text('Search Result',style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),),
                  ),
                  if(cubit.searchRecord.isEmpty)
                    Center(child: SvgPicture.asset('images/bro.svg')),
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder:(context,index)=>buildCartItem(search[index],context),
                      separatorBuilder:(context,index)=>BuildDivider(),
                      itemCount: search.length,
                  ),
                  const Padding(
                    padding:  EdgeInsets.all(8.0),
                    child:  Text('Added Items',style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                  ListView.separated(
                    physics:const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder:(context,index)=>buildCartItem(cart[index],context),
                    separatorBuilder:(context,index)=>BuildDivider(),
                    itemCount: cart.length,
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
}
