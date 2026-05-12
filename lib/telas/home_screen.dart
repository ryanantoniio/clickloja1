import 'package:flutter/material.dart';
import 'product_detail_screen.dart';
import 'notification_screen.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ClickLoja - Início', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white54,
        elevation: 0,


        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.black54),
            onPressed: (){
              Navigator.push(
                context, MaterialPageRoute(builder: (context) => const NotificationScreen(),
              ),
              );
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
            'https://images.tcdn.com.br/img/img_prod/1044362/camisa_futebol_brasil_copa_do_mundo_2026_ii_torced_1_20260115102624_75150200e531.jpg',
          ),
          _buildProdutoCard(
            context,
            'Shorts Masculino',
            'R\$ 29,99',
            'https://images.tcdn.com.br/img/img_prod/680475/shorts_moletom_no_future_cinza_5022_4_b4c80e165a1a84c891c85760070f28ce_20230614160803.jpg',
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
            Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.network(
                    url,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress){
                      if (loadingProgress == null) return child; // se carregou vai mostrar a imagem
                      return const Center(child: CircularProgressIndicator()); // se nao vai mostrar o circulo girando
                    },
                    errorBuilder: (context, error, stackTrace){
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