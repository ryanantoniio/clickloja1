class Produto {
  int? id;
  late String titulo; //late -> precisa preenchido antes de usar
  late double preco;
  late String url;

  Produto({
    this.id,
    required this.titulo,
    required this.preco,
    required this.url,
  });

  //pega map e transforma em objeto dart
  Produto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titulo = json['titulo'];
    preco = (json['preco'] as num).toDouble();
    url = json['url'];
  }
}
