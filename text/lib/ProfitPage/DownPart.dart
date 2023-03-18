// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:text/controller/data.dart';

class DownPartProfit extends StatelessWidget {
  Controller a = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    TextEditingController dollor = TextEditingController();
    TextEditingController rupee = TextEditingController();
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.all(12),
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(105, 0, 0, 0),
                    offset: Offset(4, 4),
                    blurRadius: 5)
              ],
              borderRadius: BorderRadius.circular(15),
              color: Color.fromARGB(96, 189, 110, 64)),
          padding: EdgeInsets.all(16),
          child: Text(
            "ENTER AMOUNT OF WITHDRAWAL",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        Row(
          children: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(12),
              height: 60,
              width: width / 2.5,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(105, 0, 0, 0),
                        offset: Offset(4, 4),
                        blurRadius: 5)
                  ],
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromARGB(95, 100, 100, 100)),
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: dollor,
                onChanged: (value) {
                  if (value == '') {
                    rupee.text = '';
                  } else if (double.parse(value) > (a.widrawal.value / 82)) {
                    print("Not Possible");
                    Get.snackbar("Not Possible", "Check Widrawal value");
                  } else {
                    rupee.text = (double.parse(value) * 82).toStringAsFixed(2);
                  }
                },
                keyboardType: TextInputType.number,
                textAlignVertical: TextAlignVertical.bottom,
                decoration: InputDecoration(
                    icon: Icon(Icons.attach_money),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none),
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(12),
                height: 60,
                width: width / 2.5,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(105, 0, 0, 0),
                          offset: Offset(4, 4),
                          blurRadius: 5)
                    ],
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromARGB(95, 100, 100, 100)),
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: rupee,
                  onChanged: (value) {
                    if (value == '') {
                      dollor.text = '';
                    } else {
                      dollor.text =
                          (double.parse(value) / 82).toStringAsFixed(2);
                    }
                  },
                  keyboardType: TextInputType.number,
                  textAlignVertical: TextAlignVertical.bottom,
                  decoration: InputDecoration(
                      icon: Icon(Icons.currency_rupee),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none),
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              child: Obx(
                () => Text(
                  "\$" + (a.bonous.value / 82).toStringAsFixed(2),
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
              alignment: Alignment.center,
              margin: EdgeInsets.all(12),
              height: 100,
              width: width / 2.5,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(105, 0, 0, 0),
                        offset: Offset(4, 4),
                        blurRadius: 5)
                  ],
                  borderRadius: BorderRadius.circular(150),
                  color: Color.fromARGB(95, 251, 141, 141)),
              padding: EdgeInsets.symmetric(horizontal: 16),
            ),
            GestureDetector(
              onTap: () {
                if (dollor.text == '') {
                  rupee.text = '';
                } else if (double.parse(dollor.text) > a.widrawal.value) {
                  print("Not Possible");
                  Get.snackbar("Not Possible", "Check Widrawal value");
                } else {
                  a.bonusCal(double.parse(dollor.text));
                  rupee.text =
                      (double.parse(dollor.text) * 82).toStringAsFixed(2);
                }
              },
              child: Container(
                child: Text(
                  "OK",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                alignment: Alignment.center,
                margin: EdgeInsets.all(12),
                height: 70,
                width: width / 2.5,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Color.fromARGB(255, 63, 128, 65), width: 2),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(105, 0, 0, 0),
                          offset: Offset(4, 4),
                          blurRadius: 5)
                    ],
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromARGB(95, 225, 251, 141)),
                padding: EdgeInsets.symmetric(horizontal: 16),
              ),
            )
          ],
        )
      ],
    );
  }
}
