import 'package:defacto/core/controllers/store/store_cubit.dart';
import 'package:defacto/core/controllers/store/store_states.dart';
import 'package:defacto/core/network/remote/constants.dart';
import 'package:defacto/modules/screens/payment_basic.dart';
import 'package:defacto/modules/widgets/builders/cart_item.dart';
import 'package:defacto/modules/widgets/builders/defualt_botton.dart';
import 'package:defacto/modules/widgets/builders/divider.dart';
import 'package:defacto/modules/widgets/funtions/navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class Cart extends StatelessWidget {
  var searchController = TextEditingController();
  Cart({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DefactoCubit, DefactoStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = DefactoCubit.get(context);
          var cart = cubit.cart;
          var search = cubit.searchRecord;
          return Scaffold(
            appBar: AppBar(
              leading: Icon(Icons.arrow_back),
              centerTitle: true,
              title: const Text('Cart'),
              actions: [
                IconButton(
                    onPressed: () {
                      showCupertinoDialog(
                          context: context,
                          builder: (context) => Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10)),
                                child: CupertinoAlertDialog(
                                  title: const Text('Final Step'),
                                  content: Container(
                                    height: 200,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            const Text('Number of items'),
                                            Spacer(),
                                            Text('${cubit.cart.length}')
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: const [
                                            Text('Delivery'),
                                            Spacer(),
                                            Text('0.75')
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            const Text('Total'),
                                            Spacer(),
                                            Text('$sumPrice')
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        DefaultButton(
                                            borderColor: Colors.white,
                                            backgroundColor: Colors.black,
                                            buttonWidget: const Text(
                                              'Confirm Order',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            function: (){
                                              cubit.sendOrderData();
                                              navigateTo(
                                                  context,
                                                  PaymentBasic(
                                                    price: sumPrice,
                                                  ));
                                            }),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        DefaultButton(
                                            borderColor: Colors.black,
                                            backgroundColor: Colors.white,
                                            buttonWidget: const Text(
                                              'Recheck',
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                            function: () {
                                              Navigator.pop(context);
                                            })
                                      ],
                                    ),
                                  ),
                                ),
                              ));
                    },
                    icon: const Icon(Icons.checklist_rtl_outlined))
              ],
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
                              hintText: 'Search By Name',
                              prefixIcon: Icon(
                                Icons.search_outlined,
                                color: Colors.black,
                              )),
                          onChanged: (value) {
                            cubit.getSpecialRecord(value);
                          },
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Search Result',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  if (cubit.searchRecord.isEmpty)
                    Center(child: SvgPicture.asset('images/search.svg')),
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) =>
                        buildCartItem(search[index], context),
                    separatorBuilder: (context, index) => const BuildDivider(),
                    itemCount: search.length,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Added Items',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  if(cubit.cart.isEmpty)
                    Lottie.asset('lottie/empty.json'),
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) =>
                        buildCartItem(cart[index], context),
                    separatorBuilder: (context, index) => const BuildDivider(),
                    itemCount: cart.length,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
