import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:loan/app/data/controller.dart';
import 'package:loan/app/modules/authentication/bindings/authentication_binding.dart';
import 'package:loan/app/modules/authentication/models/profile.dart';
import 'package:loan/app/modules/authentication/views/authentication_view.dart';
import 'package:loan/app/modules/home/views/widgets/approve_form.dart';
import 'package:loan/app/util/color.dart';

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
  TextEditingController paybackDuration = TextEditingController();

  var isProcessing = false.obs;

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

  verifyInput(){
    if(name.text.trim().isEmpty){
      AppController.showToast('Enter your fulname');
    }else if(phone.text.trim().isEmpty){
      AppController.showToast('Enter your phone number');
    }else if(address.text.trim().isEmpty){
      AppController.showToast('Enter your home address');
    }else if(amount.text.trim().isEmpty){
      AppController.showToast('Enter the amount you want');
    }else if(bankName.text.trim().isEmpty){
      AppController.showToast('Enter the name of your bank');
    }else if(acctNo.text.trim().isEmpty){
      AppController.showToast('Enter your account number');
    }else if(reason.text.trim().isEmpty){
      AppController.showToast('Enter reason for the loan');
    }else if(paybackDuration.text.trim().isEmpty){
      AppController.showToast('Enter period of loan payback');
    }else{
      
      loanApply();
    }
  }

  loanApply()async{
    AppController.showToast('Processing');
    isProcessing.value=true;
    await Future.delayed(const Duration(seconds: 2));
    isProcessing.value=false;
    Get.back();
    Get.bottomSheet(
      ApproveForm(),
      barrierColor: primary.withOpacity(.5),
      isScrollControlled: true,
    );
  }

  void logout()async{
    AppController.showToast('Logging user out');
    await Future.delayed(const Duration(seconds: 2));
    storage.write('isLoggedin', false);
    Get.offAll(()=>AuthenticationView(), binding: AuthenticationBinding());
  }
}
