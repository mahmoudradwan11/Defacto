import 'package:defacto/models/store_models/home_model.dart';
import 'package:defacto/modules/screens/product_details.dart';
import 'package:defacto/modules/widgets/funtions/navigator.dart';
import 'package:flutter/material.dart';
Widget buildProductItem(Products products, context) => InkWell(
      onTap: () {
        navigateTo(
            context,
            ProductDetails(
              model: products,
            ));
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.white),
            color: Colors.grey[300]),
        width: 150,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey,
                        // borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(products.image!),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Padding(
                      padding:const EdgeInsets.all(5.0),
                      child: Icon(
                        Icons.favorite,
                        color:products.inCart ?Colors.black:Colors.grey
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                products.name!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: [
                  Text('${products.price}'),
                  const Spacer(),
                  Container(
                      height:50,
                      width:60,
                      decoration:const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomRight: Radius.circular(20))
                      ),
                      child: MaterialButton(onPressed:(){},child: Text('Buy',style: TextStyle(color: Colors.white),),))
                ],
              ),
            )
          ],
        ),
      ),
    );
