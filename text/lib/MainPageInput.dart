import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text/controller/notification.dart';

import 'controller/data.dart';

import 'package:intl/intl.dart';

class MainPageInput extends StatefulWidget {
  const MainPageInput({super.key});

  @override
  State<MainPageInput> createState() => _MainPageInputState();
}

class _MainPageInputState extends State<MainPageInput> {
  Controller a = Get.put(Controller());
  TextEditingController amount = TextEditingController();
  TextEditingController profit = TextEditingController();
  TextEditingController loss = TextEditingController();

  var x = false.obs;
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();

    amount.text = a.amount.toStringAsFixed(0);
    profit.text = a.profit.toStringAsFixed(0);
    loss.text = a.loss.toStringAsFixed(0);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.all(12),
      width: width / 1.1,
      height: height / 3.2,
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
                    style: TextStyle(color: Colors.white, fontSize: 15),
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
                  child: TextField(
                    style: TextStyle(color: Colors.white, fontSize: 30),
                    controller: amount,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.currency_rupee,
                          color: Colors.yellowAccent,
                        ),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none),
                  ),
                ),
              ),
            ],
          ),
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
                      color: Color.fromARGB(181, 53, 220, 81)),
                  child: Text(
                    "Profit",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  )),
              Container(
                width: 90,
                height: height / 17,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 9),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(133, 0, 0, 0),
                          offset: Offset(2, 2),
                          blurRadius: 6)
                    ],
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromARGB(181, 53, 220, 81)),
                child: SizedBox(
                  child: TextField(
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      controller: profit,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          suffix: Icon(
                            Icons.percent,
                            size: 20,
                            color: Colors.white,
                          ),
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none)),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 5),
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
                      color: Color.fromARGB(181, 53, 220, 81)),
                  child: Obx(
                    //this box is for profit
                    () => Text(
                      "₹ " +
                          NumberFormat.currency(locale: 'en_IN', symbol: '')
                              .format(a.totalProfit.value),
                      style: TextStyle(
                          color: Color.fromARGB(255, 252, 252, 252),
                          fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
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
                      color: Color.fromARGB(181, 234, 122, 52)),
                  child: Text(
                    "Loss",
                    style: TextStyle(color: Colors.white),
                  )),
              Container(
                  width: 90,
                  height: height / 17,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 9),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(133, 0, 0, 0),
                            offset: Offset(2, 2),
                            blurRadius: 6)
                      ],
                      borderRadius: BorderRadius.circular(15),
                      color: Color.fromARGB(181, 234, 122, 52)),
                  child: SizedBox(
                    child: TextField(
                        style: TextStyle(color: Colors.white, fontSize: 20),
                        controller: loss,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            suffix: Icon(
                              Icons.percent,
                              size: 19,
                              color: Colors.white,
                            ),
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none)),
                  )),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 5),
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
                      color: Color.fromARGB(181, 234, 122, 52)),
                  child: Obx(
                    //this box is for loss
                    () => Text(
                      "₹ " +
                          NumberFormat.currency(locale: 'en_IN', symbol: '')
                              .format(a.totalloss.value),
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              print("Done");
              a.amount.value = double.parse(amount.text);
              a.profit.value = double.parse(profit.text);
              a.loss.value = double.parse(loss.text);
              a.day.value = 1;
              a.bonous.value = 0;
              a.total();
              amount.text = a.amount.value.toStringAsFixed(0);
              profit.text = a.profit.value.toStringAsFixed(0);
              loss.text = a.loss.value.toStringAsFixed(0);
              FocusScope.of(context).unfocus();
              notification(a.day.value, a.totalProfit.value, a.totalloss.value,
                  a.amount.value);
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(5, 5),
                        blurRadius: 7,
                        color: Color.fromARGB(146, 0, 0, 0))
                  ],
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromARGB(82, 190, 223, 81)),
              alignment: Alignment.center,
              width: 130,
              height: 55,
              child: Text(
                "Enter Data",
                style: GoogleFonts.asap(
                    color: Color.fromARGB(255, 235, 235, 235), fontSize: 20),
              ),
            ),
          )
        ],
      ),
    );
  }
}
