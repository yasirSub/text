import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:text/Strategies/1Minute.dart';
import 'package:text/Strategies/2Minute.dart';

class Strategies extends StatefulWidget {
  const Strategies({super.key});

  @override
  State<Strategies> createState() => _StrategiesState();
}

class _StrategiesState extends State<Strategies> {
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
                color: Color.fromARGB(95, 25, 26, 27)),
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
            child: Text(
              "Strategies",
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.to(() => OneMinute());
            },
            child: Container(
                margin: EdgeInsets.all(10),
                height: 45,
                width: 200,
                alignment: Alignment.center,
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
                  "1 minute Strategy",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
          ),
          GestureDetector(
            onTap: () {
              Get.to(() => twoMinute());
            },
            child: Container(
                margin: EdgeInsets.all(10),
                height: 45,
                width: 200,
                alignment: Alignment.center,
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
                  "2 minute Strategy",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
          ),
          Container(
              margin: EdgeInsets.all(10),
              height: 45,
              width: 200,
              alignment: Alignment.center,
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
                "3 minute Strategy",
                style: TextStyle(color: Colors.white, fontSize: 20),
              )),
        ],
      ),
    );
  }
}
