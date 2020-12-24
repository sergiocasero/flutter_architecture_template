import 'package:flutter_architecture_template/domain/model/Poi.dart';

abstract class PoiRepository {
  Future<List<Poi>> getPois(bool forceLocal);

  Future<void> clearPois();

  Future<bool> hasPois();
}
