
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan/app/data/field.dart';
import 'package:loan/app/modules/authentication/controllers/authentication_controller.dart';
import 'package:loan/app/modules/home/bindings/home_binding.dart';
import 'package:loan/app/modules/home/views/home_view.dart';
import 'package:loan/app/util/color.dart';

class Signup extends StatefulWidget {
  const Signup({
    Key? key, required this.firstname, required this.lastname, required this.email, required this.phone, required this.password, required this.confirmPassword, required this.controller,
  }) : super(key: key);
  final TextEditingController firstname;
  final TextEditingController lastname;
  final TextEditingController email;
  final TextEditingController phone;
  final TextEditingController password;
  final TextEditingController confirmPassword;
  final AuthenticationController controller;

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'New \nAccount',
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  fontFamily: "QKS",
                  height: .9
                ),
              )
            ],
          ),
          const SizedBox(height: 30,),
          Row(
            children: [
              Expanded(
                child: Field(icon: CupertinoIcons.person, name: 'firstname', textEditingController: widget.firstname,),
              ),
              const SizedBox(width: 5,),
              Expanded(
                child: Field(icon: CupertinoIcons.person_2, name: 'lastname', textEditingController: widget.lastname,),
              ),
            ],
          ),
          const SizedBox(height: 10,),
          Field(icon: CupertinoIcons.mail, name: 'email', textEditingController: widget.email,) ,
          const SizedBox(height: 10,),
          Field(icon: CupertinoIcons.phone, name: 'phone', textEditingController: widget.phone,),
          const SizedBox(height: 10,),
          Row(
            children: [
              Expanded(
                child: Field(icon: CupertinoIcons.lock, name: 'password', textEditingController: widget.password),
              ),
              const SizedBox(width: 5,),
              Expanded(
                child: Field(icon: CupertinoIcons.lock, name: 'confirm password', textEditingController: widget.confirmPassword,),
              ),
            ],
          ),
          
          const SizedBox(height: 40,),
          
          Container(
            width: Get.width,
            child: Obx(()=>
              ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(const StadiumBorder()),
                  backgroundColor: widget.controller.isProcessing.value?MaterialStateProperty.all(black.withOpacity(.5)):MaterialStateProperty.all(black),
                ),
                onPressed: widget.controller.isProcessing.value?null:
                 ()=>widget.controller.verifyInputs(widget.controller.isReg.value), 
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 22),
                  child: Obx(()=>
                    Text(
                      widget.controller.isProcessing.value?'Processing...':'Sign up'
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10,),
          TextButton(
            onPressed: ()=> widget.controller.isReg.value=false,
            child: Text(
              'Sign into your account',
              style: TextStyle(
                // color: Colors.blueAccent,
                fontFamily: 'QKS',

              ),
            ),
          )
        ],
      ),
    );
  }
}
