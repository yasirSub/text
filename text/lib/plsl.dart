// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PlSl extends StatelessWidget {
  Color color;
  double percent;
  double value;
  String title;
  PlSl(this.color, this.percent, this.value, this.title);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final currencyFormatter =
        NumberFormat.currency(locale: 'en_IN', symbol: '₹', decimalDigits: 1);
    return Row(
      children: [
        Container(
            margin: EdgeInsets.all(5),
            alignment: Alignment.center,
            width: width / 3,
            height: height / 17,
            padding: EdgeInsets.symmetric(vertical: 7),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Color.fromARGB(133, 0, 0, 0),
                  offset: Offset(2, 2),
                  blurRadius: 6)
            ], borderRadius: BorderRadius.circular(15), color: color),
            child: Text(
              title,
              style: TextStyle(color: Colors.white),
            )),
        Container(
          width: 70,
          height: height / 17,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(vertical: 7, horizontal: 9),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Color.fromARGB(133, 0, 0, 0),
                offset: Offset(2, 2),
                blurRadius: 6)
          ], borderRadius: BorderRadius.circular(15), color: color),
          child: Text(
            percent.toStringAsFixed(0) + "%",
            style: TextStyle(color: Colors.white, fontSize: 19),
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 5),
            height: height / 17,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(vertical: 7, horizontal: 9),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Color.fromARGB(133, 0, 0, 0),
                  offset: Offset(2, 2),
                  blurRadius: 6)
            ], borderRadius: BorderRadius.circular(15), color: color),
            child: Text(
              currencyFormatter.format(value),
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }
}
