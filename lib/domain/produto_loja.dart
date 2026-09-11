class ProdutoLoja {
  late int id;
  late String title;
  late double price;
  late String category;
  late String image;

  ProdutoLoja({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.image,
  });

  ProdutoLoja.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = (json['price'] as num).toDouble();
    category = json['category'];
    image = json['image'];
  }
}
