import 'dart:ui';

import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:loan/app/util/color.dart';

class OnboardingController extends GetxController {
  LiquidController controller = LiquidController();
  
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

  List<Color> colors = [
    Color(0xffc4e0b7),
    Color(0xffa6a08b),
    onboard
  ]; 
}
