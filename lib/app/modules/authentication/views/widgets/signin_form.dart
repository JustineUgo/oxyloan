
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan/app/data/field.dart';
import 'package:loan/app/modules/authentication/controllers/authentication_controller.dart';
import 'package:loan/app/util/color.dart';

class Signin extends StatefulWidget {
  const Signin({
    Key? key,  required this.email, required this.password, required this.controller, 
  }) : super(key: key);
  final TextEditingController email;
  final TextEditingController password;
  final AuthenticationController controller;

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Welcome \nBack',
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w600,
                fontFamily: "QKS",
                height: .9
              ),
            )
          ],
        ),
        const Spacer(),
        Field(icon: CupertinoIcons.mail, name: 'email', textEditingController: widget.email,) ,
        const SizedBox(height: 10,),
        Field(icon: CupertinoIcons.lock, name: 'password', textEditingController: widget.password),
        
        const Spacer(),
        
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
                    widget.controller.isProcessing.value?'Processing...':'Sign in'
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10,),
        TextButton(
            onPressed: ()=> widget.controller.isReg.value=true,
          child: Text(
            'Create account here',
            style: TextStyle(
              // color: Colors.blueAccent,
              fontFamily: 'QKS',

            ),
          ),
        )
      ],
    );
  }
}
