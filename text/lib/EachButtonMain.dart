// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class EachButtonMain extends StatelessWidget {
  String title;
  EachButtonMain(this.title);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                offset: Offset(5, 5),
                blurRadius: 7,
                color: Color.fromARGB(146, 0, 0, 0))
          ],
          borderRadius: BorderRadius.circular(15),
          color: Color.fromARGB(82, 96, 145, 82)),
      alignment: Alignment.center,
      width: 300,
      height: 55,
      child: Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Color.fromARGB(255, 224, 184, 184),
            fontSize: 20),
      ),
    );
  }
}
