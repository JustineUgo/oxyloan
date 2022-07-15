import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:loan/app/data/controller.dart';
import 'package:loan/app/modules/authentication/bindings/authentication_binding.dart';
import 'package:loan/app/modules/authentication/models/profile.dart';
import 'package:loan/app/modules/authentication/views/authentication_view.dart';
import 'package:loan/app/modules/home/models/loan_model.dart';
import 'package:loan/app/modules/home/providers/home_provider.dart';
import 'package:loan/app/modules/home/views/widgets/approve_form.dart';
import 'package:loan/app/modules/home/views/widgets/transaction.dart';
import 'package:loan/app/util/color.dart';

class HomeController extends GetxController {
  late Profile profile;
  GetStorage storage = GetStorage();

  HomeProvider homeProvider = HomeProvider();
    FirebaseFirestore firestore = FirebaseFirestore.instance;

  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController acctNo = TextEditingController();
  TextEditingController bankName = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController amount = TextEditingController();
  TextEditingController reason = TextEditingController();
  TextEditingController paybackDuration = TextEditingController();

  late StreamSubscription<QuerySnapshot<Map<String, dynamic>>> transactions;

  var isProcessing = false.obs;
  var isFetchingLoans = true.obs;

  var loans = [].obs;

  var activeLoans = 0.obs;
  var totalLoans = 0.obs;
  var totalPayed = 0.obs;
  
  var title = 'Transactions'.obs;

  var isLight = true.obs;

  @override
  void onInit() {
    initProfile();
    getTransactions();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void initProfile(){
    profile = Profile.fromMap( storage.read('profile'));

    isLight.value = storage.read('isLight');
  }

  verifyInput(){
    if(name.text.trim().isEmpty){
      AppController.showToast('Enter your fulname');
    }else if(phone.text.trim().isEmpty){
      AppController.showToast('Enter your phone number');
    }else if(address.text.trim().isEmpty){
      AppController.showToast('Enter your home address');
    }else if(amount.text.trim().isEmpty){
      AppController.showToast('Enter the amount you want');
    }else if(bankName.text.trim().isEmpty){
      AppController.showToast('Enter the name of your bank');
    }else if(acctNo.text.trim().isEmpty){
      AppController.showToast('Enter your account number');
    }else if(reason.text.trim().isEmpty){
      AppController.showToast('Enter reason for the loan');
    }else if(paybackDuration.text.trim().isEmpty){
      AppController.showToast('Enter period of loan payback');
    }else{
      
      loanApply();
    }
  }

  loanApply()async{
    AppController.showToast('Processing');
    isProcessing.value=true;

    String _id = firestore.collection(profile.id).doc().id;
    String day = DateTime.now().day.toString();
    String mth = DateTime.now().month.toString();
    String yr = DateTime.now().year.toString().substring(2);
    String date = day+'/'+mth+'/'+yr;
    Loan loan = Loan(
      id: _id, 
      fullname: name.text.trim(),
      address: address.text.trim(), 
      acctNumber: acctNo.text.trim(), 
      bankName: bankName.text.trim(), 
      phoneNo: phone.text.trim(), 
      amount: amount.text.trim(), 
      reason: reason.text.trim(),
      duration: paybackDuration.text.trim(),
      isPaid: false,
      date_created: date,
      index: DateTime.now().millisecondsSinceEpoch
    );

    String? response = await homeProvider.loanApply(profile, loan);

    if(response==null){
      AppController.showToast('Something wen wrong. Try again');
    }else{
      AppController.showToast('Request successful');
      Get.back();
      clearControllers();
      Get.bottomSheet(
        ApproveForm(),
        barrierColor: primary.withOpacity(.5),
        isScrollControlled: true,
      );
    }
    isProcessing.value=false;
  }

  getTransactions()async{
    transactions =
    firestore.collection(profile.id).snapshots().listen((event)=>event);
    
    transactions.onData((_loans) { 
      loans.clear();
      isFetchingLoans.value = true;
      _loans.docs.forEach((loanMap) {
        loans.add(Loan.fromMap(loanMap.data()));
      });

      //order loans
      loans.sort((a, b)=>a.index.compareTo(b.index));

      calcDetails(loans);
      isFetchingLoans.value=false;
    });
  }
  

  //calc data from loans
  calcDetails(List loans){
    totalLoans.value = 0;
    activeLoans.value = 0;
    totalPayed.value = 0;

    loans.forEach((loan) { 
      totalLoans.value+= int.parse(loan.amount);
      loan.isPaid==true ? activeLoans.value += 0 : activeLoans.value += 1;
      loan.isPaid==true ? totalPayed.value+=int.parse(loan.amount):  totalPayed.value+=0;
    });
  }

  void logout()async{
    AppController.showToast('Logging user out');
    await Future.delayed(const Duration(seconds: 2));
    storage.write('isLoggedin', false);
    Get.offAll(()=>AuthenticationView(), binding: AuthenticationBinding());
  }

  payLoan(Loan loan)async{
    AppController.showToast('Processing request');
    Loan updatedLoan = loan.copyWith(isPaid: true);
    String?  response = await homeProvider.payLoan(profile, updatedLoan);
    if(response == 'success'){
      AppController.showToast('Requested successful. Paid!');
    }else{
      AppController.showToast('Something went wrong. Check internet connection');
    }
  }

  changeTheme(){
    isLight.value = !isLight.value;
    storage.write('isLight', isLight.value);
  }

  clearControllers(){
    name.clear();
    phone.clear();
    address.clear();
    amount.clear();
    bankName.clear();
    acctNo.clear();
    reason.clear();
    paybackDuration.clear();
  }
}
