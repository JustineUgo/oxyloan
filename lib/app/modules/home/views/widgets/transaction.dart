
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loan/app/modules/home/controllers/home_controller.dart';
import 'package:loan/app/modules/home/models/loan_model.dart';
import 'package:loan/app/util/color.dart';

class LoanTransaction extends StatefulWidget {
  const LoanTransaction({
    Key? key, required this.loan, required this.controller,
  }) : super(key: key);
  final Loan loan;
  final HomeController controller;

  @override
  State<LoanTransaction> createState() => _LoanTransactionState();
}

class _LoanTransactionState extends State<LoanTransaction> {
  Map<String, IconData> icons = {
    "Business": CupertinoIcons.briefcase, 
    "Electricity": CupertinoIcons.bolt, 
    "Medical": CupertinoIcons.bandage, 
    "Gift": CupertinoIcons.gift, 
    "House": CupertinoIcons.house, 
    "Others": Icons.more_horiz
  };
  NumberFormat moneyFormatter = NumberFormat.decimalPattern('en_us');

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
              child: Icon(icons[widget.loan.reason], color: primary,),
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
              '${widget.loan.date_created} . Due: ${widget.loan.duration} month',
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
                  '₦ '+moneyFormatter.format(int.parse(widget.loan.amount)),
                  style: TextStyle(
                    fontFamily: "QKS",
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                GestureDetector(
                  onTap: () => widget.controller.payLoan(widget.loan),
                  child: Text(
                    widget.loan.isPaid? 'Paid':'Pay',
                    style: TextStyle(
                      fontFamily: "QKS",
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: widget.loan.isPaid? Colors.grey: Colors.green,
                    ),
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
