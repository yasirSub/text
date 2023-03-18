import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class OneMinute extends StatelessWidget {
  const OneMinute({super.key});

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
            margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
            child: Text(
              "Strategies",
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
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
                "1 minute Strategy",
                style: TextStyle(color: Colors.white, fontSize: 20),
              )),
          Expanded(
              child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Container(
                  margin: EdgeInsets.all(10),
                  height: 45,
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
                    "Moving Average",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "•",
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      "EMA",
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      "6",
                      style:
                          TextStyle(fontSize: 25, backgroundColor: Colors.red),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "•",
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      "EMA",
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      "14",
                      style: TextStyle(
                          fontSize: 25, backgroundColor: Colors.green),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "•",
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      "EMA",
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      "60",
                      style:
                          TextStyle(fontSize: 25, backgroundColor: Colors.cyan),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "•",
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      "EMA",
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      "200",
                      style: TextStyle(
                          fontSize: 25, backgroundColor: Colors.amber),
                    ),
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.all(10),
                  height: 45,
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
                    "Bollinger Band",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "•",
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      "Period",
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      "42",
                      style: TextStyle(
                          fontSize: 25,
                          backgroundColor: Color.fromARGB(255, 255, 255, 255)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "•",
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      "Deviation",
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      "2",
                      style: TextStyle(
                          fontSize: 25,
                          backgroundColor: Color.fromARGB(255, 255, 255, 255)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "•",
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      "Top",
                      style: TextStyle(
                          fontSize: 25, backgroundColor: Colors.green),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "•",
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      "Middle & Bottom",
                      style: TextStyle(
                          fontSize: 25, backgroundColor: Colors.purple),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "•",
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      "Background",
                      style: TextStyle(
                          fontSize: 25, backgroundColor: Colors.amber),
                    ),
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.all(10),
                  height: 45,
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
                    "Stochastic Oscillator",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "•",
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      "% k Period 16",
                      style: TextStyle(
                          fontSize: 25, backgroundColor: Colors.green),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "•",
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      "% D Period 3",
                      style:
                          TextStyle(fontSize: 25, backgroundColor: Colors.red),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "•",
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      "Smoothing Period 3",
                      style: TextStyle(
                          fontSize: 25,
                          backgroundColor: Color.fromARGB(255, 255, 254, 254)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "•",
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      "Overbought Level 87",
                      style:
                          TextStyle(fontSize: 25, backgroundColor: Colors.red),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "•",
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      "Oversold Level 15",
                      style: TextStyle(
                          fontSize: 25, backgroundColor: Colors.green),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "•",
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      "Moving Average EMA",
                      style: TextStyle(
                          fontSize: 25,
                          backgroundColor: Color.fromARGB(255, 255, 255, 255)),
                    ),
                  ],
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
