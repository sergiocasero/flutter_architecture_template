import 'package:flutter_architecture_template/domain/model/Poi.dart';
import 'package:flutter_architecture_template/domain/repository/PoiRepository.dart';
import 'package:flutter_architecture_template/view/Navigator.dart';
import 'package:flutter_architecture_template/view/viewmodel/RootViewModel.dart';

class ListViewModel extends RootViewModel {
  final PoiRepository _repository;
  final Navigator _navigator;

  List<Poi> _pois = [];

  List<Poi> get pois => _pois;

  ListViewModel(this._repository, this._navigator);

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

  void onPoiTap(String id) {
    _navigator.toDetail(id);
  }
}
