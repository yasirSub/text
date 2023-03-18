// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart'; // Import intl package for currency formatting
// import 'package:text/controller/data.dart';
// import 'package:text/plsl.dart';

// class MainContent extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//     Controller a = Get.put(Controller());
//     return Container(
//       padding: EdgeInsets.all(12),
//       width: width / 1.1,
//       height: height / 3.8,
//       child: Column(
//         children: [
//           Row(
//             children: [
//               Container(
//                   margin: EdgeInsets.all(5),
//                   alignment: Alignment.center,
//                   width: width / 3,
//                   height: height / 17,
//                   padding: EdgeInsets.symmetric(vertical: 7),
//                   decoration: BoxDecoration(
//                       boxShadow: [
//                         BoxShadow(
//                             color: Color.fromARGB(133, 0, 0, 0),
//                             offset: Offset(2, 2),
//                             blurRadius: 6)
//                       ],
//                       borderRadius: BorderRadius.circular(15),
//                       color: Color.fromARGB(181, 46, 160, 253)),
//                   child: Text(
//                     "Starting Amount",
//                     style: TextStyle(color: Colors.white),
//                   )),
//               Expanded(
//                 child: Container(
//                   height: height / 17,
//                   alignment: Alignment.centerLeft,
//                   padding: EdgeInsets.symmetric(vertical: 7, horizontal: 9),
//                   decoration: BoxDecoration(
//                       boxShadow: [
//                         BoxShadow(
//                             color: Color.fromARGB(133, 0, 0, 0),
//                             offset: Offset(2, 2),
//                             blurRadius: 6)
//                       ],
//                       borderRadius: BorderRadius.circular(15),
//                       color: Color.fromARGB(181, 46, 160, 253)),
//                   child: Obx(
//                     () => Text(
//                       NumberFormat.currency(locale: 'en_IN', symbol: '₹')
//                           .format(a.amount.value),
//                       style: TextStyle(color: Colors.white, fontSize: 30),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Obx(
//             () => PlSl(Color.fromARGB(213, 28, 228, 61), a.profit.value,
//                 a.totalProfit.value, "Profit"),
//           ),
//           Obx(
//             () => PlSl(Color.fromARGB(181, 231, 44, 19), a.loss.value,
//                 a.totalloss.value, "Loss"),
//           )
//         ],
//       ),
//     );
//   }
// }
