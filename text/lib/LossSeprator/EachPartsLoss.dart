// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controller/data.dart';

class EachPartsLoss extends StatelessWidget {
  Controller a = Get.put(Controller());
  String index;
  EachPartsLoss(this.index, this.showCheckBox);
  RxBool x = false.obs;
  RxBool showCheckBox = true.obs;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(() {
            if (showCheckBox.value == true) {
              return Container(
                margin: EdgeInsets.only(right: 15),
                alignment: Alignment.center,
                height: 40,
                width: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.blue),
                child: Text(
                  index,
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              );
            } else {
              return Container(
                margin: EdgeInsets.only(right: 15),
                alignment: Alignment.center,
                height: 40,
                width: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromARGB(255, 105, 105, 105)),
                child: Text(
                  index,
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              );
            }
          }),
          Obx(() {
            if (showCheckBox.value == true) {
              if (x.value == false) {
                return Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: 170,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                          color: Color.fromARGB(255, 245, 94, 94), width: 2)),
                  child: Text(
                    "\$" + (a.seperatedLoss.value / 82).toStringAsFixed(2),
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0), fontSize: 30),
                  ),
                );
              } else {
                return Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: 170,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(146, 175, 76, 76),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                          color: Color.fromARGB(255, 175, 76, 76), width: 2)),
                  child: Text(
                    "\$" + (a.seperatedLoss.value / 82).toStringAsFixed(2),
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0), fontSize: 30),
                  ),
                );
              }
            } else {
              return Container(
                alignment: Alignment.center,
                height: 40,
                width: 170,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                        color: Color.fromARGB(255, 62, 62, 62), width: 2)),
                child: Text(
                  "--",
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0), fontSize: 30),
                ),
              );
            }
          }),
          Obx(() {
            if (showCheckBox.value == true) {
              return Obx(() => Checkbox(
                  fillColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 245, 94, 94)),
                  splashRadius: 10,
                  value: x.value,
                  onChanged: (val) {
                    if (x.value != true) {
                      a.minusSepratedLoss(a.seperatedLoss.value.toPrecision(2));
                    } else {
                      a.addSepratedLoss(a.seperatedLoss.value.toPrecision(2));
                    }
                    x.value = val ?? false;
                  }));
            } else {
              return Checkbox(
                  fillColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 65, 65, 65)),
                  splashRadius: 10,
                  value: false,
                  onChanged: (val) {});
            }
          })
        ],
      ),
    );
  }
}
