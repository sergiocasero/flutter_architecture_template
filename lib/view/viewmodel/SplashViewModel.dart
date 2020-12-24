import 'package:flutter_architecture_template/domain/model/Poi.dart';
import 'package:flutter_architecture_template/domain/repository/PoiRepository.dart';
import 'package:flutter_architecture_template/view/viewmodel/RootViewModel.dart';

class SplashViewModel extends RootViewModel {
  final PoiRepository _repository;

  String _helloWorld = "This is before get info";
  String get helloWorld => _helloWorld;

  List<Poi> _pois = [];
  List<Poi> get pois => _pois;

  SplashViewModel(this._repository);

  @override
  initialize() {
    _getPois();
  }

  void _getPois() async {
    showProgress();

    final pois = await _repository.getPois();
    this.pois.clear();
    this.pois.addAll(pois);
    notify();

    hideProgress();
  }
}
