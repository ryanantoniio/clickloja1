class Personagem {
  final String nome;
  final String altura;
  final String massa;
  final String corCabelo;
  final String corPele;
  final String corOlhos;
  final String anascimento;
  final String genero;
  final String homeworld;
  final List<String> filmes;
  final String url;

  Personagem({
    required this.nome,
    required this.altura,
    required this.massa,
    required this.corCabelo,
    required this.corPele,
    required this.corOlhos,
    required this.anascimento,
    required this.genero,
    required this.homeworld,
    required this.filmes,
    required this.url,
  });

  // Pega map e transforma em objeto Dart
  factory Personagem.fromJson(Map<String, dynamic> json) {
    return Personagem(
      nome: json['name'] ?? '',
      altura: json['height'] ?? '',
      massa: json['mass'] ?? '',
      corCabelo: json['hair_color'] ?? '',
      corPele: json['skin_color'] ?? '',
      corOlhos: json['eye_color'] ?? '',
      anascimento: json['birth_year'] ?? '',
      genero: json['gender'] ?? '',
      homeworld: json['homeworld'] ?? '',
      filmes: List<String>.from(json['films'] ?? []),
      url: json['url'] ?? '',
    );
  }
}
