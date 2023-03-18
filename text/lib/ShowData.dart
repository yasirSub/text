// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:text/controller/data.dart';

class ShowAfterData extends StatelessWidget {
  Controller a = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.symmetric(horizontal: 6),
                width: width / 2.5,
                height: 60,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(5, 5),
                          blurRadius: 5,
                          color: Color.fromARGB(147, 0, 0, 0))
                    ],
                    color: Color.fromARGB(189, 158, 158, 158),
                    borderRadius: BorderRadius.circular(15)),
                child: Text(
                  "Total Amount",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.symmetric(horizontal: 15),
                width: width / 2.5,
                height: 60,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(5, 5),
                          blurRadius: 5,
                          color: Color.fromARGB(147, 0, 0, 0))
                    ],
                    color: Color.fromARGB(189, 158, 158, 158),
                    borderRadius: BorderRadius.circular(15)),
                child: FittedBox(
                  child: Obx(
                    () => Text(
                      "₹ " +
                          (a.afterProfit.value)
                              .toStringAsFixed(2)
                              .replaceAllMapped(
                                RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                (match) => '${match[1]},',
                              ),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.symmetric(horizontal: 6),
                width: width / 2.5,
                height: 50,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(5, 5),
                          blurRadius: 5,
                          color: Color.fromARGB(147, 0, 0, 0))
                    ],
                    color: Color.fromARGB(145, 196, 248, 118),
                    borderRadius: BorderRadius.circular(15)),
                child: Text(
                  "Today + Bonus",
                  style: TextStyle(
                      color: Color.fromARGB(255, 1, 1, 1),
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.symmetric(horizontal: 15),
                width: width / 2.5,
                height: 50,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(5, 5),
                          blurRadius: 5,
                          color: Color.fromARGB(147, 0, 0, 0))
                    ],
                    color: Color.fromARGB(145, 196, 248, 118),
                    borderRadius: BorderRadius.circular(15)),
                child: FittedBox(
                    child: Obx(
                  () => Text(
                    "\$ " +
                        ((a.afterProfit.value + a.bonous.value) / 82)
                            .toStringAsFixed(2),
                    style: TextStyle(
                        color: Color.fromARGB(255, 10, 10, 10),
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
