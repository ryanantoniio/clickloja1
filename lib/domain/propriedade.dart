class Propriedade {
  int? id;
  late String titulo;
  late String preco;
  late String url;

  Propriedade({this.id, required this.titulo, required this.preco, required this.url});

  Propriedade.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titulo = json['titulo'];
    preco = json['preco'];
    url = json['url'];
  }
}
