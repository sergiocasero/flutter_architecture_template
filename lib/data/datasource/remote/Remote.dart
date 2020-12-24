import 'package:flutter_architecture_template/domain/model/Poi.dart';

abstract class Remote {
  Future<List<Poi>> getPois();
}