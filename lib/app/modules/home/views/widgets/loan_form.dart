
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan/app/data/field.dart';
import 'package:loan/app/modules/home/controllers/home_controller.dart';
import 'package:loan/app/modules/home/views/widgets/approve_form.dart';
import 'package:loan/app/modules/home/views/widgets/duration_chip.dart';
import 'package:loan/app/util/color.dart';

class LoanForm extends StatefulWidget {
  const LoanForm({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  State<LoanForm> createState() => _LoanFormState();
}

class _LoanFormState extends State<LoanForm> {

  var duration = '1 month'.obs;

  @override
  Widget build(BuildContext context) {
    widget.controller.name.text = widget.controller.profile.firstname + ' '+ widget.controller.profile.lastname;
    widget.controller.phone.text = widget.controller.profile.phone;
    widget.controller.paybackDuration.text = '1';
    return Container(
      height: Get.height/1.2,
      decoration: BoxDecoration(
        color: white, 
        borderRadius: const BorderRadius.vertical(top: Radius.circular(50),),
      ),
      padding: const EdgeInsets.only(left: 30, right: 30, top: 50),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Loan\nApplication',
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                    fontFamily: "QKS",
                    height: .9
                  ),
                )
              ],
            ),
            const SizedBox(height: 30,),
            Field(icon: CupertinoIcons.person, name: 'fullname', textEditingController: widget.controller.name,),
            const SizedBox(height: 10,),
            Field(icon: CupertinoIcons.phone, name: 'phone', textEditingController: widget.controller.phone,),
            const SizedBox(height: 10,),
            Field(icon: CupertinoIcons.home, name: 'home address', textEditingController: widget.controller.address,),
            const SizedBox(height: 10,),
            Row(
              children: [
                Expanded(
                  child: Field(icon: Icons.numbers, name: 'amount', textEditingController: widget.controller.amount,),
                ),
                
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              children: [
                Expanded(
                  child: Field(icon: CupertinoIcons.building_2_fill, name: 'bank name', textEditingController: widget.controller.bankName,),
                ),
                const SizedBox(width: 5,),
                Expanded(
                  child: Field(icon: CupertinoIcons.book, name: 'account no.', textEditingController: widget.controller.acctNo),
                ),
              ],
            ),
            const SizedBox(height: 10,),
            DropdownButton<String>(
              hint: Text('Reason'),
              style: TextStyle(fontFamily: 'QKS'),
              value: widget.controller.reason.text == ''?null: widget.controller.reason.text,
              // icon: const Icon(Icons.keyboard_arrow_down),   
              isExpanded: true,
              items: ['Business', 'Medical', 'House', 'Electricity', 'Gift', 'Others'].map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(
                    items,
                    style: TextStyle(
                      color: black,
                      fontFamily: 'QKS'
                    ),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  widget.controller.reason.text = newValue!;
                });
              },
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Payback duration:',
                  style: TextStyle(
                    fontFamily: 'QKS',
                    color: Colors.grey,
                    // height: .5
                  ),
                ),
                Obx(()=>
                  Text(
                    duration.value,
                    style: TextStyle(
                      fontFamily: 'QKS',
                      color: Colors.grey,
                      // height: .5
                    ),
                  ),
                ),
              ],
            ),

            Container(
              height: 100,
              alignment: Alignment.center,
              child: RotatedBox(
                quarterTurns: 3,
                child: ListWheelScrollView(
                  itemExtent: 100,
                  useMagnifier: true,
                  magnification: 1.2,
                  onSelectedItemChanged: (value){
                    String _value = (value+1).toString();
                    duration.value=_value+" month(s)";
                    widget.controller.paybackDuration.text = _value;
                  },
                  children: [
                    DurationChip(text: 'a month',),
                    DurationChip(text: '2 months',),
                    DurationChip(text: '3 months',),
                    DurationChip(text: '4 months',),
                    DurationChip(text: '5 months',),
                    DurationChip(text: '6 months',),
                    DurationChip(text: '7 months',),
                    DurationChip(text: '8 months',),
                    DurationChip(text: '9 months',),
                    DurationChip(text: '10 months',),
                    DurationChip(text: '11 months',),
                    DurationChip(text: '12 months',),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              width: Get.width,
              child: Obx(()=>
                ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(const StadiumBorder()),
                    backgroundColor: widget.controller.isProcessing.value?
                      MaterialStateProperty.all(black.withOpacity(.5)):MaterialStateProperty.all(black)
                  ),
                  onPressed: widget.controller.isProcessing.value?null:
                  (){
                    widget.controller.verifyInput();
                  }, 
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 22),
                    child: Obx(()=>
                      Text(
                        widget.controller.isProcessing.value?'Processing request...': 'Apply'
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}

