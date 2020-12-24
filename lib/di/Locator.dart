import 'package:flutter_architecture_template/data/datasource/local/Local.dart';
import 'package:flutter_architecture_template/data/datasource/local/SqliteLocal.dart';
import 'package:flutter_architecture_template/data/datasource/remote/HttpRemote.dart';
import 'package:flutter_architecture_template/data/datasource/remote/Remote.dart';
import 'package:flutter_architecture_template/data/repository/PoiRepositoryImpl.dart';
import 'package:flutter_architecture_template/domain/repository/PoiRepository.dart';
import 'package:flutter_architecture_template/view/viewmodel/SplashViewModel.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';

final getIt = GetIt.I;

Future<void> initializeDI() async {
  await _data();
  await _domain();
  await _view();
}

void _data() async {
  final db = await openDatabase(
    "pois.db",
    version: 1,
    onCreate: (db, version) async {
      return db.execute('''CREATE TABLE poi(
      id text,
      title text,
      geocoordinates text
    );''');
    },
  );

  // DATA
  getIt.registerSingleton<Local>(SqliteLocal(db));
  getIt.registerSingleton<Remote>(HttpRemote(http.Client()));
  getIt.registerSingleton<PoiRepository>(PoiRepositoryImpl(getIt.get(), getIt.get()));
}

void _domain() async {}

void _view() async {
  getIt.registerFactory<SplashViewModel>(() => SplashViewModel(getIt()));
}
