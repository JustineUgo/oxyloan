
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan/app/modules/home/controllers/home_controller.dart';
import 'package:loan/app/modules/home/views/widgets/loan_form.dart';
import 'package:loan/app/util/color.dart';
import 'package:intl/intl.dart';

class DetailsCard extends StatefulWidget {
  const DetailsCard({
    Key? key, required this.controller,
  }) : super(key: key);
  final HomeController controller;

  @override
  State<DetailsCard> createState() => _DetailsCardState();
}

class _DetailsCardState extends State<DetailsCard> {
  NumberFormat moneyFormatter = NumberFormat.decimalPattern('en_us');

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(CupertinoIcons.sun_min, color: black.withOpacity(0),), 
            ),
            SizedBox(
              width: Get.width/2,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(primary),
                  shape: MaterialStateProperty.all(const StadiumBorder())
                ),
                onPressed: ()=>Get.bottomSheet(
                  LoanForm(controller: widget.controller, ),
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
            GestureDetector(
              onTap: ()=>widget.controller.changeTheme(),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Obx(()=>
                  Icon(
                    CupertinoIcons.sun_min_fill, 
                    color: widget.controller.isLight.value?null:white,
                  ),
                ),
              ),
            ),
          ],
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
          widget.controller.profile.firstname+' '+widget.controller.profile.lastname,
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
        Obx(()=>
          Text(
            widget.controller.loans.length.toString(),
            style: TextStyle(
              fontFamily: 'QKS',
              fontSize: 60,
              color: white,
              fontWeight: FontWeight.w500,
              height: .5
            ),
          ),
        ),
        const SizedBox(height: 15),
        Obx(()=>
          Text(
            'TOTAL ACTIVE LOAN: ${widget.controller.activeLoans.value}',
            style: TextStyle(
              fontFamily: 'QKS',
              fontSize: 13,
              color: white,
              fontWeight: FontWeight.w700,
              height: .1,
              letterSpacing: 2
            ),
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
                    Obx((){
                      String figure = moneyFormatter.format(widget.controller.totalLoans.value);
                        return Text(
                          '₦'+figure,
                          style: TextStyle(
                            fontFamily: "QKS",
                            color: white,
                            fontSize: 18,
                            letterSpacing: -1,
                            fontWeight: FontWeight.w700
                          ),
                        );
                      }
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
                    Obx((){
                      String figure = moneyFormatter.format(widget.controller.totalPayed.value);
                      return Text(
                        '₦'+figure,
                        style: TextStyle(
                          fontFamily: "QKS",
                          color: white,
                          fontSize: 18,
                          letterSpacing: -1,
                          fontWeight: FontWeight.w700
                        ),
                      );
                      }
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
