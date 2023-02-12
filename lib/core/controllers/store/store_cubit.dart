import 'package:defacto/core/controllers/store/store_states.dart';
import 'package:defacto/core/network/remote/constants.dart';
import 'package:defacto/core/network/remote/store_helper.dart';
import 'package:defacto/models/store_models/home_model.dart';
import 'package:defacto/models/store_models/notification.dart';
import 'package:defacto/models/store_models/search_model.dart';
import 'package:defacto/modules/screens/cart.dart';
import 'package:defacto/modules/screens/favorite.dart';
import 'package:defacto/modules/screens/products.dart';
import 'package:defacto/modules/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sqflite/sqflite.dart';

class DefactoCubit extends Cubit<DefactoStates> {
  DefactoCubit() :super(InitialState());
  static DefactoCubit get(context) => BlocProvider.of(context);
  HomeModel? homeModel;
  void getHomeData() {
    DioHelperStore.getData(url:ApiConstant.HOME,token: token).then((value){
      homeModel = HomeModel.fromJson(value.data);
      print('Price = ${homeModel!.data!.products![0].price}');
      print('Image = ${homeModel!.data!.products![0].images![0]}');
      print('Name  = ${homeModel!.data!.products![0].name}');
      print('Image1 = ${homeModel!.data!.products![0].images![1]}');
      print('Products length = ${homeModel!.data!.products!.length}');
      print('BestSeller length = ${homeModel!.data!.popular!.length}');
      print('Exclusive length = ${homeModel!.data!.exclusive!.length}');
      print('ForYou length = ${homeModel!.data!.forYou!.length}');

      emit(GetProductData());
    }).catchError((error){
      print(error.toString());
      emit(GetErrorProductData());
    });
  }
  SearchModel? searchModel;
  void search(String text) {
    emit(SearchLoadingState());
    DioHelperStore.postData(
      url:ApiConstant.SEARCH,
      token: token,
      data: {
        'text': text,
      },
    ).then((value)
    {
      searchModel = SearchModel.fromJson(value.data);
      print('search = ${searchModel!.data!.data![0].name}');
      emit(SearchSuccessState());
    }).catchError((error)
    {
      print("error occur:${error.toString()}");
      emit(SearchErrorState());
    });
  }
  int currentIndex = 0;
  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeScreenIndex());
  }
  NotificationModel? notificationModel;
  void getNotification(){
    DioHelperStore.getData(url:ApiConstant.NOTIFICATION,token: token).then((value){
      notificationModel  =NotificationModel.fromJson(value.data);
      print('not = ${notificationModel!.data!.data![0].title}');
      emit(GetNotification());
    }).catchError((error){
      print(error.toString());
      emit(ErrorGetNotification());
    });
  }
  List<Widget> screens =
  [
    ProductsScreen(),
    const Favorite(),
    const Cart(),
    const Profile(),
  ];
  List<BottomNavigationBarItem>items =const
  [
     BottomNavigationBarItem(
      icon:FaIcon(
          FontAwesomeIcons.house
      ),
      label:'Home',
    ),
     BottomNavigationBarItem(
      icon:Icon(Icons.favorite_border
      ),
      label:'Favorite',
    ),
     BottomNavigationBarItem(
      icon:Icon(
        Icons.add_shopping_cart,
      ),
      label:'Cart',
    ),
     BottomNavigationBarItem(
      icon:Icon(
        Icons.person
      ),
      label:'Profile',
    ),
  ];
  Database? database;
  List<Map> cart = [];
  List<Map> favorites = [];
  void createDatabase() {
    openDatabase('Defacto.db', version: 2, onCreate: (database, version) {
      print('DataBase Created');
      database
          .execute(
          'create table Cart(id INTEGER PRIMARY KEY,name TEXT ,price TEXT,image TEXT)')
          .then((value) {
        print('Table 1 Created');
      }).catchError((error) {
        print('Error occur : $error');
      });
      database
          .execute(
          'create table Favorite(id INTEGER PRIMARY KEY,name TEXT ,price TEXT,image TEXT)')
          .then((value) {
        print('Table 2 Created');
      }).catchError((error) {
        print('Error occur : $error');
      });
    }, onOpen: (database) {
      getCartData(database);
      getFavoriteData(database);
      print('Database opened');
    }).then((value) {
      database = value;
      emit(CreateDatabaseState());
    }).catchError((error) {
      emit(ErrorCreateDatabaseState());
    });
  }

  Future<void> insertCart(
      { required String name,
        required String price,
        required String image}) async {
    database!.transaction((txn) {
      return txn
          .rawInsert(
          'INSERT INTO Cart(name,price,image) VALUES("$name","$price","$image")')
          .then((value) {
        print('$value Inserted Successfully');
        emit(InsertCartState());
        getCartData(database);
      }).catchError((error) {
        print('Error occur : $error');
        emit(ErrorInsertCartState());
      });
    });
  }

  void getCartData(database) {
    cart = [];
    database!.rawQuery('select * from Cart').then((value) {
      value.forEach((element) {
        cart.add(element);
      });
      print(cart);
      emit(GetCartState());
    }).catchError((error) {
      print('Error occur no data');
      emit(ErrorCartState());
    });
  }

  void deleteCartData({required int id}) async {
    await database!
        .rawDelete('DELETE FROM Cart WHERE id= ?', [id]).then((value) {
      getCartData(database);
      emit(DeleteCartDataState());
    });
  }

  Future<void> insertFavorite(
      {required String name,
        required String price,
        required String image}) async {
    database!.transaction((txn) {
      return txn
          .rawInsert(
          'INSERT INTO Favorite(name,price,image) VALUES("$name","$price","$image")')
          .then((value) {
        print('$value Inserted Successfully');
        emit(InsertFavoriteState());
        getFavoriteData(database);
        //print()
      }).catchError((error) {
        print('Error occur : $error');
        emit(ErrorFavoriteInsertDataState());
      });
    });
  }

  void getFavoriteData(database) {
    favorites = [];
    database!.rawQuery('select * from Favorite').then((value) {
      value.forEach((element) {
        favorites.add(element);
      });
      print(favorites);
      emit(GetFavoriteDataState());
    }).catchError((error) {
      print('Error occur no data');
      emit(ErrorGetFavoriteDataState());
    });
  }

  void deleteFavoriteData({required int id}) async {
    await database!
        .rawDelete('DELETE FROM Favorite WHERE id= ?', [id]).then((value) {
      getFavoriteData(database);
      emit(DeleteFavoriteDataState());
    });
  }
}