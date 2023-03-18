// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:text/controller/data.dart';
import 'package:text/plsl.dart';

class MainContent extends StatefulWidget {
  void Function(int iday) x;
  MainContent(this.x);
  @override
  State<MainContent> createState() => MainContentState(x);
}

class MainContentState extends State<MainContent> {
  void Function(int iday) x;
  MainContentState(this.x);
  var inp = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Controller a = Get.put(Controller());
    return Container(
      padding: EdgeInsets.all(12),
      width: width / 1.1,
      height: height / 2.95,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                  margin: EdgeInsets.all(5),
                  alignment: Alignment.center,
                  width: width / 3,
                  height: height / 17,
                  padding: EdgeInsets.symmetric(vertical: 7),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(133, 0, 0, 0),
                            offset: Offset(2, 2),
                            blurRadius: 6)
                      ],
                      borderRadius: BorderRadius.circular(15),
                      color: Color.fromARGB(181, 46, 160, 253)),
                  child: Text(
                    "Starting Amount",
                    style: TextStyle(color: Colors.white),
                  )),
              Expanded(
                child: Container(
                  height: height / 17,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(vertical: 7, horizontal: 9),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(133, 0, 0, 0),
                            offset: Offset(2, 2),
                            blurRadius: 6)
                      ],
                      borderRadius: BorderRadius.circular(15),
                      color: Color.fromARGB(181, 46, 160, 253)),
                  child: Obx(
                    () => Text(
                      "₹ " + (a.amount.value).toStringAsFixed(2),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Obx(
            () => PlSl(Color.fromARGB(181, 53, 220, 81), a.profit.value,
                a.totalProfit.value, "Profit"),
          ),
          Obx(
            () => PlSl(Color.fromARGB(181, 234, 122, 52), a.loss.value,
                a.totalloss.value, "Loss"),
          ),
          Row(
            children: [
              Container(
                  margin: EdgeInsets.all(5),
                  alignment: Alignment.center,
                  width: width / 4,
                  height: height / 17,
                  padding: EdgeInsets.symmetric(vertical: 7),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(133, 0, 0, 0),
                            offset: Offset(2, 2),
                            blurRadius: 6)
                      ],
                      borderRadius: BorderRadius.circular(15),
                      color: Color.fromARGB(181, 46, 160, 253)),
                  child: Text(
                    "Days ",
                    style: TextStyle(color: Colors.white),
                  )),
              Container(
                  height: height / 17,
                  width: width / 4,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(vertical: 7, horizontal: 9),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(133, 0, 0, 0),
                            offset: Offset(2, 2),
                            blurRadius: 6)
                      ],
                      borderRadius: BorderRadius.circular(15),
                      color: Color.fromARGB(181, 46, 160, 253)),
                  child: SizedBox(
                    height: 30,
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      controller: inp,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none),
                    ),
                  )),
              Spacer(),
              GestureDetector(
                onTap: () {
                  a.moneyManagementAmount.value = a.amount.value;
                  a.moneyManagementTotalAfterLoss.value = 0;
                  a.moneyManagementTotalAfterProfit.value = 0;
                  a.moneyManagementTotalLoss.value = 0;
                  a.moneyManagementTotalProfit.value = 0;

                  x(int.parse(inp.text.toString()));
                },
                child: Container(
                  height: height / 17,
                  width: width / 4,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 7, horizontal: 9),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(133, 0, 0, 0),
                            offset: Offset(2, 2),
                            blurRadius: 6)
                      ],
                      borderRadius: BorderRadius.circular(15),
                      color: Color.fromARGB(181, 46, 160, 253)),
                  child: Text(
                    "Ok",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
