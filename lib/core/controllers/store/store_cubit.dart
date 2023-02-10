import 'package:bloc/bloc.dart';
import 'package:defacto/core/controllers/store/store_states.dart';
import 'package:defacto/core/network/remote/constants.dart';
import 'package:defacto/core/network/remote/store_helper.dart';
import 'package:defacto/models/store_models/home_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DefactoCubit extends Cubit<DefactoStates> {
  DefactoCubit() :super(InitialState());
  static DefactoCubit get(context) => BlocProvider.of(context);
  HomeModel? homeModel;
  void getHomeData()
  {
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
}