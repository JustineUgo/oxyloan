
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Field extends StatefulWidget {
  const Field({
    Key? key, required this.name, required this.icon, required this.textEditingController,
  }) : super(key: key);
  final String name;
  final IconData icon;
  final TextEditingController textEditingController;

  @override
  State<Field> createState() => _FieldState();
}

class _FieldState extends State<Field> {
  var isLocked = true.obs;
  @override
  Widget build(BuildContext context) {
    return Obx(()=>
      TextField(
        textCapitalization: TextCapitalization.sentences,
        controller: widget.textEditingController,
        style: const TextStyle(
          fontFamily: 'QKS',
          fontSize: 14
        ),
        obscureText: widget.name=="password" || widget.name == "confirm password"? isLocked.value:!isLocked.value,
        keyboardType: widget.name=="phone" || widget.name =="account no."|| widget.name =="amount"?TextInputType.number:null,
        decoration: InputDecoration(
          hintText: widget.name,
          hintStyle: const TextStyle(
            fontFamily: 'QKS',
            fontSize: 14
          ),
          prefixIcon: GestureDetector(
            onTap: ()=>isLocked.value = !isLocked.value,
            child: widget.name=="password" || widget.name == "confirm password"? Obx(()=>
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Icon(
                  isLocked.value?CupertinoIcons.lock_open: widget.icon ,size: 16,
                ),
              )
            ):
            Icon(
              widget.icon ,size: 16,
            ),
          ),
        ),
      ),
    );
  }
}
