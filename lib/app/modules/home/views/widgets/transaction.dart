
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loan/app/util/color.dart';

class Transaction extends StatefulWidget {
  const Transaction({
    Key? key,
  }) : super(key: key);

  @override
  State<Transaction> createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 20,
              backgroundColor: Color(0xff1294ae).withOpacity(.1),
              child: Icon(CupertinoIcons.briefcase_fill, color: primary,),
            ),
            title: Text(
              'Gift',
              style: TextStyle(
                letterSpacing: 3,
                fontFamily: "QKS",
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            subtitle: Text(
              '01/12/20 . Due: a month',
              style: TextStyle(
                fontFamily: "QKS",
                fontSize: 12,
                fontWeight: FontWeight.bold
              ),
            ),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '₦ 3,500',
                  style: TextStyle(
                    fontFamily: "QKS",
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'Pay',
                  style: TextStyle(
                    fontFamily: "QKS",
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
          Divider()
        ],
      ),
    );
  }
}
