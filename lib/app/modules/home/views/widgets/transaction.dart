
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loan/app/modules/home/models/loan_model.dart';
import 'package:loan/app/util/color.dart';

class LoanTransaction extends StatefulWidget {
  const LoanTransaction({
    Key? key, required this.loan,
  }) : super(key: key);
  final Loan loan;

  @override
  State<LoanTransaction> createState() => _LoanTransactionState();
}

class _LoanTransactionState extends State<LoanTransaction> {
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
              widget.loan.reason,
              style: TextStyle(
                letterSpacing: 3,
                fontFamily: "QKS",
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            subtitle: Text(
              '01/12/20 . Due: ${widget.loan.duration} month',
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
                  widget.loan.amount,
                  style: TextStyle(
                    fontFamily: "QKS",
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  widget.loan.isPaid? 'Paid':'Pay',
                  style: TextStyle(
                    fontFamily: "QKS",
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: widget.loan.isPaid? Colors.grey: Colors.green,
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
