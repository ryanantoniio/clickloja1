import 'package:flutter/material.dart';
import 'product_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ClickLoja - Início', style: TextStyle(color: Colors.black54)),
        backgroundColor: Colors.white54,
        elevation: 0,

        // icone de carrinho ao lado do nome
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_bag, color: Colors.black54),
            onPressed: (){
            },
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        padding: const EdgeInsets.all(16.0),
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: [
          _buildProdutoCard(
            context,
            'Camisa Seleção Brasileira',
            'R\$ 49,99',
            'https://images.tcdn.com.br/img/img_prod/690558/camisa_selecao_brasileira_i_2022_torcedor_nike_masculina_amarela_3012_1_eec12ed4121b1f6db2256da6f2bc8f8c.jpg',
          ),
          _buildProdutoCard(
            context,
            'Shorts Masculino',
            'R\$ 29,99',
            'https://img.ltwebstatic.com/images3_pi/2021/08/09/1628495047f3f1e98031d200fc01e237db8754b2c1_thumbnail_600x.webp',
          ),
        ],
      ),
    );
  }

  Widget _buildProdutoCard(BuildContext context, String titulo, String preco, String url) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(titulo: titulo, preco: preco),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // pra imagem ocupar o maximo de espaco
            Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.network(
                    url, // usa  a url da imagem passada no metodo
                    width: double.infinity,
                    fit: BoxFit.cover, // garante que a imagem vai preencher todo o espaco
                    loadingBuilder: (context, child, loadingProgress){
                      if (loadingProgress == null) return child; // se carregou vai mostrar a imagem
                      return const Center(child: CircularProgressIndicator()); // se nao vai mostrar o circulo girando
                    },
                    errorBuilder: (context, error, stackTrace){
                      // se der erro mostra o icone de foto
                      return const Center(child: Icon(Icons.image, size: 50, color: Colors.grey));
                    },
                  ),
                ),
            ),

            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titulo,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    maxLines: 2, // limita o texto a 2 linhas
                  ),
                  const SizedBox(height: 4),
                  Text(
                    preco,
                    style: TextStyle(color: Colors.green, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}