import 'package:flutter_architecture_template/view/widget/DetailWidget.dart';
import 'package:get/get.dart';

class Navigator {
  void toDetail(String id) {
    Get.to(DetailWidget(), arguments: id);
  }

  void back() {
    Get.back();
  }
}
