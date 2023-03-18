// import 'package:animated_flip_counter/animated_flip_counter.dart';
// import 'package:flutter/material.dart';

// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:text/MainContent.dart';
// import 'package:text/ProfitOrLoss.dart';
// import 'package:text/ShowData.dart';
// import 'package:text/controller/data.dart';

// import 'NextDay.dart';

// class TradingPage extends StatefulWidget {
//   const TradingPage({super.key});

//   @override
//   State<TradingPage> createState() => _TradingPageState();
// }

// class _TradingPageState extends State<TradingPage> {
//   Controller a = Get.put(Controller());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       // backgroundColor: Theme.of(context).backgroundColor,
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         // backgroundColor: Color.fromARGB(255, 107, 87, 87),
//         title: Stack(
//           alignment: Alignment.center,
//           children: [
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 IconButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     icon: Icon(
//                       Icons.arrow_back_ios_new,
//                       color: Colors.black,
//                     ))
//               ],
//             )
//           ],
//         ),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               // day function
//               Container(
//                 padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                 width: 150,
//                 height: 60,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.only(
//                     topRight: Radius.circular(30),
//                     bottomRight: Radius.circular(30),
//                   ),
//                   gradient: LinearGradient(
//                     colors: [
//                       Color(0xFF5A80F9),
//                       Color(0xFF3448A5),
//                     ],
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                   ),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.3),
//                       blurRadius: 5,
//                       offset: Offset(0, 3),
//                     ),
//                   ],
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Text(
//                       "Day",
//                       style: GoogleFonts.nunito(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                     Obx(() {
//                       if (a.doneLoss == false) {
//                         return AnimatedFlipCounter(
//                           textStyle: GoogleFonts.merriweather(
//                             fontSize: 28,
//                             fontWeight: FontWeight.bold,
//                             color: Color(0xFF8BFF89),
//                           ),
//                           duration: Duration(milliseconds: 500),
//                           value: a.day.value,
//                         );
//                       } else {
//                         return AnimatedFlipCounter(
//                           textStyle: GoogleFonts.merriweather(
//                             fontSize: 28,
//                             fontWeight: FontWeight.bold,
//                             color: Color(0xFFFF5353),
//                           ),
//                           duration: Duration(milliseconds: 500),
//                           value: a.day.value,
//                         );
//                       }
//                     }),
//                   ],
//                 ),
//               )
//             ],
//           ),
//           MainContent(), //this the she menu
//           Expanded(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 ProfitLoss(),
//                 ShowAfterData(),
//                 NextDay(),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
