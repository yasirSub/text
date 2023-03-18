import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:text/LossSeprator/ButtonsLoss.dart';

import '../controller/data.dart';
import 'EachPartsLoss.dart';

class LossSeprator extends StatefulWidget {
  const LossSeprator({super.key});

  @override
  State<LossSeprator> createState() => _LossSepratorState();
}

class _LossSepratorState extends State<LossSeprator> {
  List<Widget> items = [
    EachPartsLoss("1", true.obs),
    EachPartsLoss("2", true.obs),
    EachPartsLoss("3", true.obs),
    EachPartsLoss("4", true.obs),
    EachPartsLoss("5", true.obs),
    EachPartsLoss("6", true.obs),
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
              "Loss Seprator",
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
                  color: Color.fromARGB(95, 189, 112, 64)),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Obx(
                () => Text(
                  "\$ " + "-" + (a.sepratorLoss.value / 82).toStringAsFixed(2),
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              )),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                  onTap: () {
                    a.partsLoss.value = 6;
                    a.seprateTheLoss(6);
                  },
                  child: ButtonsLoss(70, "6")),
              GestureDetector(
                  onTap: () {
                    a.partsLoss.value = 5;
                    a.seprateTheLoss(5);
                  },
                  child: ButtonsLoss(90, "5")),
              GestureDetector(
                  onTap: () {
                    a.partsLoss.value = 4;
                    a.seprateTheLoss(4);
                  },
                  child: ButtonsLoss(110, "4")),
              GestureDetector(
                  onTap: () {
                    a.partsLoss.value = 3;
                    a.seprateTheLoss(3);
                  },
                  child: ButtonsLoss(130, "3")),
              GestureDetector(
                  onTap: () {
                    a.partsLoss.value = 2;
                    a.seprateTheLoss(2);
                  },
                  child: ButtonsLoss(150, "2")),
            ],
          ),
          Spacer(),
          Obx(() {
            int i = 0;
            return Column(
                children: items.map((e) {
              if (i < a.partsLoss.value) {
                i++;
                return e;
              } else {
                i++;
                return EachPartsLoss(i.toString(), false.obs);
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
                    color: Color.fromARGB(146, 109, 80, 73),
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
