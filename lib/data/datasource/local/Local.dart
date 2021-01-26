import 'package:flutter_architecture_template/domain/model/Poi.dart';

abstract class Local {
  Future<List<Poi>> getPois();

  Future<bool> hasPois();

  Future<void> clearPois();

  Future<void> addPoi(Poi poi);

  Future<void> addPois(List<Poi> pois);

  Future<Poi> getPoi(String id);
}
