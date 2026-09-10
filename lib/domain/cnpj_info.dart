class CnpjInfo {
  final String cnpj;
  final String razaoSocial;
  final String nomeFantasia;
  final String descricaoSituacaoCadastral;
  final String naturezaJuridica;
  final String logradouro;
  final String numero;
  final String complemento;
  final String bairro;
  final String municipio;
  final String uf;
  final String cep;
  final String? dddTelefone1;
  final String? dddTelefone2;
  final String? email;
  final String dataInicioAtividade;
  final String cnaeDescricao;
  final double capitalSocial;

  CnpjInfo({
    required this.cnpj,
    required this.razaoSocial,
    required this.nomeFantasia,
    required this.descricaoSituacaoCadastral,
    required this.naturezaJuridica,
    required this.logradouro,
    required this.numero,
    required this.complemento,
    required this.bairro,
    required this.municipio,
    required this.uf,
    required this.cep,
    this.dddTelefone1,
    this.dddTelefone2,
    this.email,
    required this.dataInicioAtividade,
    required this.cnaeDescricao,
    required this.capitalSocial,
  });

  // Pega map e transforma em objeto Dart
  factory CnpjInfo.fromJson(Map<String, dynamic> json) {
    return CnpjInfo(
      cnpj: json['cnpj'] ?? '',
      razaoSocial: json['razao_social'] ?? '',
      nomeFantasia: json['nome_fantasia'] ?? '',
      descricaoSituacaoCadastral: json['descricao_situacao_cadastral'] ?? '',
      naturezaJuridica: json['natureza_juridica'] ?? '',
      logradouro: json['logradouro'] ?? '',
      numero: json['numero'] ?? '',
      complemento: json['complemento'] ?? '',
      bairro: json['bairro'] ?? '',
      municipio: json['municipio'] ?? '',
      uf: json['uf'] ?? '',
      cep: json['cep'] ?? '',
      dddTelefone1: json['ddd_telefone_1'],
      dddTelefone2: json['ddd_telefone_2'],
      email: json['email'],
      dataInicioAtividade: json['data_inicio_atividade'] ?? '',
      cnaeDescricao: json['cnae_fiscal_descricao'] ?? '',
      capitalSocial: (json['capital_social'] as num?)?.toDouble() ?? 0.0,
    );
  }
}
