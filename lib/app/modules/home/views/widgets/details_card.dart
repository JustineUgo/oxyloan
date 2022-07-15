
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan/app/modules/home/controllers/home_controller.dart';
import 'package:loan/app/modules/home/views/widgets/loan_form.dart';
import 'package:loan/app/util/color.dart';

class DetailsCard extends StatelessWidget {
  const DetailsCard({
    Key? key, required this.controller,
  }) : super(key: key);
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40,),
        SizedBox(
          width: Get.width/2,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(primary),
              shape: MaterialStateProperty.all(const StadiumBorder())
            ),
            onPressed: ()=>Get.bottomSheet(
              LoanForm(controller: controller, ),
              barrierColor: primary.withOpacity(.5),
              isScrollControlled: true,
            ), 
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(CupertinoIcons.add),
                const SizedBox(width: 5,),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Text(
                    'Request Loan',
                    style: TextStyle(
                      fontFamily: 'QKS'
                    ),
                  ),
                ),
              ],
            )
          ),
        ),
        const SizedBox(height: 20),
        // Text(
        //   'email@gmail.com',
        //   style: TextStyle(
        //     fontFamily: 'QKS',
        //     fontSize: 16,
        //     color: white,
        //     fontWeight: FontWeight.w700,
        //     height: .8
        //   ),
        // ),
        
        // const SizedBox(height: 10,),
        Text(
          'Ogaraku Justine',
          style: TextStyle(
            fontFamily: 'QKS',
            fontSize: 20,
            color: white,
            // fontWeight: FontWeight.w700,
            height: .9,
            letterSpacing: 5
          ),
        ),
        const Spacer(),
        Text(
          'TOTAL LOANS APPLIED',
          style: TextStyle(
            fontFamily: 'QKS',
            fontSize: 13,
            color: white,
            fontWeight: FontWeight.w700,
            height: 1
          ),
        ),
        const SizedBox(height: 30),
        Text(
          '124',
          style: TextStyle(
            fontFamily: 'QKS',
            fontSize: 60,
            color: white,
            fontWeight: FontWeight.w500,
            height: .5
          ),
        ),
        const SizedBox(height: 15),
        Text(
          'TOTAL ACTIVE LOAN: 3',
          style: TextStyle(
            fontFamily: 'QKS',
            fontSize: 13,
            color: white,
            fontWeight: FontWeight.w700,
            height: .1,
            letterSpacing: 2
          ),
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: primary.withOpacity(.6),
                  child: Icon(CupertinoIcons.arrow_down),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '₦ 32,500',
                      style: TextStyle(
                        fontFamily: "QKS",
                        color: white,
                        fontSize: 18,
                        letterSpacing: -1,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                    Text(
                      'Total amount\n(Requested)',
                      style: TextStyle(
                        fontFamily: "QKS",
                        color: Colors.white70,
                        fontSize: 14,
                        letterSpacing: -1,
                        height: .9
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: primary.withOpacity(.6),
                  child: Icon(CupertinoIcons.arrow_up),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '₦ 32,500',
                      style: TextStyle(
                        fontFamily: "QKS",
                        color: white,
                        fontSize: 18,
                        letterSpacing: -1,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                    Text(
                      'Total Repayed',
                      style: TextStyle(
                        fontFamily: "QKS",
                        color: Colors.white70,
                        fontSize: 14,
                        letterSpacing: -1,
                        height: .9
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
        const SizedBox(height: 50,)
      ],
    );
  }
}
