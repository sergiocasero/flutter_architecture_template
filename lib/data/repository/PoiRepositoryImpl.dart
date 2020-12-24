import 'package:flutter_architecture_template/data/datasource/local/Local.dart';
import 'package:flutter_architecture_template/data/datasource/remote/Remote.dart';
import 'package:flutter_architecture_template/domain/model/Poi.dart';
import 'package:flutter_architecture_template/domain/repository/PoiRepository.dart';

class PoiRepositoryImpl extends PoiRepository {

  final Remote _remote;
  final Local _local;

  PoiRepositoryImpl(this._remote, this._local);

  @override
  Future<List<Poi>> getPois() {
    // TODO: implement getPois
    throw UnimplementedError();
  }
}
