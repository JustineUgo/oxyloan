import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:loan/app/modules/authentication/models/profile.dart';
import 'package:loan/app/util/collection.dart';

class AuthenticationProvider extends GetConnect {

  
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    FirebaseAuth auth = FirebaseAuth.instance;
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  
  Future<String?> signinUser(String email, String password) async{
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password
      );
      return userCredential.user!.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      }
    }catch (e) {
      return null;
    }

    return null;
  }

  Future<String?> signupUser(String email, password,) async{
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password
      );
      
      return userCredential.user!.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email';
      }
    } catch (e) {
      return null;
    }

    return null;
  }

  Future<String?> saveUserCredentials(Profile profile, String collection) async{
    CollectionReference users = firestore.collection(collection);
    
    try{
      await users.doc(profile.id).set(
        profile.toMap()
      );
      return "Success";
    }catch (e){
      print(e);
      return null;
    }
  }


  Future retrieveUser(String uid, ) async{
    CollectionReference users = firestore.collection(user);

    try{
      DocumentSnapshot userSnapshot = await users.doc(uid).get();
      return userSnapshot.data();
    }catch (e){
      print(e);
      return null;
    }
  }

}
