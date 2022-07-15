
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan/app/util/color.dart';

class ApproveForm extends StatefulWidget {
  const ApproveForm({
    Key? key,
  }) : super(key: key);

  @override
  State<ApproveForm> createState() => _ApproveFormState();
}

class _ApproveFormState extends State<ApproveForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height/2.2,
      decoration: BoxDecoration(
        color: white, 
        borderRadius: const BorderRadius.vertical(top: Radius.circular(50),),
      ),
      padding: const EdgeInsets.only(left: 30, right: 30, top: 50),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Congratulations',
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  fontFamily: "QKS",
                  height: .9
                ),
              ),
            ],
          ),
          const Spacer(),
          CircleAvatar(
            radius: 40,
            backgroundColor: primary,
            child: Icon(CupertinoIcons.check_mark),
          ),
          Text(
            'Successful',
            style: TextStyle(
              fontFamily: 'QKS',
              fontSize: 20,
              color: primary,
              fontWeight: FontWeight.w600
            ),
          ),
          const Spacer(),
          Container(
            width: Get.width,
            child: ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(const StadiumBorder()),
                backgroundColor: MaterialStateProperty.all(black)
              ),
              onPressed: ()=>Get.back(), 
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 22),
                child: Text(
                  'Done'
                ),
              ),
            ),
          ),
          const SizedBox(height: 20,),
        ],
      ),
    );
  }
}
