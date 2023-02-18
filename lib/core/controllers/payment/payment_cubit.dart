import 'package:defacto/core/controllers/payment/payment_states.dart';
import 'package:defacto/core/network/remote/constants.dart';
import 'package:defacto/core/network/remote/payment_helper.dart';
import 'package:defacto/models/payment_models/payment_auth.dart';
import 'package:defacto/models/payment_models/payment_finalToken.dart';
import 'package:defacto/models/payment_models/payment_order.dart';
import 'package:defacto/modules/widgets/funtions/toast.dart';
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
      print('The Auth token is = $authToken');
      emit(PaymentAuthSuccessState());
      authToken = paymentAuth!.token;
    }).catchError((error) {
      print(error.toString());
      emit(PaymentAuthErrorState());
    });
  }

  OrderId? orderId;
  Future<void> getOrderId({
    required String firstName,
    required String lastName,
    required String email,
    required String price,
    required String phone,
  }) async {
    emit(GetOrderIdLoading());
    DioHelperPayment.postData(
      url: ApiConstant.getOrderId,
      data: {
        "auth_token": authToken,
        "delivery_needed": "false",
        "amount_cents": price,
        "currency": "EGP",
        "items": [],
      },
    ).then((value) {
      orderId = OrderId.fromJson(value.data);
      orderPaymentId = orderId!.id.toString();
      print('OrderId = $orderPaymentId');
      getPaymentRequest(
          firstName: firstName,
          lastName: lastName,
          email: email,
          price: price,
          phone: phone);
      emit(GetOrderIdSuccess());
    }).catchError((error) {
      print('error occur ${error.toString()}');
      emit(GetOrderIdError());
    });
  }

  PaymentFinal? paymentFinal;
  Future<void> getPaymentRequest({
    required String firstName,
    required String lastName,
    required String email,
    required String price,
    required String phone,
  }) async {
    emit(GetPaymentRequestLoading());
    DioHelperPayment.postData(url: ApiConstant.getPaymentKey, data: {
      "auth_token": authToken,
      "amount_cents": price,
      "expiration": 3600,
      "order_id": orderPaymentId,
      "billing_data": {
        "apartment": "NA",
        "email": email,
        "floor": "NA",
        "first_name": firstName,
        "street": "NA",
        "building": "NA",
        "phone_number": phone,
        "shipping_method": "NA",
        "postal_code": "NA",
        "city": "NA",
        "country": "NA",
        "last_name": lastName,
        "state": "NA"
      },
      "currency": "EGP",
      "integration_id": ApiConstant.idCard,
    }).then((value) {
      paymentFinal = PaymentFinal.fromJson(value.data);
      finalToken = paymentFinal!.token;
      print('Final Token = $finalToken}');
      showToast(orderPaymentId, ToastStates.SUCCESS);
      emit(GetPaymentRequestSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(GetPaymentRequestError());
    });
  }
}
