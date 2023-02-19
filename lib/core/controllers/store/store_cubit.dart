import 'package:defacto/core/controllers/store/store_states.dart';
import 'package:defacto/core/network/local/cache.dart';
import 'package:defacto/core/network/remote/constants.dart';
import 'package:defacto/core/network/remote/store_helper.dart';
import 'package:defacto/models/store_models/cateogry.dart';
import 'package:defacto/models/store_models/home_model.dart';
import 'package:defacto/models/store_models/login_model.dart';
import 'package:defacto/models/store_models/notification.dart';
import 'package:defacto/models/store_models/search_model.dart';
import 'package:defacto/modules/screens/cart.dart';
import 'package:defacto/modules/screens/category.dart';
import 'package:defacto/modules/screens/clothes_products.dart';
import 'package:defacto/modules/screens/corona_Products.dart';
import 'package:defacto/modules/screens/electronic_products.dart';
import 'package:defacto/modules/screens/products.dart';
import 'package:defacto/modules/screens/profile.dart';
import 'package:defacto/modules/screens/sports_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

class DefactoCubit extends Cubit<DefactoStates> {
  DefactoCubit() : super(InitialState());
  static DefactoCubit get(context) => BlocProvider.of(context);
  HomeModel? homeModel;
  void getHomeData() {
    DioHelperStore.getData(url: ApiConstant.HOME, token: token).then((value) {
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
    }).catchError((error) {
      print(error.toString());
      emit(GetErrorProductData());
    });
  }
  List<Widget> categoryScreen = const [
    Electronic(),
    CoronaProducts(),
    SportsProducts(),
    ClothesProducts(),
    ClothesProducts(),
  ];
  SearchModel? searchModel;
  void search(String text) {
    emit(SearchLoadingState());
    DioHelperStore.postData(
      url: ApiConstant.SEARCH,
      token: token,
      data: {
        'text': text,
      },
    ).then((value) {
      searchModel = SearchModel.fromJson(value.data);
      print('search = ${searchModel!.data!.data![0].name}');
      emit(SearchSuccessState());
    }).catchError((error) {
      print("error occur:${error.toString()}");
      emit(SearchErrorState());
    });
  }

  int currentIndex = 0;
  int counter = 1;
  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeScreenIndex());
  }
  NotificationModel? notificationModel;
  void getNotification() {
    DioHelperStore.getData(url: ApiConstant.NOTIFICATION, token: token)
        .then((value) {
      notificationModel = NotificationModel.fromJson(value.data);
      print('not = ${notificationModel!.data!.data![0].title}');
      emit(GetNotification());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorGetNotification());
    });
  }

  List<Widget> screens = [
    ProductsScreen(),
    const Category(),
    Cart(),
    const Profile(),
  ];
  Database? database;
  List<Map> cart = [];
  List<Map> searchRecord = [];
  void createDatabase() {
    openDatabase('Defacto.db', version: 1, onCreate: (database, version) {
      print('DataBase Created');
      database
          .execute(
              'create table Cart(id INTEGER PRIMARY KEY,name TEXT ,price TEXT,image TEXT,counter INT,exit BOOL)')
          .then((value) {
        print('Table 1 Created');
      }).catchError((error) {
        print('Error occur : $error');
      });
    }, onOpen: (database) {
      getCartData(database);
      print('Database opened');
    }).then((value) {
      database = value;
      emit(CreateDatabaseState());
    }).catchError((error) {
      emit(ErrorCreateDatabaseState());
    });
  }

  void addCounter() {
    counter++;
    emit(AddCounter());
  }

  void munsCounter() {
    counter--;
    if (counter == 0) {
      counter = 1;
    }
    emit(MunsCounter());
  }

  void getSpecialRecord(String search) async {
    searchRecord = [];
    database!
        .rawQuery('SELECT * FROM Cart WHERE name LIKE "%$search%"')
        .then((value) {
      value.forEach((element) {
        searchRecord.add(element);
      });
      print("Search record  = $searchRecord");
      emit(SearchDataState());
    }).catchError((error) {
      print('Error occur no data for search');
      emit(ErrorSearchDataState());
    });
  }

  Future<void> insertCart({
    required String name,
    required String price,
    required String image,
    required int counter,
    required bool exit,
  }) async {
    database!.transaction((txn) {
      return txn
          .rawInsert(
              'INSERT INTO Cart(name,price,image,counter,exit) VALUES("$name","$price","$image","$counter","$exit")')
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

  bool more = false;
  void changeMore() {
    more = true;
    emit(ChangeMoreState());
  }

  void changeMoreLess() {
    more = false;
    emit(ChangeMoreState());
  }

  LoginModel? userModel;
  String? name;
  String? email;
  String? image;
  void getUserData() {
    DioHelperStore.getData(
      url: ApiConstant.PROFILE,
      token: token,
    ).then((value) {
      userModel = LoginModel.fromJson(value.data);
      name = userModel!.data!.name;
      image = userModel!.data!.image;
      email = userModel!.data!.email;
      print(userModel!.data!.name);
      print(userModel!.data!.image);
      if(name==null && email ==null)
        {
          name =  "Mahmoud";
          email = 'mahmoud@gmail.com';
        }else{
        name = userModel!.data!.name;
        image = userModel!.data!.image;
        email = userModel!.data!.email;
      }
      emit(UserDataSuccessState(userModel));
    }).catchError((error) {
      print(error.toString());
      emit(UserDataFailedState());
    });
  }

  void updateUserData({
    required String name,
    required String email,
    required String phone,
  }) {
    DioHelperStore.putData(
      url: ApiConstant.UPDATE_PROFILE,
      token: token,
      data: {
        'name': name,
        'email': email,
        'phone': phone,
      },
    ).then((value) {
      userModel = LoginModel.fromJson(value.data);
      //printFullText(userModel!.data!.name!);
      emit(UserUpdateSuccessState(userModel!));
    }).catchError((error) {
      print(error.toString());
      emit(UserUpdateFailedState());
    });
  }
  CategoryModel? categoryModel;
  void getCategory() {
    DioHelperStore.getData(url: ApiConstant.CATEGORY).then((value) {
      categoryModel = CategoryModel.fromJson(value.data);
      print('NameCate  = ${categoryModel!.data!.data![0].name}');
      emit(GetCateData());
    }).catchError((error) {
      print(error.toString());
      emit(GetErrorCateData());
    });
  }
  void addSum(dynamic price){
    sumPrice = sumPrice +(price*counter);
    CacheHelper.saveData(key:'Sum', value:sumPrice);
    print('Sum = $sumPrice');
    emit(AddSum());
  }
  void muins(dynamic price,int count,int recordId){
    sumPrice = sumPrice - (price*count);
    deleteCartData(id: recordId);
    CacheHelper.saveData(key:'Sum', value:sumPrice);
    print('Sum = $sumPrice');
    emit(MuinsSum());
  }
}
