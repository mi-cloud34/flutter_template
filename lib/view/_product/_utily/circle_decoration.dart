import 'package:flutter/material.dart';
// ignore: must_be_immutable
class CircleDecoration extends StatelessWidget {
   CircleDecoration({Key? key, this.color, this.radius,}) : super(key: key);
 final Color? color;
final double? radius;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
          color:color,
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(radius!))),
     
    );
  }
}