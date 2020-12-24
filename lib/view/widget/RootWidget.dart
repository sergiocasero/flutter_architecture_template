import 'package:flutter/material.dart';
import 'package:flutter_architecture_template/view/viewmodel/RootViewModel.dart';
import 'package:stacked/stacked.dart';

abstract class RootWidget<T extends RootViewModel> extends StatelessWidget {
  final T _model;

  get model => _model;

  RootWidget(this._model);

  Widget build(BuildContext context) {
    return ViewModelBuilder<T>.reactive(
      builder: (ctx, model, child) {
        return widget(model);
      },
      viewModelBuilder: () => _model,
      onModelReady: (model) => model.initialize(),
    );
  }

  Widget widget(T model);

  Widget withProgress({@required Widget body, @required T model}) {
    return Stack(
      children: [
        body,
        model.loading ? Center(child: CircularProgressIndicator()) : Container(),
      ],
    );
  }
}
