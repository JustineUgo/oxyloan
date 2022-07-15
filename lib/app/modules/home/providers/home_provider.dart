import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:loan/app/modules/authentication/models/profile.dart';
import 'package:loan/app/modules/home/models/loan_model.dart';

class HomeProvider extends GetConnect {
  
    FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }


  loanApply(Profile profile, Loan loan)async{
    
    CollectionReference userCollection = firestore.collection(profile.id);

    try{
      await userCollection.doc(loan.id).set(
        loan.toMap()
      );
      return 'Success';
    }catch (e){
      print(e);
      return null;
    }
  }

  payLoan(Profile profile, Loan loan)async{
    try{
      CollectionReference userCollection = firestore.collection(profile.id);
      //save id in users collection
      await userCollection.doc(loan.id).update(loan.toMap());
      return "success";
    }catch(e){
      return null;
    }
  }

}
