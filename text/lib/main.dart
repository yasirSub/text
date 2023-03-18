import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:text/EachButtonMain.dart';

import 'package:text/MoneyManagement/MainMoneyManagement.dart';
import 'package:text/Reset/resetPage.dart';
import 'package:text/Strategies/MainStategiesPage.dart';
import 'package:text/controller/notification.dart';
import 'package:text/day.dart';

import 'LoginPage/MianPage.dart';
import 'MainPageInput.dart';
import 'TradingPage.dart';
import 'controller/data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Controller a = Get.put(Controller());
  await GetStorage.init("Datas");
  a.retriveData();
  AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
          channelShowBadge: true,
          enableLights: true,
          enableVibration: true,
          defaultColor: Color.fromARGB(255, 255, 252, 252),
          channelKey: 'basic_channel',
          channelName: 'basic_notifications',
          channelDescription: 'notification_channel')
    ],
    debug: true,
  );
  AwesomeNotifications().isNotificationAllowed().then((value) {
    if (value == false) {
      AwesomeNotifications().requestPermissionToSendNotifications();
    }
  });
  runApp(const MyApp());
  if (GetStorage("Datas").read("login") == true) {
    notification(
        GetStorage("Datas").read("day"),
        GetStorage("Datas").read("totalProfit"),
        GetStorage("Datas").read("totalLoss"),
        GetStorage("Datas").read("amount"));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Trade Shield',
      // theme: ThemeData(useMaterial3: true),

      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,

      // home: MyHomePage(),
      home: (GetStorage("Datas").read("login") == false ||
              GetStorage("Datas").read("login") == null)
          ? LoginPage()
          : TradingPage(),
    );
  }
}

class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key});

  @override
  State<DrawerPage> createState() => _DrawerState();
}

class _DrawerState extends State<DrawerPage> with TickerProviderStateMixin {
  Controller a = Get.put(Controller());
  var drw = ZoomDrawerController();
  @override
  void initState() {
    AwesomeNotifications().isNotificationAllowed().then((value) {
      if (value == false) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: drw,
      androidCloseOnBackTap: true,
      mainScreenTapClose: true,
      dragOffset: 100,
      drawerShadowsBackgroundColor: Color.fromARGB(255, 255, 247, 247),
      angle: -10,
      showShadow: true,
      // menuBackgroundColor: Color.fromARGB(255, 117, 152, 228),
      menuBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
      mainScreenScale: 0.05,
      style: DrawerStyle.defaultStyle,
      menuScreen: DrawerScreen(),
      mainScreen: Scaffold(
        resizeToAvoidBottomInset: false,
        // backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () async {
                drw.toggle!(forceToggle: true);
              },
              icon: Icon(Icons.menu)),
          // backgroundColor: Theme.of(context).backgroundColor,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MainPageInput(),
              GestureDetector(
                  onTap: () {
                    Get.to(
                        transition: Transition.rightToLeftWithFade,
                        duration: Duration(milliseconds: 300),
                        () => TradingPage());
                  },
                  child: EachButtonMain("Trading")),
              GestureDetector(
                  onTap: () {
                    a.moneyManagementAmount.value = a.amount.value;
                    Get.to(
                        transition: Transition.rightToLeftWithFade,
                        duration: Duration(milliseconds: 300),
                        () => MoneyManagementMain());
                  },
                  child: EachButtonMain("Money Management")),
              GestureDetector(
                  onTap: () {
                    Get.to(
                        transition: Transition.rightToLeftWithFade,
                        duration: Duration(milliseconds: 300),
                        () => Strategies());
                  },
                  child: EachButtonMain("Strategies")),
              GestureDetector(
                onTap: () {
                  Get.to(
                      transition: Transition.rightToLeftWithFade,
                      duration: Duration(milliseconds: 300),
                      () => ResetPage());
                },
                child: EachButtonMain("Reset"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Controller a = Get.put(Controller());
  TextEditingController amount = TextEditingController();
  TextEditingController profit = TextEditingController();
  TextEditingController loss = TextEditingController();
  @override
  void initState() {
    AwesomeNotifications().isNotificationAllowed().then((value) {
      if (value == false) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 250, 250, 250),
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        backgroundColor: Color.fromARGB(255, 66, 39, 39),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MainPageInput(),
            GestureDetector(
                onTap: () {
                  Get.to(
                      transition: Transition.rightToLeftWithFade,
                      duration: Duration(milliseconds: 300),
                      () => TradingPage());
                },
                child: EachButtonMain("Check Trading")),
            GestureDetector(
                onTap: () {
                  a.moneyManagementAmount.value = a.amount.value;
                  Get.to(
                      transition: Transition.rightToLeftWithFade,
                      duration: Duration(milliseconds: 300),
                      () => MoneyManagementMain());
                },
                child: EachButtonMain("Money Management")),
            GestureDetector(onTap: () {}, child: EachButtonMain("Strategies")),
            GestureDetector(
                onTap: () {
                  Get.to(
                      transition: Transition.rightToLeftWithFade,
                      duration: Duration(milliseconds: 300),
                      () => ResetPage());
                },
                child: EachButtonMain("Reset")),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class DrawerScreen extends StatelessWidget {
  Controller a = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(),
        GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (ctx) => DrawerPage()));
            },
            child: DrawerButton("Home", Icons.home)),
        GestureDetector(
            onTap: () {
              Get.to(transition: Transition.rightToLeftWithFade, TradingPage());
            },
            child: DrawerButton("Trading", Icons.auto_graph_sharp)),
        GestureDetector(
            onTap: () {
              Get.to(
                  transition: Transition.rightToLeftWithFade,
                  MoneyManagementMain());
            },
            child: DrawerButton("Money ", Icons.money)),
        GestureDetector(
            onTap: () {
              a.resetValue();
            },
            child: DrawerButton("Reset", Icons.restart_alt)),
        Spacer(),
        GestureDetector(
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
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            alignment: Alignment.center,
            height: 50,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 155, 95, 95),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.white)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.logout,
                ),
                Text(
                  "Log Out",
                  style: GoogleFonts.actor(
                      color: Color.fromARGB(255, 0, 0, 0), fontSize: 25),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class DrawerButton extends StatelessWidget {
  DrawerButton(this.text, this.icon);
  String text;
  IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      alignment: Alignment.center,
      height: 50,
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 197, 89, 89),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Color.fromARGB(255, 194, 128, 128))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            icon,
          ),
          Text(
            text,
            style: GoogleFonts.actor(
                color: Color.fromARGB(255, 7, 7, 7), fontSize: 25),
          ),
        ],
      ),
    );
  }
}
