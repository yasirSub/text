// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ButtonsLoss extends StatelessWidget {
  double height;
  String val;
  ButtonsLoss(this.height, this.val);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      alignment: Alignment.center,
      height: height,
      width: width / 6.8,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(105, 0, 0, 0),
                offset: Offset(4, 4),
                blurRadius: 5)
          ],
          borderRadius: BorderRadius.circular(15),
          color: Color.fromARGB(124, 237, 97, 54)),
      padding: EdgeInsets.all(16),
      child: Text(
        val,
        style: TextStyle(color: Colors.white, fontSize: 30),
      ),
    );
  }
}
