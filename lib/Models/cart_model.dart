class Cart {
  String? name;
  int? price;
  int? discount;
  String? photoUrl;
  String? discription;
  List<dynamic>? category;
  int? quantity;

  Cart(
      {this.name,
      this.discount,
      this.photoUrl,
      this.price,
      this.quantity,
      this.category,
      this.discription});

  Map<String, dynamic> toMap(Cart cart) {
    Map<String, dynamic> data = <String, dynamic>{};
    data['price'] = cart.price;
    data['discount'] = cart.discount;
    data['name'] = cart.name;
    data['url'] = cart.photoUrl;
    data['category'] = cart.category;
    data['discription'] = cart.discription;
    data['quantity'] =cart.quantity;
    return data;
  }

  Cart.fromMap(Map<dynamic, dynamic> data) {
    price = data['price'];
    discount = data['discount'];
    name = data['name'];
    photoUrl = data['url'];
    category = data['category'];
    discription = data['discription'];
  }
}
