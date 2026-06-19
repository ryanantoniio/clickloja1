import 'package:clickloja1/database/db_helper.dart';
import 'package:clickloja1/domain/propriedade.dart';
import 'package:sqflite/sqflite.dart';

class PropriedadeDao {
  Future<List<Propriedade>> listarPropriedades() async {
    Database db = await DBHelper().initDB();

    var listaResult = await db.rawQuery('SELECT * FROM PROPRIEDADE;');

    List<Propriedade> listaPropriedades = [];
    for (var json in listaResult) {
      print(json);

      Propriedade p = Propriedade.fromJson(json);
      listaPropriedades.add(p);
    }

    return listaPropriedades;
  }

  Future<List<Propriedade>> pesquisarPropriedades(String query) async {
    Database db = await DBHelper().initDB();

    var listaResult = await db.rawQuery("SELECT * FROM PROPRIEDADE WHERE titulo LIKE '%$query%';");

    List<Propriedade> listaPropriedades = [];
    for (var json in listaResult) {
      Propriedade p = Propriedade.fromJson(json);
      listaPropriedades.add(p);
    }

    return listaPropriedades;
  }
}
