class Banco {
  int? id;
  late String nome;
  late String codigo;
  String? nomeCompleto;
  String? ispb;

  Banco({
    this.id,
    required this.nome,
    required this.codigo,
    this.nomeCompleto,
    this.ispb,
  });

  // Pega map e transforma em objeto Dart (fake API: id, nome, codigo)
  Banco.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    codigo = json['codigo'];
  }

  // Pega map e transforma em objeto Dart (BrasilAPI: name, code, fullName, ispb)
  Banco.fromBrasilApi(Map<String, dynamic> json) {
    ispb = json['ispb'];
    nome = json['name'] ?? '';
    codigo = json['code']?.toString() ?? '';
    nomeCompleto = json['fullName'];
  }
}
