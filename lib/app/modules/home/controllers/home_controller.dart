import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:loan/app/data/controller.dart';
import 'package:loan/app/modules/authentication/bindings/authentication_binding.dart';
import 'package:loan/app/modules/authentication/models/profile.dart';
import 'package:loan/app/modules/authentication/views/authentication_view.dart';

class HomeController extends GetxController {
  late Profile profile;
  GetStorage storage = GetStorage();

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
    initProfile();
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

  void initProfile(){
    profile = Profile.fromMap( storage.read('profile'));
  }

  void logout()async{
    AppController.showToast('Logging user out');
    await Future.delayed(const Duration(seconds: 2));
    storage.write('isLoggedin', false);
    Get.offAll(()=>AuthenticationView(), binding: AuthenticationBinding());
  }
}
