import 'package:flutter_architecture_template/data/datasource/local/Local.dart';
import 'package:flutter_architecture_template/data/datasource/local/PoiDao.dart';
import 'package:flutter_architecture_template/domain/model/Poi.dart';
import 'package:sqflite/sqflite.dart';

import '../../model/PoiDto.dart';

class SqliteLocal extends Local {
  final Database _db;
  PoiDao _dao;

  SqliteLocal(this._db) {
    _dao = PoiDao(_db);
  }

  @override
  Future<void> clearPois() async {
    return await _dao.deleteAll();
  }

  @override
  Future<List<Poi>> getPois() async {
    return (await _dao.getAll()).map((e) => e.toPoi()).toList();
  }

  @override
  Future<bool> hasPois() async {
    return await _dao.hasPois();
  }

  @override
  Future<void> addPoi(Poi poi) async {
    return await _dao.insert(PoiDto.fromPoi(poi));
  }

  @override
  Future<void> addPois(List<Poi> pois) async {
    return await _dao.insertAll(pois.map((e) => PoiDto.fromPoi(e)).toList());
  }
}
