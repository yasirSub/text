import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:text/controller/data.dart';

import 'EachItemMoneyManagement.dart';
import 'MoneyManagementData.dart';
import 'TopMoneyManagement.dart';

class MoneyManagementMain extends StatefulWidget {
  @override
  State<MoneyManagementMain> createState() => _MoneyManagementMainState();
}

class _MoneyManagementMainState extends State<MoneyManagementMain> {
  var tap = false.obs;
  Controller a = Get.put(Controller());
  List data = [];
  void populateData(int days) {
    data.clear();
    for (int i = 0; i < days; i++) {
      a.moneyManagement();
      data.add({
        "deposit": a.moneyManagementAmount.value,
        "profit": a.moneyManagementTotalAfterProfit.value,
        "DailyProfit": a.moneyManagementTotalProfit.value,
        "DailyLoss": a.moneyManagementTotalLoss.value
      });
    }
    if (tap.value == false) {
      tap.value = true;
    } else {
      tap.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(31, 138, 93, 93),
      appBar: AppBar(),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Container(width: double.infinity, child: MainContent(populateData)),
        TopMoneyManagement(),
        Expanded(child: Obx(() {
          if (tap.value) {
            return ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: data.length,
                itemBuilder: ((context, index) {
                  return EachItemMoneyManagement(
                      index + 1,
                      data[index]["deposit"].toStringAsFixed(0),
                      data[index]["profit"].toStringAsFixed(0),
                      data[index]["DailyLoss"].toStringAsFixed(0),
                      data[index]["DailyProfit"].toStringAsFixed(0));
                }));
          } else {
            return ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: data.length,
                itemBuilder: ((context, index) {
                  return EachItemMoneyManagement(
                      index + 1,
                      data[index]["deposit"].toStringAsFixed(0),
                      data[index]["profit"].toStringAsFixed(0),
                      data[index]["DailyLoss"].toStringAsFixed(0),
                      data[index]["DailyProfit"].toStringAsFixed(0));
                }));
          }
        })),
      ]),
    );
  }
}
