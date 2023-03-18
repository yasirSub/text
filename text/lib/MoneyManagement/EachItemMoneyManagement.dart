// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class EachItemMoneyManagement extends StatelessWidget {
  int days;
  String deposit, profit, dailyProfit, dailyLoss;

  EachItemMoneyManagement(
      this.days, this.deposit, this.profit, this.dailyLoss, this.dailyProfit);

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
            child: Text(days.toString(),
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
              child: Text("₹" + (double.parse(deposit)).toStringAsFixed(0),
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w900)),
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
              child: Text("₹" + (double.parse(profit)).toStringAsFixed(0),
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w900)),
            ),
          ),
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 107, 139, 96),
                    borderRadius: BorderRadius.circular(15)),
                width: width / 9,
                height: 50,
                child: FittedBox(
                  child: Text(
                      "\$" +
                          (double.parse(dailyProfit) / 82).toStringAsFixed(1),
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w900)),
                ),
              ),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 102, 139, 96),
                    borderRadius: BorderRadius.circular(15)),
                width: width / 7,
                height: 50,
                child: FittedBox(
                  child: Text(
                      "₹" + (double.parse(dailyProfit)).toStringAsFixed(0),
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w900)),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 209, 76, 76),
                    borderRadius: BorderRadius.circular(15)),
                width: width / 9,
                height: 50,
                child: FittedBox(
                  child: Text(
                      "\$" + (double.parse(dailyLoss) / 82).toStringAsFixed(1),
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w900)),
                ),
              ),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 209, 76, 76),
                    borderRadius: BorderRadius.circular(15)),
                width: width / 7,
                height: 50,
                child: FittedBox(
                  child: Text(
                      "₹" + (double.parse(dailyLoss)).toStringAsFixed(0),
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w900)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
