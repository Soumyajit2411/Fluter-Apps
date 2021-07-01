import 'package:flutter/material.dart';
// ignore: must_be_immutable
class ReusableCard extends StatelessWidget {
  ReusableCard(this.onPress,this.color, this.cardChild);

  final Color color;
  final Widget cardChild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
