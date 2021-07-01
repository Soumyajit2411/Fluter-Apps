
import 'package:flutter/material.dart';
import '../constants.dart';
class Buttombutton extends StatelessWidget {
  Buttombutton(this.ontap, this.buttontitle);

  final Function ontap;
  final String buttontitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        child: Center(
          child: Text(
            buttontitle,
            style: klargebuttonstyle,
          ),
        ),
        color: kbottomcontainercolor,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.only(bottom: 20),
        width: double.infinity,
        height: kbottomcontainerheight,
      ),
    );
  }
}
