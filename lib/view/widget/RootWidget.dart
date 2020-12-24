import 'package:flutter/material.dart';
import 'package:flutter_architecture_template/view/viewmodel/RootViewModel.dart';

abstract class RootWidget<T extends RootViewModel> extends StatelessWidget {
  final T _model;

  RootWidget(this._model);

  Widget progress() {
    return _model.loading ? Center(child: CircularProgressIndicator()) : Container();
  }
}
