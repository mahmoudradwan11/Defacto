class PaymentFinal {
  String? token;
  PaymentFinal({this.token});
  PaymentFinal.fromJson(Map<String, dynamic> json) {
    token = json['token'];
  }
}