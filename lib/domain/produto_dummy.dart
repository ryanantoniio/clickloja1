class ProdutoDummy {
  late int id;
  late String title;
  late double price;
  late String brand;
  late String thumbnail;

  ProdutoDummy({
    required this.id,
    required this.title,
    required this.price,
    required this.brand,
    required this.thumbnail,
  });

  ProdutoDummy.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = (json['price'] as num).toDouble();
    brand = json['brand'];
    thumbnail = json['thumbnail'];
  }
}
