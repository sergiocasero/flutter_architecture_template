import 'package:flutter_architecture_template/view/viewmodel/RootViewModel.dart';

class SplashViewModel extends RootViewModel {
  String _helloWorld = "This is before get info";

  String get helloWorld => _helloWorld;

  @override
  initialize() {
    _mockInitialize();
  }

  void _mockInitialize() async {
    showProgress();

    for (var i = 0; i < 5; i++) {
      await Future.delayed(Duration(seconds: 1));
      print(i);
    }
    _helloWorld = "This is after get info";
    notifyListeners();

    hideProgress();
  }
}
