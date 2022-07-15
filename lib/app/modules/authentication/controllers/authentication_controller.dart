import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:loan/app/data/controller.dart';
import 'package:loan/app/modules/authentication/models/profile.dart';
import 'package:loan/app/modules/authentication/providers/authentication_provider.dart';
import 'package:loan/app/modules/authentication/views/widgets/signin_form.dart';
import 'package:loan/app/modules/home/bindings/home_binding.dart';
import 'package:loan/app/modules/home/views/home_view.dart';
import 'package:loan/app/util/collection.dart';
import 'package:loan/app/util/color.dart';

class AuthenticationController extends GetxController {
  AuthenticationProvider authenticationProvider = AuthenticationProvider();
  GetStorage storage = GetStorage();
  
  final TextEditingController firstname = TextEditingController();
  final TextEditingController lastname= TextEditingController();
  final TextEditingController email= TextEditingController();
  final TextEditingController phone= TextEditingController();
  final TextEditingController password= TextEditingController();
  final TextEditingController confirmPassword= TextEditingController();

  //check type of fomr (reg or login)
  var isReg = true.obs;

  //check loading state
  var isProcessing = false.obs;

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


  verifyInputs(bool isReg,){
    //verify form is filled
    if(isReg){
      if(firstname.text.isEmpty){
        AppController.showToast('Enter your firstname');
      }else if(lastname.text.isEmpty){
        AppController.showToast('Enter your lastname');
      }else if(email.text.isEmpty){
        AppController.showToast('Enter your email');
      }else if(phone.text.isEmpty){
        AppController.showToast('Enter your phone number');
      }else if(password.text.isEmpty){
        AppController.showToast('Enter your password');
      }else if(confirmPassword.text.isEmpty){
        AppController.showToast('Enter your confirm password');
      }else if(confirmPassword.text!=password.text){
        AppController.showToast('Password do not match');
      }else{
        siginup();
      }
    }else{
      if(email.text.isEmpty){
        AppController.showToast('Enter your email');
      }else if(password.text.isEmpty){
        AppController.showToast('Enter your password');
      }else{
        signin();
      }
    }
  }

  siginup()async{
    isProcessing.value = true;

    Profile _profile = Profile(
      id: 'id', firstname: firstname.text.trim(), lastname: lastname.text.trim(), email: email.text.trim(), phone: phone.text.trim()
    );

    String? response = await authenticationProvider.signupUser(_profile.email, password.text.trim());
    
    //check response
    switch (response) {
      case "null":
        AppController.showToast('Please, check your internet and try again.');
        isProcessing.value = false;
        break;
      case 'The password provided is too weak':
        AppController.showToast('Your password cannot be less than six characters');
        isProcessing.value = false;
        break;
      case 'The account already exists for that email':
        AppController.showToast('An account already exists for that email');
        isProcessing.value = false;
        break;
      default:
        {
          Profile profile = _profile.copyWith(id: response); 
          saveProfile(profile);
        }
        break;
    }
  }

  saveProfile(Profile profile)async{
    //expect success or nulll
    String? response = await authenticationProvider.saveUserCredentials(profile, user);

    if (response == "Success") {
      storage.write('profile', profile.toMap());
      AppController.showToast('Account created successfully');
      clearControllers();

      //switch to signin
      isReg.value=false;
    } else {
      AppController.showToast('Something went wrong. Please try again');
    }
    isProcessing.value=false;
  }


  void signin() async {
    print("Signing in");

    isProcessing.value = true;

    var response = await authenticationProvider.signinUser(
      email.text.trim(), password.text.trim()
    );

    //check response
    switch (response.toString()) {
      case "null":
        AppController.showToast('Something went wrong, check your internet and try again.');
        isProcessing.value = false;
        break;
      case 'No user found for that email.':
        AppController.showToast("This email does not exist. Please sign up if you haven't already.");
        isProcessing.value = false;
        clearControllers();
        break;
      case 'Wrong password provided for that user.':
        AppController.showToast("Your password is wrong. Please check it and try again.");
        isProcessing.value = false;
        password.clear();
        break;
      default:
        {
          //Success
          AppController.showToast('Retrieving information');

          saveUserInfo(response!);
      }
      break;
    }
  }

  void saveUserInfo(String uid) async {
    try {
      var response = await authenticationProvider.retrieveUser(uid);
      Profile profile = Profile.fromMap(response);
      await storage.write('profile', profile.toMap());
      
      //on success save info and move to dashboard
      storage.write('isLoggedin', true);
      storage.write('isLight', true);
      isProcessing.value = false;
      AppController.showToast('Sigin successful');
      Get.offAll(()=>HomeView(), binding: HomeBinding());
      clearControllers();

    } catch (e) {
      
      clearControllers();
      isProcessing.value = false;

      AppController.showToast('Something went wrong. Check internet connection');
    }
  }


  clearControllers(){
    firstname.clear();
    lastname.clear();
    email.clear();
    phone.clear();
    password.clear();
    confirmPassword.clear();
  }

}
