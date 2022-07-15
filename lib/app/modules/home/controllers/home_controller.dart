import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController acctNo = TextEditingController();
  TextEditingController bankName = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController amount = TextEditingController();
  TextEditingController reason = TextEditingController();
  TextEditingController payback = TextEditingController();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
