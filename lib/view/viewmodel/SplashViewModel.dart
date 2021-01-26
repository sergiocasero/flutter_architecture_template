import 'package:flutter_architecture_template/domain/model/Poi.dart';
import 'package:flutter_architecture_template/domain/repository/PoiRepository.dart';
import 'package:flutter_architecture_template/view/viewmodel/RootViewModel.dart';

class SplashViewModel extends RootViewModel {
  final PoiRepository _repository;

  List<Poi> _pois = [];

  List<Poi> get pois => _pois;

  SplashViewModel(this._repository);

  @override
  initialize() {
    // Do nothing in that case
  }

  void _getPois(bool forceLocal) async {
    showProgress();

    final pois = await _repository.getPois(forceLocal);
    this._pois.clear();
    this._pois.addAll(pois);
    notify();

    hideProgress();
  }

  void onClearPressed() async {
    showProgress();

    await _repository.clearPois();
    this._pois.clear();

    hideProgress();
  }

  void onGetPressed() {
    _getPois(false);
  }

  void onForceLocalPressed() async {
    _getPois(true);
  }
}
