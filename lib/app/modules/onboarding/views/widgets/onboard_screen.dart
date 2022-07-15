
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:loan/app/data/background.dart';
import 'package:loan/app/modules/authentication/bindings/authentication_binding.dart';
import 'package:loan/app/modules/authentication/views/authentication_view.dart';
import 'package:loan/app/modules/home/bindings/home_binding.dart';
import 'package:loan/app/modules/home/views/home_view.dart';
import 'package:loan/app/util/color.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({
    Key? key, this.image, this.bgColor, required this.title, required this.subTitle, required this.index, required this.controller
  }) : super(key: key);

  final String? image;
  final Color? bgColor;
  final String title;
  final String subTitle;
  final int index;
  final LiquidController controller;

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Background(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: widget.bgColor,
              image: widget.image==null?null: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(widget.image!,),
              )
            ),
          ),
          Background(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0),
                    Colors.black.withOpacity(.9)
                  ]
                )
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: ()=>Get.offAll(()=>const AuthenticationView(), binding: AuthenticationBinding()), 
                      child: const Text(
                        'Skip',
                        style: TextStyle(color: Colors.black),
                      )
                    ),
                  ]
                ),
                
                const Spacer(flex: 3,),
                
                Text(
                  widget.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                    fontFamily: "QKS",
                    height: .8
                  ),
                  maxLines: 2,
                ),
                const SizedBox(height: 10,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        widget.subTitle,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontFamily: "QKS",
                          // height: .8
                        ),
                        maxLines: 3,
                      ),
                    ),
                  ]
                ),

                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.black87),
                      ),
                      onPressed: ()=>  widget.index+1<3?widget.controller.animateToPage(page: widget.index+1):
                      Get.offAll(()=>AuthenticationView(), binding: AuthenticationBinding()), 
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Icon(Icons.chevron_right),
                      )
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}