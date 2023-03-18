import 'package:flutter/material.dart';

import 'package:text/ProfitPage/DownPart.dart';
import 'package:text/ProfitPage/middleProfitPage.dart';

class ProfitPage extends StatefulWidget {
  const ProfitPage({super.key});

  @override
  State<ProfitPage> createState() => _ProfitPageState();
}

class _ProfitPageState extends State<ProfitPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 12),
            padding: EdgeInsets.all(7),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      offset: Offset(3, 3),
                      blurRadius: 6,
                      color: Color.fromARGB(103, 0, 0, 0))
                ],
                borderRadius: BorderRadius.circular(15),
                color: Color.fromARGB(137, 94, 161, 176)),
            alignment: Alignment.center,
            child: Text(
              "Daily Withdrawal",
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
          ),
          MiddleProfitPage(),
          Spacer(),
          DownPartProfit(),
          Spacer()
        ],
      ),
    );
  }
}
