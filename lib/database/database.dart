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
          'https://images.tcdn.com.br/img/img_prod/680475/shorts_moletom_no_future_cinza_5022_4_b4c80e165a1a84c891c85760070f28ce_20230614160803.jpg',
    ),
    Produto(
      titulo: 'Smartphone Galaxy S23',
      preco: 'R\$ 3.999,00',
      url:
          'https://images.samsung.com/is/image/samsung/p6pim/br/2302/gallery/br-galaxy-s23-s911-sm-s911bzkpzto-534839845.png',
    ),
    Produto(
      titulo: 'LEGO Star Wars',
      preco: 'R\$ 899,90',
      url: 'https://m.media-amazon.com/images/I/81U41i-KIfL._AC_SL1500_.jpg',
    ),
    Produto(
      titulo: 'Tênis Nike Air Force 1',
      preco: 'R\$ 799,99',
      url: 'https://imgnike-a.akamaihd.net/768x768/01113751.jpg',
    ),
  ];
}
