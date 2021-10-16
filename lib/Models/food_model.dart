class Food {
  String? name;
  int? price;
  int? discount;
  String? photoUrl;
  String? discription;
  List<dynamic>? category;

  Food(
      {this.name,
      this.discount,
      this.photoUrl,
      this.price,
      this.category,
      this.discription});

  Map<String, dynamic> toMap(Food food) {
    Map<String, dynamic> data = <String, dynamic>{};
    data['price'] = food.price;
    data['discount'] = food.discount;
    data['name'] = food.name;
    data['url'] = food.photoUrl;
    data['category'] = food.category;
    data['discription'] = food.discription;
    return data;
  }

  Food.fromMap(Map<dynamic, dynamic> data) {
    price = data['price'];
    discount = data['discount'];
    name = data['name'];
    photoUrl = data['url'];
    category = data['category'];
    discription = data['discription'];
  }
}
