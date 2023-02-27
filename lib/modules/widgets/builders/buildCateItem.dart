import 'package:defacto/core/controllers/store/store_cubit.dart';
import 'package:defacto/models/store_models/cateogry.dart';
import 'package:defacto/modules/widgets/funtions/navigator.dart';
import 'package:flutter/material.dart';

Widget buildCateItem(CateData categoryModel, context, index) => InkWell(
      onTap: () {
        navigateTo(context, DefactoCubit.get(context).categoryScreen[index]);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black)),
          height:100,
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: Image(
                  image: NetworkImage(categoryModel.image!),
                ),
              ),
              Expanded(
                child: Text(
                  categoryModel.name!,
                  style: const TextStyle(color: Colors.black, fontSize: 18),
                ),
              )
            ],
          ),
        ),
      ),
    );
