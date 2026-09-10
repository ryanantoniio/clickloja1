class Empresa {
  int? id;
  late String razaoSocial;
  late String cnpj;

  Empresa({
    this.id,
    required this.razaoSocial,
    required this.cnpj,
  });

  // Pega map e transforma em objeto Dart
  Empresa.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    razaoSocial = json['razaoSocial'];
    cnpj = json['cnpj'];
  }
}
