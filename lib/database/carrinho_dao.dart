import 'package:clickloja1/database/db_helper.dart';
import 'package:clickloja1/domain/propriedade.dart';
import 'package:sqflite/sqflite.dart';

class CarrinhoDao {
  Future<void> adicionarProduto(Propriedade p) async {
    Database db = await DBHelper().initDB();

    String sql = "INSERT INTO CARRINHO (titulo, preco, url) VALUES (?, ?, ?);";
    await db.rawInsert(sql, [p.titulo, p.preco, p.url]);
  }

  Future<List<Propriedade>> listarCarrinho() async {
    Database db = await DBHelper().initDB();

    var listaResult = await db.rawQuery('SELECT * FROM CARRINHO;');

    List<Propriedade> listaPropriedades = [];
    for (var json in listaResult) {
      Propriedade p = Propriedade.fromJson(json);
      listaPropriedades.add(p);
    }

    return listaPropriedades;
  }

  Future<void> removerProduto(int id) async {
    Database db = await DBHelper().initDB();
    await db.rawDelete('DELETE FROM CARRINHO WHERE id = ?;', [id]);
  }
}
