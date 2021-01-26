import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_architecture_template/di/Locator.dart';
import 'package:flutter_architecture_template/view/viewmodel/DetailViewModel.dart';
import 'package:flutter_architecture_template/view/widget/RootWidget.dart';
import 'package:get/get.dart';

class DetailWidget extends RootWidget<DetailViewModel> {
  DetailWidget() : super(getIt());

  @override
  Widget widget(DetailViewModel model) {
    model.onDetailIdFound(Get.arguments);
    return Scaffold(
      body: Center(child: Text(model.poiTitle)),
    );
  }
}
