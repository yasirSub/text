import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:text/EachButtonMain.dart';
import 'package:text/controller/data.dart';

import '../LoginPage/MianPage.dart';

class ResetPage extends StatefulWidget {
  const ResetPage({super.key});

  @override
  State<ResetPage> createState() => _ResetPageState();
}

class _ResetPageState extends State<ResetPage> {
  Controller a = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: GestureDetector(
                  onTap: () {
                    a.resetValue();
                  },
                  child: EachButtonMain("Reset all"))),
          Center(
              child: GestureDetector(
                  onTap: () {
                    FirebaseAuth.instance.signOut().then((value) {
                      a.resetValue();
                      a.storeData();
                      GetStorage("Datas").write("login", false);
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => LoginPage()),
                          ModalRoute.withName('/'));
                    });
                  },
                  child: EachButtonMain("Log Out")))
        ],
      ),
    );
  }
}
