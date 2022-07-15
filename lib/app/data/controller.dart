import 'package:fluttertoast/fluttertoast.dart';
import 'package:loan/app/util/color.dart';

class AppController{
  
  static showToast(String text){
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      backgroundColor: black.withOpacity(.5),
      fontSize: 16.0
    );
  }
}