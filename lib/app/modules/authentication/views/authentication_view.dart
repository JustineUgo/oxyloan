import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:loan/app/data/background.dart';
import 'package:loan/app/modules/authentication/views/widgets/signin_form.dart';
import 'package:loan/app/modules/authentication/views/widgets/sigup_form.dart';
import 'package:loan/app/util/color.dart';
import 'package:loan/app/util/image.dart';

import '../controllers/authentication_controller.dart';

class AuthenticationView extends GetView<AuthenticationController> {
  const AuthenticationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark
    ));

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Background(child: Container()),
            Container(
              height: Get.height/2,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(authImage),
                  fit: BoxFit.cover
                )
              ),
            ),
            Container(
              height: Get.height/2,
              color: black.withOpacity(.2),
            ),
            Positioned(
              child: Container(
                height: Get.height/2,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 30, ),
                child: Text(
                  "Easy loan\nBettter finance",
                  style: TextStyle(
                    color: white,
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                    fontFamily: "QKS",
                    height: 1.2
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: Get.width,
                height: Get.height/1.6,
                padding: const EdgeInsets.only(left: 30, right: 30, top: 50),
                decoration: BoxDecoration(
                  color: white, 
                  borderRadius: const BorderRadius.horizontal(left: Radius.circular(50), right: Radius.circular(50)),
                ),
                child: 
                
                // Signup(
                //   firstname: controller.firstname,
                //   lastname: controller.lastname,
                //   email: controller.email,
                //   phone: controller.phone,
                //   password: controller.password,
                //   confirmPassword: controller.confirmPassword
                // ),
                Obx(()=> controller.isReg.value?
                  Signup(
                    controller: controller,
                    firstname: controller.firstname,
                    lastname: controller.lastname,
                    email: controller.email,
                    phone: controller.phone,
                    password: controller.password,
                    confirmPassword: controller.confirmPassword
                  )
                  :Signin(
                    controller: controller,
                    email: controller.email,
                    password: controller.password,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
