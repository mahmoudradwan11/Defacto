class PaymentAuth{
  String? token;
  PaymentAuth({this.token});
  PaymentAuth.fromJson(Map<String, dynamic> json) {
    token = json['token'];
  }
}


