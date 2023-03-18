import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:text/MainContent.dart';
import 'package:text/ProfitOrLoss.dart';
import 'package:text/ShowData.dart';
import 'package:text/controller/data.dart';
import 'package:text/main.dart';

import 'NextDay.dart';

import 'package:text/day.dart';

class TradingPage extends StatefulWidget {
  const TradingPage({super.key});

  @override
  State<TradingPage> createState() => _TradingPageState();
}

class _TradingPageState extends State<TradingPage> {
  Controller a = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DrawerPage()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          MainContent(),
          ProfitLoss(),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // ShowAfterData(),
                // NextDay(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
