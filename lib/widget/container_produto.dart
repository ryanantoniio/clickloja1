import 'package:clickloja1/domain/produto.dart';
import 'package:flutter/material.dart';

class ContainerProduto extends StatefulWidget {
  final Produto produto;

  const ContainerProduto({super.key, required this.produto});

  @override
  State<ContainerProduto> createState() => _ContainerProdutoState();
}

class _ContainerProdutoState extends State<ContainerProduto> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  widget.produto.url,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 16,
                right: 16,
                child: Icon(Icons.favorite, size: 36, color: Colors.pinkAccent),
              ),
            ],
          ),

          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.produto.titulo,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Row(children: [Icon(Icons.star, size: 16), buildText('4.76')]),
            ],
          ),
          buildText(widget.produto.titulo),
          buildText(widget.produto.preco),
          buildText(widget.produto.url),
        ],
      ),
    );
  }

  buildText(String text) {
    return Text(
      text,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    );
  }
}

