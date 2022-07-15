
import 'package:flutter/material.dart';
import 'package:loan/app/util/color.dart';

class DurationChip extends StatelessWidget {
  const DurationChip({
    Key? key, required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: primary.withOpacity(.4),
        borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      child: Center(
        child: RotatedBox(
          quarterTurns: 1,
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'QKS',
              fontSize: 16
            ),
          ),
        ),
      ),
    );
  }
}