
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan/app/modules/home/controllers/home_controller.dart';
import 'package:loan/app/modules/home/views/widgets/details_card.dart';
import 'package:loan/app/util/color.dart';
import 'package:loan/app/util/image.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key, required this.controller,
  }) : super(key: key);
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          background,
          height: 380,
          fit: BoxFit.cover,
        ),
        Container(
          height: 380,
          width: Get.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                primary.withOpacity(.4),
                Color(0xff1294ae).withOpacity(.6),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )
          ),
          child: DetailsCard(controller: controller,),
        )
      ],
    );
  }
}
