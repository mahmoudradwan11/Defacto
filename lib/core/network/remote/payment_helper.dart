import 'package:dio/dio.dart';

import 'constants.dart';

class DioHelperPayment {
  static late Dio dio;
  static initDio() {
    dio = Dio(BaseOptions(
        baseUrl: ApiConstant.baseUrlPayment,
        headers: {
          'Content-Type': 'application/json',
        },
        receiveDataWhenStatusError: true));
  }

  static Future<Response> postData(
      {required String url, Map<String, dynamic>? data}) async {
    return await dio.post(url, data: data);
  }
}
