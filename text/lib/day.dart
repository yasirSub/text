import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text/MainContent.dart';
import 'package:text/ProfitOrLoss.dart';
import 'package:text/ShowData.dart';
import 'package:text/controller/data.dart';

class day extends StatelessWidget {
  const day({super.key});
  @override
  Widget build(BuildContext context) {
    Controller a = Get.put(Controller());
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: 150,
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30, // smaller height for Day text
            child: Text(
              "Day",
              style: GoogleFonts.roboto(
                fontSize: 12,
                fontWeight: FontWeight.w100,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.topLeft,
              child: Obx(
                () {
                  return Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: a.doneLoss == false
                              ? Color(0xFF8BFF89).withOpacity(0.1)
                              : Color(0xFFFF5353).withOpacity(0.1),
                          blurRadius: 20,
                          spreadRadius: 5,
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                    child: AnimatedFlipCounter(
                      textStyle: GoogleFonts.roboto(
                        fontSize: 30,
                        fontWeight: FontWeight.w100,
                        color: a.doneLoss == false
                            ? Color(0xFF8BFF89)
                            : Color(0xFFFF5353),
                      ),
                      duration: Duration(milliseconds: 500),
                      value: a.day.value,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
