import 'package:flutter_architecture_template/domain/model/Poi.dart';
import 'package:flutter_architecture_template/domain/repository/PoiRepository.dart';
import 'package:flutter_architecture_template/view/viewmodel/RootViewModel.dart';

class DetailViewModel extends RootViewModel {
  final PoiRepository _repository;

  String _id = "";

  Poi _poi;

  String get id => _id;

  String get poiTitle => _poi.title;

  double get poiLat => _poi.lat;

  double get poiLng => _poi.lng;

  DetailViewModel(this._repository);

  @override
  initialize() {
    // Nothing to do here
  }

  void onDetailIdFound(String id) {
    _id = id;
    _getPoiDetail(id);
  }

  void _getPoiDetail(String id) async {
    showProgress();

    _poi = await _repository.getPoi(id);
    notify();

    hideProgress();
  }
}
