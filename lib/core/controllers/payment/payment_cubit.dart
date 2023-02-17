import 'package:defacto/core/controllers/payment/payment_states.dart';
import 'package:defacto/core/network/remote/constants.dart';
import 'package:defacto/core/network/remote/payment_helper.dart';
import 'package:defacto/models/payment_models/payment_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentCubit extends Cubit<PaymentStates> {
  PaymentCubit() : super(InitialState());

  static PaymentCubit get(context) => BlocProvider.of(context);
  PaymentAuth? paymentAuth;
  Future<void> getAuthToken() async {
    emit(PaymentAuthLoadingState());
    DioHelperPayment.postData(
        url: ApiConstant.getAuthToken,
        data: {"api_key": ApiConstant.paymentApiKey}).then((value) {
      paymentAuth = PaymentAuth.fromJson(value.data);
      authToken = paymentAuth!.token;
      print('The  Auth token is = $authToken');
      emit(PaymentAuthSuccessState());
      authToken = paymentAuth!.token;
    }).catchError((error) {
      print(error.toString());
      emit(PaymentAuthErrorState());
    });
  }

}
