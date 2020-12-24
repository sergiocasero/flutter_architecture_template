import 'package:flutter/material.dart';
import 'package:flutter_architecture_template/di/Locator.dart';
import 'package:flutter_architecture_template/view/viewmodel/SplashViewModel.dart';
import 'package:flutter_architecture_template/view/widget/RootWidget.dart';

class SplashWidget extends RootWidget<SplashViewModel> {
  SplashWidget() : super(SplashViewModel(getIt()));

  @override
  Widget widget(SplashViewModel model) {
    return Scaffold(
      body: withProgress(
        body: ListView.builder(
          itemCount: model.pois.length,
          itemBuilder: (ctx, index) {
            final poi = model.pois[index];
            return ListTile(
              leading: CircleAvatar(child: Text(poi.id)),
              title: Text(poi.title),
              subtitle: Text("Lat: ${poi.lat}, Lng: ${poi.lng}"),
            );
          },
        ),
        model: model,
      ),
    );
  }
}
