import 'package:flutter/material.dart';
import 'package:clickloja1/database/propriedade_dao.dart';
import 'package:clickloja1/domain/propriedade.dart';
import 'product_detail_screen.dart';
import 'notification_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ClickLoja - Início',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white54,
        elevation: 0,

        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.black54),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationScreen(),
                ),
              );
            },
          ),
        ],
      ),

      body: FutureBuilder<List<Propriedade>>(
        future: PropriedadeDao().listarPropriedades(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text("Erro ao carregar produtos."));
          }

          List<Propriedade> propriedades = snapshot.data ?? [];

          if (propriedades.isEmpty) {
            return const Center(child: Text("Nenhum produto encontrado."));
          }

          return GridView.builder(
            padding: const EdgeInsets.all(16.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: propriedades.length,
            itemBuilder: (context, index) {
              return _buildProdutoCard(context, propriedades[index]);
            },
          );
        },
      ),
    );
  }

  Widget _buildProdutoCard(BuildContext context, Propriedade propriedade) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(propriedade: propriedade),
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
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                child: Image.network(
                  propriedade.url,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const Center(child: CircularProgressIndicator());
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Icon(Icons.image, size: 50, color: Colors.grey),
                    );
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
                    propriedade.titulo,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    maxLines: 2, // limita o texto a 2 linhas
                  ),
                  const SizedBox(height: 4),
                  Text(
                    propriedade.preco,
                    style: const TextStyle(
                      color: Colors.green,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
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
