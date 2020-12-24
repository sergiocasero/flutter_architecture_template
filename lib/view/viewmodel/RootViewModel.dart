import 'package:stacked/stacked.dart';

abstract class RootViewModel extends BaseViewModel {
  bool _loading = false;

  bool get loading => _loading;

  initialize();

  void showProgress() {
    _loading = true;
    notify();
  }

  void hideProgress() {
    _loading = false;
    notify();
  }

  void notify() {
    notifyListeners();
  }
}
