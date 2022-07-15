import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Background extends StatefulWidget {

  final Widget child;
  const Background({super.key, required this.child}); 

  @override
  _BackgroundState createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.size.height,
      width: Get.size.width,
      child: widget.child,
    );
  }
}