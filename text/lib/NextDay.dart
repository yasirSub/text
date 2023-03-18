import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:text/controller/data.dart';

class NextDay extends StatefulWidget {
  const NextDay({super.key});

  @override
  State<NextDay> createState() => _NextDayState();
}

class _NextDayState extends State<NextDay> {
  Controller a = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      alignment: Alignment.topLeft,
      height: 166,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 40),
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(12),
            width: 160,
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.horizontal(
                    end: Radius.elliptical(150, 50)),
                color: Color.fromARGB(210, 122, 144, 255)),
            child: Text(
              "Next Day...",
              style: GoogleFonts.nunito(
                  fontSize: 25, color: Color.fromARGB(255, 0, 0, 0)),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  margin: EdgeInsets.all(10),
                  width: width / 3,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(4, 4),
                            color: Color.fromARGB(142, 0, 0, 0),
                            blurRadius: 7)
                      ],
                      border: Border.all(color: Colors.green, width: 2),
                      borderRadius: BorderRadius.circular(15),
                      color: Color.fromARGB(78, 109, 243, 65)),
                  padding: EdgeInsets.all(width / 35),
                  child: FittedBox(
                    child: Obx(
                      () => Text(
                        "\$ " + (a.nextProfit.value / 82).toStringAsFixed(1),
                        style: GoogleFonts.merriweather(
                            fontSize: 23, color: Colors.white),
                      ),
                    ),
                  )),
              Container(
                  width: width / 3,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(4, 4),
                            color: Color.fromARGB(142, 0, 0, 0),
                            blurRadius: 7)
                      ],
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                          color: Color.fromARGB(255, 230, 98, 88), width: 2),
                      color: Color.fromARGB(78, 243, 89, 65)),
                  padding: EdgeInsets.all(width / 35),
                  child: FittedBox(
                    child: Obx(
                      () => Text(
                        "\$ " + (a.nextLoss.value / 82).toStringAsFixed(1),
                        style: GoogleFonts.merriweather(
                            fontSize: 23, color: Colors.white),
                      ),
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
