
// import 'package:expendable_fab/expendable_fab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:loan/app/data/background.dart';
import 'package:loan/app/data/expandable_fab.dart';
import 'package:loan/app/modules/home/views/widgets/header.dart';
import 'package:loan/app/modules/home/views/widgets/loan_form.dart';
import 'package:loan/app/modules/home/views/widgets/transaction.dart';
import 'package:loan/app/util/color.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: primary,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark
    ));

    return Scaffold(
      floatingActionButton: ExpendableFabb(
        distance: 50.0,
        children: [
          ActionButton(
            onPressed: () => controller.logout(),
            icon: const Icon(CupertinoIcons.square_arrow_left),
          ),
          ActionButton(
            onPressed: (){
              Get.bottomSheet(
                LoanForm(controller: controller, ),
                barrierColor: primary.withOpacity(.5),
                isScrollControlled: true,
              );
            },
            icon: const  Icon(CupertinoIcons.add),
          ),
        ],
      ),
      body: Stack(
        children: [
          Background(
            child: Obx(()=>
              Container(
                color: controller.isLight.value?null:Color(0xff1B2430),
              ),
            ),
          ),
          Obx(()=>
            CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  pinned: true,
                  backgroundColor: primary,
                  expandedHeight: 350.0,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text(
                      controller.title.value,
                      style: TextStyle(
                        // color: black,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        fontFamily: "QKS"
                      ),
                     ),
                    titlePadding: const EdgeInsets.symmetric(horizontal: 20),
                    background: Header(controller: controller, ),
                  ),
                ),
                
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (_, int index) {
                      return LoanTransaction(loan: controller.loans[controller.loans.length-1-index], controller: controller,);
                      
                    },
                    childCount: controller.loans.length,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: Obx(()=>controller.loans.isEmpty?
              Container(
              height: Get.height-345,
              width: Get.width,
              child: Center(
                child: Obx(()=>
                    Text(
                      controller.isFetchingLoans.value? "Getting record...":"You haven't requested for loan",
                      style: const TextStyle(
                        fontFamily: 'QKS',
                        fontSize: 16
                      ),
                    ),
                  )
                ),
              ):const SizedBox.shrink(),
            ),
          )
        ],
      ),
    );
  }
}
