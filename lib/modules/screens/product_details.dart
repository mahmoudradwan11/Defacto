import 'package:defacto/core/controllers/store/store_cubit.dart';
import 'package:defacto/core/controllers/store/store_states.dart';
import 'package:defacto/modules/screens/payment_basic.dart';
import 'package:defacto/modules/widgets/builders/defualt_botton.dart';
import 'package:defacto/modules/widgets/funtions/navigator.dart';
import 'package:defacto/modules/widgets/funtions/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetails extends StatelessWidget {
  var model;
  var imagesController = PageController();
  ProductDetails({Key? key, this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DefactoCubit, DefactoStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = DefactoCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text('Product Details'),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Container(
                        height: 300,
                        width: double.infinity,
                        color: Colors.white,
                        child: PageView.builder(
                          itemBuilder: (context, index) => Container(
                            //height: 100,
                            child: Image(
                              height: 100,
                              image: NetworkImage(model!.images![index]),
                            ),
                          ),
                          itemCount: model!.images!.length,
                          controller: imagesController,
                        ),
                      ),
                      Positioned(
                        top: 10,
                        right: 10,
                        child: IconButton(
                            onPressed: () {
                            },
                            icon: const Icon(
                              Icons.favorite_border,
                              color:Colors.grey,
                              size: 30,
                            )),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: AlignmentDirectional.center,
                    child: SmoothPageIndicator(
                        effect: JumpingDotEffect(
                          dotColor: Colors.grey[400]!,
                          activeDotColor: Colors.black,
                          dotHeight: 12,
                          dotWidth: 12,
                          // expansionFactor: 4,
                          spacing: 5.0,
                        ),
                        controller: imagesController,
                        count: model!.images!.length),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            model.name!,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        const Icon(Icons.star, color: Colors.amber),
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        const Icon(Icons.star, color: Colors.amber),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Container(
                            decoration: const BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    topLeft: Radius.circular(10))),
                            height: 50,
                            child: IconButton(
                                onPressed: () {
                                  model.counter--;
                                  cubit.updateCounter();
                                },
                                icon: const Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ))),
                        Container(
                            height: 50,
                            width: 50,
                            color: Colors.grey[400],
                            child: Center(
                                child: Text(
                              '${model.counter}',
                              style: const TextStyle(fontSize: 25),
                            ))),
                        Container(
                            decoration: const BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(10),
                                    topRight: Radius.circular(10))),
                            child: IconButton(
                                onPressed: () {
                                  model.counter++;
                                  cubit.updateCounter();
                                },
                                icon: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ))),
                        Spacer(),
                        Text(
                          '${model.price!}',
                          style: const TextStyle(
                              fontSize: 18, color: Colors.black),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        if (model.discount != 0)
                          Text('${model.oldPrice!}',
                              style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough)),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Select Color',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: const [
                        CircleAvatar(
                          backgroundColor: Colors.red,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.yellow,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.black,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.blue,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.green,
                        )
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Select Size',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(30)),
                          child: const CircleAvatar(
                            backgroundColor: Colors.transparent,
                            child: Text(
                              'S',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(30)),
                          child: const CircleAvatar(
                            backgroundColor: Colors.transparent,
                            child: Text(
                              'M',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(30)),
                          child: const CircleAvatar(
                            backgroundColor: Colors.transparent,
                            child: Text(
                              'L',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(30)),
                          child: const CircleAvatar(
                            backgroundColor: Colors.transparent,
                            child: Text(
                              'XL',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(30)),
                          child: const CircleAvatar(
                            backgroundColor: Colors.transparent,
                            child: Text(
                              '2XL',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Description',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  if (cubit.more == false)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            model.description!,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          TextButton(
                              onPressed: () {
                                cubit.changeMore();
                              },
                              child: const Text('see more',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                  ))),
                        ],
                      ),
                    ),
                  if (cubit.more == true)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(model.description!),
                          TextButton(
                              onPressed: () {
                                cubit.changeMoreLess();
                              },
                              child: const Text(
                                'see less',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15),
                              ))
                        ],
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: DefaultButton(
                      buttonWidget: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          FaIcon(
                            FontAwesomeIcons.sellcast,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Order Now',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      function: () {
                        navigateTo(context, PaymentBasic(price: model.price,));
                        cubit.sendOrderData();
                      },
                      backgroundColor: Colors.black,
                      borderColor: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DefaultButton(
                      buttonWidget: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.shopping_cart_sharp,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Add To card',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                      function: () {
                        if(model.inCart == false) {
                          cubit.insertCart(
                              name: model.name!,
                              price: model.price!.toString(),
                              image: model.image!,
                              counter: model.counter!,
                              exit: true
                          );
                          model.inCart = true;
                          cubit.updateState();
                          cubit.addSum(model.price, model.counter);
                          showToast('Inserted', ToastStates.SUCCESS);
                        }else{
                          showToast('Already In Cart', ToastStates.ERROR);
                        }
                      },
                      backgroundColor: Colors.white,
                      borderColor: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}