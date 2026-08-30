class ItemCarrinho {
  final int? id;
  final String titulo;
  final double precoUnitario;
  final String url;
  final int quantidade;

  ItemCarrinho({
    this.id,
    required this.titulo,
    required this.precoUnitario,
    required this.url,
    required this.quantidade,
  });

  double get subtotal => precoUnitario * quantidade;

  factory ItemCarrinho.fromJson(Map<String, dynamic> json) {
    return ItemCarrinho(
      id: json['id'] as int?,
      titulo: json['titulo'] as String,
      precoUnitario: (json['precoUnitario'] as num).toDouble(),
      url: json['url'] as String,
      quantidade: json['quantidade'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'titulo': titulo,
      'precoUnitario': precoUnitario,
      'url': url,
      'quantidade': quantidade,
    };
  }
}
