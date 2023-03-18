import 'package:flutter/material.dart';

class TopMoneyManagement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Color.fromARGB(184, 7, 114, 255),
                borderRadius: BorderRadius.circular(15)),
            width: width / 12,
            height: 50,
            child: Text("Days",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w900)),
          ),
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.brown, borderRadius: BorderRadius.circular(15)),
            width: width / 6,
            height: 50,
            child: FittedBox(
              child: Text("Deposit",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500)),
            ),
          ),
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(15)),
            width: width / 6,
            height: 50,
            child: FittedBox(
              child: Text("Profit",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w900)),
            ),
          ),
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 107, 139, 96),
                borderRadius: BorderRadius.circular(15)),
            width: width / 9 + width / 7,
            height: 50,
            child: FittedBox(
              child: Text("Daily profit",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w900)),
            ),
          ),
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 209, 76, 76),
                borderRadius: BorderRadius.circular(15)),
            width: width / 9 + width / 7,
            height: 50,
            child: FittedBox(
              child: Text("Daily Loss",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w900)),
            ),
          ),
        ],
      ),
    );
  }
}
