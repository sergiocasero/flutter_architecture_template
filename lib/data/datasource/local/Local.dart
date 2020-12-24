import 'package:flutter_architecture_template/domain/model/Poi.dart';

abstract class Local {
  Future<List<Poi>> getPois();

  Future<bool> hasPois();

  Future<void> clearPois();
}
