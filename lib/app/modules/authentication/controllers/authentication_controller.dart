import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthenticationController extends GetxController {
  
  
  final TextEditingController firstname = TextEditingController();
  final TextEditingController lastname= TextEditingController();
  final TextEditingController email= TextEditingController();
  final TextEditingController phone= TextEditingController();
  final TextEditingController password= TextEditingController();
  final TextEditingController confirmPassword= TextEditingController();

  var isReg = true.obs;

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
