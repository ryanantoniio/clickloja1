import 'package:clickloja1/database/db_helper.dart';
import 'package:clickloja1/domain/produto.dart';
import 'package:sqflite/sqflite.dart';

class ProdutoDao {
  Future<List<Produto>> listarProdutos() async {
    Database db = await DBHelper().initDB();

    var listaResult = await db.rawQuery('SELECT * FROM PRODUTO;');

    List<Produto> listaProdutos = [];
    for (var json in listaResult) {
      print(json);

      Produto p = Produto.fromJson(json);
      listaProdutos.add(p);
    }

    return listaProdutos;
  }

  Future<List<Produto>> pesquisarProdutos(String query) async {
    Database db = await DBHelper().initDB();

    var listaResult = await db.rawQuery(
      "SELECT * FROM PRODUTO WHERE titulo LIKE '%$query%';",
    );

    List<Produto> listaProdutos = [];
    for (var json in listaResult) {
      Produto p = Produto.fromJson(json);
      listaProdutos.add(p);
    }

    return listaProdutos;
  }

  Future<void> adicionarProdutoCarrinho(Produto p) async {
    Database db = await DBHelper().initDB();

    String sql = "INSERT INTO CARRINHO (titulo, preco, url) VALUES (?, ?, ?);";
    await db.rawInsert(sql, [p.titulo, p.preco, p.url]);
  }

  Future<List<Produto>> listarCarrinho() async {
    Database db = await DBHelper().initDB();

    var listaResult = await db.rawQuery('SELECT * FROM CARRINHO;');

    List<Produto> listaProdutos = [];
    for (var json in listaResult) {
      Produto p = Produto.fromJson(json);
      listaProdutos.add(p);
    }

    return listaProdutos;
  }
}
