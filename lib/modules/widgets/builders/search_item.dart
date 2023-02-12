import 'package:defacto/models/store_models/search_model.dart';
import 'package:flutter/material.dart.';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget buildSearchItem(SearchData searchModel)=>Container(
  color: Colors.grey[200],
  child: Row(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 120,
          height: 130,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: NetworkImage(searchModel.image!),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      const SizedBox(
        width: 20,
      ),
      Expanded(
        child: Container(
          height: 130,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                searchModel.name!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize:18,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10,),
              Text('${searchModel.price}',style: const TextStyle(fontSize: 18),),
              Row(
                textBaseline: TextBaseline.alphabetic,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                children:const [
                  FaIcon(FontAwesomeIcons.star,color: Colors.amber,),
                  SizedBox(width: 10,),
                  Text('5.0',style: TextStyle(fontSize: 15),)
                ],
              )
            ],
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10)
        ),
        height: 130,
        width:50,
        child: IconButton(
           onPressed:(){},
           icon: Icon(Icons.shopping_cart_sharp,color: Colors.white,size: 30,),
        ),
      ),
    ],
  ),
);