import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:text/ProfitSaprator/Buttons.dart';
import 'package:text/ProfitSaprator/parts.dart';
import 'package:text/controller/data.dart';

class ProfitSeprator extends StatefulWidget {
  @override
  State<ProfitSeprator> createState() => _ProfitSepratorState();
}

class _ProfitSepratorState extends State<ProfitSeprator> {
  List<Widget> items = [
    EachParts("1", true.obs),
    EachParts("2", true.obs),
    EachParts("3", true.obs),
    EachParts("4", true.obs),
    EachParts("5", true.obs),
    EachParts("6", true.obs),
  ];
  Controller a = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Color.fromARGB(105, 0, 0, 0),
                      offset: Offset(4, 4),
                      blurRadius: 5)
                ],
                borderRadius: BorderRadius.circular(15),
                color: Color.fromARGB(96, 64, 127, 189)),
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(left: 10, right: 10),
            child: Text(
              "Profit Seprator",
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
          Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(105, 0, 0, 0),
                        offset: Offset(4, 4),
                        blurRadius: 5)
                  ],
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromARGB(95, 83, 189, 64)),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Obx(
                () => Text(
                  "\$ " + (a.sepratorProfit.value / 82).toStringAsFixed(2),
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              )),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                  onTap: () {
                    a.partsProfit.value = 6;
                    a.seprateTheProfit(6);
                  },
                  child: Buttons(70, "6")),
              GestureDetector(
                  onTap: () {
                    a.partsProfit.value = 5;
                    a.seprateTheProfit(5);
                  },
                  child: Buttons(90, "5")),
              GestureDetector(
                  onTap: () {
                    a.partsProfit.value = 4;
                    a.seprateTheProfit(4);
                  },
                  child: Buttons(110, "4")),
              GestureDetector(
                  onTap: () {
                    a.partsProfit.value = 3;
                    a.seprateTheProfit(3);
                  },
                  child: Buttons(130, "3")),
              GestureDetector(
                  onTap: () {
                    a.partsProfit.value = 2;
                    a.seprateTheProfit(2);
                  },
                  child: Buttons(150, "2")),
            ],
          ),
          Spacer(),
          Obx(() {
            int i = 0;
            return Column(
                children: items.map((e) {
              if (i < a.partsProfit.value) {
                i++;
                return e;
              } else {
                i++;
                return EachParts(i.toString(), false.obs);
              }
            }).toList());
          }),
          Spacer(),
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                    color: Color.fromARGB(146, 76, 109, 73),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                        color: Color.fromARGB(255, 44, 44, 44), width: 2)),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 9),
                child: Text(
                  "Ok",
                  style: TextStyle(
                      color: Color.fromARGB(255, 253, 253, 253), fontSize: 20),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
