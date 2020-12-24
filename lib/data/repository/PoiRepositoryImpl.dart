import 'package:flutter_architecture_template/data/datasource/local/Local.dart';
import 'package:flutter_architecture_template/data/datasource/remote/Remote.dart';
import 'package:flutter_architecture_template/domain/model/Poi.dart';
import 'package:flutter_architecture_template/domain/repository/PoiRepository.dart';

class PoiRepositoryImpl extends PoiRepository {
  final Remote _remote;
  final Local _local;

  PoiRepositoryImpl(this._remote, this._local);

  @override
  Future<List<Poi>> getPois(bool forceLocal) async {
    final hasPois = await _local.hasPois();
    if (hasPois || forceLocal) {
      return _local.getPois();
    } else {
      final pois = await _remote.getPois();
      await _local.addPois(pois);
      return pois;
    }
  }

  @override
  Future<void> clearPois() {
    return _local.clearPois();
  }

  @override
  Future<bool> hasPois() {
    return _local.hasPois();
  }
}
