
 class Propriedade {
  String titulo;
  String preco;
  String url;

  Propriedade({
    required this.titulo,
    required this.preco,
    required this.url,
 });

  Propriedade.fromJson(Map<String, dynamic> json)
    : titulo = json['titulo'].toString(),
      preco = json['preco'].toString(),
      url = json['url'];

 }