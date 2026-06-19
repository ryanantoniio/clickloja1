import 'package:clickloja1/domain/propriedade.dart';
import 'package:flutter/material.dart';

class ContainerPropriedade extends StatefulWidget {
  final Propriedade propriedade;

  const ContainerPropriedade({super.key, required this.propriedade});

  @override
  State<ContainerPropriedade> createState() => _ContainerPropriedadeState();
}

class _ContainerPropriedadeState extends State<ContainerPropriedade> {
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
                  widget.propriedade.url,
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
                widget.propriedade.titulo,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Row(children: [Icon(Icons.star, size: 16), buildText('4.76')]),
            ],
          ),
          buildText(widget.propriedade.titulo),
          buildText(widget.propriedade.preco),
          buildText(widget.propriedade.url),
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
