class PaymentRefCode {
  int? refCode;
  PaymentRefCode(this.refCode);
  PaymentRefCode.fromJson(Map<String, dynamic> json) {
    refCode = json['id'];
  }
}
