// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:text/controller/data.dart';

class MiddleProfitPage extends StatelessWidget {
  Controller a = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(105, 0, 0, 0),
                          offset: Offset(3, 3),
                          blurRadius: 5)
                    ],
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromARGB(159, 33, 149, 243)),
                child: Text(
                  "Take withdrawal",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Expanded(
                child: Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(105, 0, 0, 0),
                              offset: Offset(4, 4),
                              blurRadius: 5)
                        ],
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromARGB(97, 124, 189, 64)),
                    padding: EdgeInsets.all(16),
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: Obx(
                      () => Text(
                        "\$" + (a.widrawal.value / 82).toStringAsFixed(2),
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    )),
              ),
            ],
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(12),
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Color.fromARGB(105, 192, 41, 41),
                      offset: Offset(4, 4),
                      blurRadius: 5)
                ],
                borderRadius: BorderRadius.circular(15),
                color: Color.fromARGB(97, 124, 189, 64)),
            padding: EdgeInsets.all(16),
            child: Obx(() => Text(
                  "₹ " + (a.widrawal).toStringAsFixed(2),
                  style: TextStyle(color: Colors.white, fontSize: 25),
                )),
          )
        ],
      ),
    );
  }
}
