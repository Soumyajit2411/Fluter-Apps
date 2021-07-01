
import 'package:flutter/material.dart';

class Roundiconbuttton extends StatelessWidget {
  Roundiconbuttton(this.icon, this.onPressed);

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      elevation: 6,
      disabledElevation: 6,
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      shape: CircleBorder(),
      fillColor: Color(0XFF4C4F5E),
    );
  }
}
