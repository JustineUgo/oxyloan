import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:loan/app/data/controller.dart';
import 'package:loan/app/modules/authentication/models/profile.dart';
import 'package:loan/app/modules/authentication/providers/authentication_provider.dart';
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

  clearControllers(){
    firstname.clear();
    lastname.clear();
    email.clear();
    phone.clear();
    password.clear();
    confirmPassword.clear();
  }

}
