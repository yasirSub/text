// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text/LossSeprator/MainPageLoss.dart';
import 'package:text/ProfitPage/ProfitPage.dart';
import 'package:text/ProfitSaprator/MianPageProfitSep.dart';
import 'package:text/controller/data.dart';
import 'package:text/controller/justforchange.dart';

import 'LossPage/LossPage.dart';
import 'controller/notification.dart';

class ProfitLoss extends StatelessWidget {
  Controller a = Get.put(Controller());
  Data b = Get.put(Data());

  void takeInput(BuildContext context) {
    showDialog(
        context: context,
        builder: (ctx) {
          TextEditingController value = TextEditingController();
          return AlertDialog(
            elevation: 10,
            shadowColor: Color.fromARGB(255, 209, 47, 47),
            backgroundColor: Colors.white,
            content: Container(
              height: 130,
              child: Column(
                children: [
                  Container(
                    child: Obx(
                      () => TextField(
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          if (value.contains("-")) {
                            b.isMinus.value = true;
                          } else {
                            b.isMinus.value = false;
                          }
                        },
                        style: TextStyle(
                            color:
                                (b.isMinus.value) ? Colors.red : Colors.green),
                        controller: value,
                        decoration: InputDecoration(
                            label: Text("Enter amount in \$"),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.deepPurple),
                                borderRadius: BorderRadius.circular(50)),
                            border: OutlineInputBorder()),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (value.text == '') {
                        Get.snackbar(
                          snackStyle: SnackStyle.FLOATING,
                          colorText: Colors.white,
                          duration: Duration(seconds: 2),
                          "Invalid value",
                          "Please enter a valid value",
                        );
                      } else {
                        double enteredValue = double.parse(value.text) * 82;
                        if (enteredValue > a.totalProfit.value) {
                          Navigator.pop(context);
                          a.inputProfit(enteredValue);
                          Get.to(
                            transition: Transition.rightToLeftWithFade,
                            duration: Duration(milliseconds: 300),
                            ProfitPage(),
                          );
                        } else if (value.text.toString().contains("-")) {
                          if (double.parse(
                                  value.text.toString().replaceAll("-", "")) >
                              a.amount.value) {
                            Navigator.pop(context);
                            Get.to(
                              transition: Transition.rightToLeftWithFade,
                              duration: Duration(milliseconds: 300),
                              LossPage(),
                            );
                          } else {
                            Navigator.pop(context);
                            a.amount.value = a.amount.value -
                                double.parse(
                                    value.text.toString().replaceAll("-", ""));
                            a.total();
                            print(a.amount.value);
                            Get.to(
                              transition: Transition.rightToLeftWithFade,
                              duration: Duration(milliseconds: 300),
                              LossPage(),
                            );
                          }
                        } else {
                          Get.snackbar(
                            snackStyle: SnackStyle.FLOATING,
                            colorText: Colors.white,
                            duration: Duration(seconds: 2),
                            "Invalid value",
                            "Please enter a valid value",
                          );
                        }
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(15)),
                      margin: EdgeInsets.only(top: 20),
                      padding: EdgeInsets.all(12),
                      child: Text(
                        "Done",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

//profit function & loss function
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            a.profitTap();
            notification(a.day.value, a.totalProfit.value, a.totalloss.value,
                a.amount.value);
          },
          onLongPress: () {
            showDialog(
                context: context,
                builder: (ctx) {
                  return AlertDialog(
                    surfaceTintColor: Colors.black,
                    shadowColor: Colors.black,
                    elevation: 20,
                    title: Column(children: [
                      Container(
                        child: Text("Do you want Seprate?"),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Cancel")),
                          ElevatedButton(
                              onPressed: () {
                                a.partsProfit.value = 0;
                                a.sepratorProfit.value = a.totalProfit.value;
                                Navigator.pop(context);
                                Get.to(ProfitSeprator());
                              },
                              child: Text("Ok")),
                        ],
                      )
                    ]),
                  );
                });
          },
          child: Container(
            width: width / 3,
            height: 60,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  offset: Offset(4, 4),
                  color: Color.fromARGB(132, 74, 168, 19),
                  blurRadius: 10,
                ),
              ],
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                  color: Color.fromARGB(255, 53, 235, 59).withOpacity(0.8),
                  width: 1),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromRGBO(62, 218, 72, 0.795),
                  Color.fromRGBO(46, 160, 54, 0.034),
                ],
              ),
            ),
            child: GlowingOverscrollIndicator(
              axisDirection: AxisDirection.down,
              color: Colors.white,
              child: FittedBox(
                fit: BoxFit.scaleDown, // adjust the fit property
                child: Obx(
                  () => Text(
                    "\$ " + (a.totalProfit.value / 82).toStringAsFixed(1),
                    style: TextStyle(
                      fontSize: 28,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w100,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 20,
                          color: Colors.white,
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),

        //icon start for EXPL

        GestureDetector(
          onLongPress: () {
            takeInput(context);
          },
          child: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                  blurRadius: 20,
                  spreadRadius: -7,
                ),
              ],
              borderRadius: BorderRadius.circular(35),
            ),
            child: ShaderMask(
              shaderCallback: (bounds) {
                return LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(255, 248, 19, 3),
                    Color.fromARGB(255, 16, 247, 24)
                  ],
                ).createShader(bounds);
              },
              child: GlowingOverscrollIndicator(
                axisDirection: AxisDirection.down,
                color: Colors.white,
                child: Icon(
                  IconData(0xf40a, fontFamily: 'MaterialIcons'),
                  size: 54,
                  // color: Color.fromARGB(255, 235, 32, 32),
                ),
              ),
            ),
          ),
        ),

        //end here the icon
        GestureDetector(
          onTap: () {
            a.lossTap();
            notification(a.day.value, a.totalProfit.value, a.totalloss.value,
                a.amount.value);
          },
          onLongPress: () {
            showDialog(
              context: context,
              builder: (ctx) {
                return AlertDialog(
                  surfaceTintColor: Colors.black,
                  shadowColor: Colors.black,
                  elevation: 20,
                  title: Column(children: [
                    Container(
                      child: Text("Do you want seprate?"),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Cancel")),
                        ElevatedButton(
                            onPressed: () {
                              a.partsLoss.value = 0;
                              a.sepratorLoss.value = a.totalloss.value;
                              Navigator.pop(context);
                              Get.to(LossSeprator());
                            },
                            child: Text("Ok")),
                      ],
                    )
                  ]),
                );
              },
            );
          },
          child: Container(
            width: width / 3,
            height: 60,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  offset: Offset(4, 4),
                  color: Color.fromARGB(132, 168, 36, 19),
                  blurRadius: 10,
                ),
              ],
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                  color: Color.fromARGB(3, 255, 6, 6).withOpacity(0.8),
                  width: 1),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromRGBO(218, 67, 62, 0.74),
                  Color.fromRGBO(8, 11, 19, 0.192),
                ],
              ),
            ),
            child: GlowingOverscrollIndicator(
              axisDirection: AxisDirection.down,
              color: Colors.white,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Obx(
                  () => Text(
                    "\$ " + (a.totalloss.value / 82).toStringAsFixed(1),
                    style: TextStyle(
                      fontSize: 28,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w100,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 20,
                          color: Colors.white,
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
// //double.parse(
//                                 double.parse(value.text).toStringAsFixed(0)) <
//                             double.parse(
//                                 a.totalloss.value.toStringAsFixed(0))
