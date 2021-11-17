import 'package:flutter/material.dart';

class Buttombutton extends StatelessWidget {
  const Buttombutton(this.ontap, this.buttontitle, {Key? key})
      : super(key: key);

  final VoidCallback ontap;
  final String buttontitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        child: Center(
          child: Text(
            buttontitle,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
        color: const Color(0XFFEB1555),
        margin: const EdgeInsets.all(10),
        height: 50,
      ),
    );
  }
}
