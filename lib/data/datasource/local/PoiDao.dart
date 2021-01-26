import 'package:flutter_architecture_template/data/model/PoiDto.dart';
import 'package:sqflite/sqflite.dart';

class PoiDao {
  final Database _db;

  PoiDao(this._db);

  Future<void> insert(PoiDto dto) async {
    await _db.insert("poi", dto.toMap());
  }

  Future<void> insertAll(List<PoiDto> dto) async {
    final batch = _db.batch();
    dto.forEach((element) => batch.insert("poi", element.toMap()));
    await batch.commit();
  }

  Future<void> deleteAll() async {
    await _db.delete("poi");
  }

  Future<List<PoiDto>> getAll() async {
    final result = await _db.query("poi");
    return result.map((e) => PoiDto.fromMap(e)).toList();
  }

  Future<bool> hasPois() async {
    return (await getAll()).isNotEmpty;
  }

  Future<PoiDto> getById(String id) async {
    final poi = (await _db.query("poi", where: "id = ?", whereArgs: [id])).first;
    return PoiDto.fromMap(poi);
  }
}
