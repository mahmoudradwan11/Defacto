import 'package:defacto/core/network/remote/constants.dart';
import 'package:defacto/core/network/remote/store_helper.dart';
import 'package:defacto/models/store_models/login_model.dart';
import 'package:defacto/modules/widgets/funtions/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_states.dart';
class LoginCubit extends Cubit<LoginState>{

  LoginCubit() : super(LoginInitState());
  static LoginCubit get(context)=>BlocProvider.of(context);
  LoginModel? login;
  IconData suffixIcon = Icons.visibility;
  bool passwordShow = true;
  void loginUser({required String email, required String password})
  {
    emit(LoadingLogin());
    DioHelperStore.postData(url:ApiConstant.LOGIN, data:{
      'email':email,
      'password':password,
    }
    ).then((value){
      login = LoginModel.fromJson(value.data);
      if(login!.message!='Login done successfully') {
        showToast(login!.message!, ToastStates.ERROR);
      }
      emit(LoginSuccessState(login!));
    }).catchError((error){
      print(error.toString());
      emit(LoginFailedState(error.toString()));
    });
  }
  void changePasswordIcon()
  {
    passwordShow = !passwordShow;
    suffixIcon = passwordShow?Icons.visibility:Icons.visibility_off_outlined;
    emit(ChangePasswordVisState());
  }
}