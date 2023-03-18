import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart'; // Import intl package for currency formatting
import 'package:text/controller/data.dart';
// import 'package:text/plsl.dart';
import 'package:text/day.dart';

class MainContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Controller a = Get.put(Controller());
    return Container(
      padding: EdgeInsets.all(12),
      width: width / 1.1,
      height: height / 2.9,
      child: Column(
        children: [
          Container(
            child: Expanded(
              child: Container(
                //HERE START BOX
                margin: EdgeInsets.all(5),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(43, 0, 0, 0),
                        offset: Offset(2, 2),
                        blurRadius: 6)
                  ],
                  borderRadius: BorderRadius.circular(15),
                  // border: Border.all(
                  //     color: Color.fromARGB(144, 57, 73, 218).withOpacity(0.8),
                  //     width: 2),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(197, 71, 105, 133),
                      Color.fromARGB(95, 5, 19, 41),
                    ],
                  ),
                ),
                // HERE END
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    day(),
                                  ],
                                ),
                                // Row(
                                //   children: [Text("yasir")],
                                // )
                              ],
                            ),
                          ),
                        ),
                        // add more stack children here
                      ],
                    ),
                    Text(
                      "Today's Amount",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w100,
                        fontStyle: FontStyle.italic,
                        fontSize: 16,
                        shadows: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.7),
                            offset: Offset(0, 0),
                            blurRadius: 10,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 6),
                    Obx(
                      () => Text(
                        NumberFormat.currency(
                          locale: 'en_IN',
                          symbol: '₹',
                          decimalDigits: 2,
                        ).format(a.amount.value),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w100,
                          fontSize: 33,
                          shadows: [
                            Shadow(
                              color: Colors.black.withOpacity(0.5),
                              offset: Offset(2, 2),
                              blurRadius: 3,
                            ),
                          ],
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                    SizedBox(height: 66),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 30.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Obx(
                                  () => Column(
                                    children: [
                                      Text(
                                        '${a.profit.value.toStringAsFixed(0)} %',
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 235, 226, 226),
                                          fontWeight: FontWeight
                                              .w100, // Use a thinner font weight
                                          fontSize: 30,
                                          shadows: [
                                            Shadow(
                                              color: Colors.white.withOpacity(
                                                  0.5), // Use a white color for the shadow
                                              blurRadius:
                                                  10, // Set the blur radius to create a glowing effect
                                            )
                                          ],
                                        ),
                                      ),

                                      SizedBox(
                                          height:
                                              20), // Add some space between the two Text widgets
                                      Text(
                                        NumberFormat.currency(
                                          locale: 'en_IN',
                                          symbol: '₹',
                                          decimalDigits: 2,
                                        ).format(a.totalProfit.value),
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 1, 230, 1),
                                          fontWeight: FontWeight.w200,
                                          fontSize: 20,
                                          shadows: [
                                            Shadow(
                                              color: Colors.greenAccent
                                                  .withOpacity(0.5),
                                              offset: Offset(2, 2),
                                              blurRadius: 5,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(right: 30.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '${a.loss.value.toStringAsFixed(0)} %', // Add a space character between % and the value
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 235, 226, 226),
                                    fontWeight: FontWeight.w100,
                                    fontSize: 30,
                                    shadows: [
                                      Shadow(
                                        color: Colors.white.withOpacity(0.5),
                                        blurRadius: 10,
                                      )
                                    ],
                                  ),
                                ),

                                SizedBox(
                                    height:
                                        20), // Add some space between the two Text widgets
                                Obx(
                                  () => Text(
                                    NumberFormat.currency(
                                      locale: 'en_IN',
                                      symbol: '₹',
                                      decimalDigits: 2,
                                    ).format(a.totalloss.value),
                                    style: TextStyle(
                                      color: Color.fromARGB(230, 248, 42, 6),
                                      fontWeight: FontWeight.w200,
                                      fontSize: 20,
                                      shadows: [
                                        Shadow(
                                          color: Color.fromARGB(255, 252, 25, 9)
                                              .withOpacity(0.5),
                                          offset: Offset(2, 2),
                                          blurRadius: 5,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
