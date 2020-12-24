import 'package:flutter_architecture_template/data/datasource/local/Local.dart';
import 'package:flutter_architecture_template/domain/model/Poi.dart';

class SqliteLocal extends Local {
  @override
  Future<void> clearPois() {
    // TODO: implement clearPois
    throw UnimplementedError();
  }

  @override
  Future<List<Poi>> getPois() {
    // TODO: implement getPois
    throw UnimplementedError();
  }

  @override
  Future<bool> hasPois() {
    // TODO: implement hasPois
    throw UnimplementedError();
  }
}
