
// import 'package:expendable_fab/expendable_fab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
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
      // FloatingActionButton(
      //   onPressed: (){
      //     Get.bottomSheet(
      //       LoanForm(controller: controller, ),
      //       barrierColor: primary.withOpacity(.5),
      //       isScrollControlled: true,
      //     );
      //   },
      //   backgroundColor: primary,
      //   child: Icon(CupertinoIcons.add),
      // ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            backgroundColor: primary,
            expandedHeight: 350.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Transactions',
                style: TextStyle(
                  // color: black,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  fontFamily: "QKS"
                ),
               ),
              titlePadding: const EdgeInsets.symmetric(horizontal: 10),
              background: Header(controller: controller, ),
            ),
          ),
          
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, int index) {
                return Transaction();
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
