import 'package:flutter/material.dart';
import 'package:flutter_architecture_template/di/Locator.dart';
import 'package:flutter_architecture_template/view/viewmodel/SplashViewModel.dart';
import 'package:flutter_architecture_template/view/widget/RootWidget.dart';

class SplashWidget extends RootWidget<SplashViewModel> {
  SplashWidget() : super(getIt());

  @override
  Widget widget(SplashViewModel model) {
    return Scaffold(
      body: withProgress(
        body: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(child: Text("Clear pois"), onPressed: () => model.onClearPressed()),
                  RaisedButton(child: Text("Get pois"), onPressed: () => model.onGetPressed()),
                  RaisedButton(child: Text("Force from local"), onPressed: () => model.onForceLocalPressed()),
                ],
              ),
              Expanded(
                child: model.pois.isEmpty
                    ? Center(
                        child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Wups, sorry but we don't have the pois, try to get them from network",
                          textAlign: TextAlign.center,
                        ),
                      ))
                    : ListView.builder(
                        shrinkWrap: true,
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
              ),
            ],
          ),
        ),
        model: model,
      ),
    );
  }
}
