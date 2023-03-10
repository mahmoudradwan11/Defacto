import 'package:defacto/models/store_models/login_model.dart';

abstract class DefactoStates {}

class InitialState extends DefactoStates {}

class ChangeScreenIndex extends DefactoStates {}

class GetProductData extends DefactoStates {}

class GetErrorProductData extends DefactoStates {}

class SearchLoadingState extends DefactoStates {}

class SearchSuccessState extends DefactoStates {}

class SearchErrorState extends DefactoStates {}

class GetNotification extends DefactoStates {}

class CheckState extends DefactoStates {}

class ErrorGetNotification extends DefactoStates {}

class GetCateData extends DefactoStates {}

class GetErrorCateData extends DefactoStates {}

class CreateDatabaseState extends DefactoStates {}

class ErrorCreateDatabaseState extends DefactoStates {}

class SearchDataState extends DefactoStates {}

class ErrorSearchDataState extends DefactoStates {}

class InsertCartState extends DefactoStates {}

class ErrorInsertCartState extends DefactoStates {}

class GetCartState extends DefactoStates {}

class ErrorCartState extends DefactoStates {}

class InsertFavoriteState extends DefactoStates {}

class ErrorFavoriteInsertDataState extends DefactoStates {}

class GetFavoriteDataState extends DefactoStates {}

class ErrorGetFavoriteDataState extends DefactoStates {}

class DeleteCartDataState extends DefactoStates {}

class DeleteFavoriteDataState extends DefactoStates {}

class ChangeMoreState extends DefactoStates {}

class UserDataSuccessState extends DefactoStates {
  LoginModel? userModel;
  UserDataSuccessState(this.userModel);
}

class UserDataFailedState extends DefactoStates {}

class UserUpdateSuccessState extends DefactoStates {
  LoginModel? userModel;
  UserUpdateSuccessState(this.userModel);
}

class UserUpdateFailedState extends DefactoStates {}

class AddSum extends DefactoStates {}

class MuinsSum extends DefactoStates {}

class GetOrders extends DefactoStates {}

class ErrorGetOrders extends DefactoStates {}

class SendOrderDataState extends DefactoStates {}

class ErrorSendOrderDataState extends DefactoStates {}

class SendContact extends DefactoStates {}

class ErrorContact extends DefactoStates {}

class UpdateCounter extends DefactoStates {}

class UpdateProductState extends DefactoStates {}
