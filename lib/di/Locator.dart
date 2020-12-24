import 'package:flutter_architecture_template/data/datasource/local/Local.dart';
import 'package:flutter_architecture_template/data/datasource/local/SqliteLocal.dart';
import 'package:flutter_architecture_template/data/datasource/remote/HttpRemote.dart';
import 'package:flutter_architecture_template/data/datasource/remote/Remote.dart';
import 'package:flutter_architecture_template/data/repository/PoiRepositoryImpl.dart';
import 'package:flutter_architecture_template/domain/repository/PoiRepository.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.I;

Future<void> initializeDI() async {
  getIt.registerSingleton<Local>(SqliteLocal());
  getIt.registerSingleton<Remote>(HttpRemote());
  getIt.registerSingleton<PoiRepository>(PoiRepositoryImpl(getIt.get(), getIt.get()));
}
