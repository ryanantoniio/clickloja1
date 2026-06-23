import 'package:clickloja1/domain/produto.dart';

class Database {
  static List listaProdutos = [
    Produto(
      titulo: 'Camisa Seleção Brasileira',
      preco: 'R\$ 49,99',
      url:
          'https://images.tcdn.com.br/img/img_prod/1044362/camisa_futebol_brasil_copa_do_mundo_2026_ii_torced_1_20260115102624_75150200e531.jpg',
    ),
    Produto(
      titulo: 'Shorts Masculino',
      preco: 'R\$ 29,99',
      url:
          'https://imgcentauro-a.akamaihd.net/1024x1024/97319703A2.jpg',
    ),
    Produto(
      titulo: 'Smartphone Galaxy S23',
      preco: 'R\$ 3.999,00',
      url:
          'https://a-static.mlcdn.com.br/280x210/usado-samsung-galaxy-s23-5g-256gb-verde-bom-trocafone/trocafone/97269/435ebe6ee69e1e1c33612d185a6baa76.jpeg',
    ),
    Produto(
      titulo: 'LEGO Star Wars',
      preco: 'R\$ 899,90',
      url: 'https://m.media-amazon.com/images/I/71jRnJ0W2CL.jpg',
    ),
    Produto(
      titulo: 'Tênis Nike Air Force 1',
      preco: 'R\$ 799,99',
      url: 'https://imgnike-a.akamaihd.net/768x768/01113751.jpg',
    ),
  ];
}
