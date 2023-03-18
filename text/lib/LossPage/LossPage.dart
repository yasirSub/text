import 'package:flutter/material.dart';

class LossPage extends StatefulWidget {
  const LossPage({super.key});

  @override
  State<LossPage> createState() => _LossPageState();
}

class _LossPageState extends State<LossPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
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
            margin: EdgeInsets.only(left: 10, right: 10),
            child: Text(
              "Next Day Plan",
              style: TextStyle(color: Colors.white, fontSize: 25),
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
                "Its ok you will recover...",
                style: TextStyle(color: Colors.white, fontSize: 20),
              )),
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
                "Don't try to recover now",
                style: TextStyle(color: Colors.white, fontSize: 20),
              )),
          Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: Text(
                "OK",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              alignment: Alignment.center,
              margin: EdgeInsets.all(12),
              height: 70,
              width: 100,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Color.fromARGB(82, 100, 187, 103), width: 2),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(105, 0, 0, 0),
                        offset: Offset(4, 4),
                        blurRadius: 5)
                  ],
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromARGB(95, 225, 251, 141)),
              padding: EdgeInsets.symmetric(horizontal: 16),
            ),
          ),
        ],
      ),
    );
  }
}
