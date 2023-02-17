class OrderId {
  int? id;
  OrderId(this.id);
  OrderId.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }
}