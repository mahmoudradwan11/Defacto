import 'package:carousel_slider/carousel_slider.dart';
import 'package:defacto/models/store_models/home_model.dart';
import 'package:flutter/cupertino.dart';

Widget buildBanner(HomeModel homeModel)=>CarouselSlider(
  items: homeModel.data!.banners!.map((e) =>
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image(
          image: NetworkImage(e.image!),
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
  ).toList(),
  options: CarouselOptions(
      height: 250.0,
      initialPage: 0,
      enableInfiniteScroll: true,
      reverse: false,
      autoPlay: true,
      viewportFraction: 1.0,
      autoPlayInterval: const Duration(seconds: 3),
      autoPlayAnimationDuration: const Duration(seconds: 1),
      autoPlayCurve: Curves.fastOutSlowIn,
      scrollDirection: Axis.horizontal
  ),
);