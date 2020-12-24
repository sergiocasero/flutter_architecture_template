import 'package:flutter/material.dart';
import 'package:flutter_architecture_template/view/viewmodel/SplashViewModel.dart';
import 'package:flutter_architecture_template/view/widget/RootWidget.dart';

class SplashWidget extends RootWidget<SplashViewModel> {
  SplashWidget() : super(SplashViewModel());

  @override
  Widget widget(SplashViewModel model) {
    return Scaffold(
      body: withProgress(
        body: Center(
          child: Text(model.helloWorld),
        ),
        model: model,
      ),
    );
  }
}
