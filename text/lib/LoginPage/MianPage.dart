import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:text/main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var signup = false.obs;
  double ani = 0;
  int duration = 200;
  var loading = false.obs;
  var loadingSignin = false.obs;
  TextEditingController loginEmail = TextEditingController();
  TextEditingController loginPassword = TextEditingController();
  TextEditingController signInEmail = TextEditingController();
  TextEditingController signInPassword = TextEditingController();
  TextEditingController signInName = TextEditingController();
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
    print(GetStorage("Datas").read("amount"));
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Color.fromARGB(222, 255, 248, 248), BlendMode.dstIn),
              fit: BoxFit.cover,
              image: AssetImage("./assets/Capture.jpg"))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        body: Center(child: Obx(() {
          if (signup == false)
            return AnimatedContainer(
              duration: Duration(milliseconds: duration),
              height: height / 2.5,
              width: width / 1.3,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 0),
                        color: Color.fromARGB(97, 0, 0, 0),
                        spreadRadius: 2,
                        blurRadius: 10)
                  ],
                  color: Color.fromARGB(221, 115, 127, 240),
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8, top: 8),
                    child: Text(
                      "Welcome to,",
                      style: GoogleFonts.actor(
                          fontSize: 25, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0, left: 8),
                    child: Text(
                      "Trade Shield",
                      style: GoogleFonts.roboto(
                          fontSize: 40,
                          fontWeight: FontWeight.w200,
                          color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: duration),
                    height: 0,
                    margin: EdgeInsets.symmetric(vertical: 5),
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: TextField(
                      cursorColor: Color.fromARGB(255, 12, 12, 12),
                      decoration: InputDecoration(
                          enabled: false,
                          labelText: "Name",
                          labelStyle: GoogleFonts.actor(
                              color: Color.fromARGB(255, 14, 14, 14),
                              fontSize: 20),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 253, 252, 252),
                                  width: 1)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 23, 22, 22),
                                  width: 2))),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: TextField(
                      controller: loginEmail,
                      keyboardType: TextInputType.emailAddress,
                      style: GoogleFonts.actor(color: Colors.white),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                          labelText: "Email",
                          labelStyle: GoogleFonts.actor(
                              color: Color.fromARGB(255, 249, 249, 249),
                              fontSize: 20),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 255, 250, 250),
                                  width: 1)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2))),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: TextField(
                      keyboardType: TextInputType.visiblePassword,
                      controller: loginPassword,
                      style: GoogleFonts.actor(color: Colors.white),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: GoogleFonts.actor(
                              color: Color.fromARGB(255, 249, 249, 249),
                              fontSize: 20),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 255, 250, 250),
                                  width: 1)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2))),
                    ),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (loginEmail.text == '' ||
                              loginPassword.text == '') {
                            Get.snackbar(
                                "Invalid value", "Please fill each field",
                                backgroundColor: Color.fromARGB(118, 0, 0, 0),
                                colorText: Colors.white);
                          } else {
                            loading.value = true;
                            FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: loginEmail.text,
                                    password: loginPassword.text)
                                .then((value) {
                              loading.value = false;
                              GetStorage("Datas").write("login", true);
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (ctx) => DrawerPage()));
                            }).onError((error, stackTrace) {
                              loading.value = false;
                              String e;
                              e = error.toString().replaceAll(
                                  "[firebase_auth/wrong-password]", "");
                              e = e.replaceAll(
                                  "[firebase_auth/invalid-email]", "");
                              e = e.replaceAll(
                                  "[firebase_auth/user-not-found] ", "");
                              e = e.replaceAll(
                                  "[firebase_auth/user-not-found]", "");
                              e = e.replaceAll(
                                  "[firebase_auth/network-request-failed]", "");

                              print(e);
                              Get.snackbar(e, '',
                                  backgroundColor: Color.fromARGB(118, 0, 0, 0),
                                  colorText: Colors.white);
                            });
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: width / 3,
                          height: 60,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color.fromARGB(255, 244, 244, 244)),
                              borderRadius: BorderRadius.circular(20)),
                          child: Obx(() {
                            if (loading.value == true) {
                              return Center(
                                child: LoadingAnimationWidget.twistingDots(
                                    leftDotColor: Colors.white,
                                    rightDotColor: Colors.deepPurple,
                                    size: 20),
                              );
                            } else {
                              return Text(
                                "Login",
                                style: GoogleFonts.actor(
                                    fontSize: 20, color: Colors.white),
                              );
                            }
                          }),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          signup.value = true;
                          ani = 60;
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: width / 3,
                          height: 60,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(249, 255, 212, 147),
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            "Sign Up",
                            style: GoogleFonts.actor(
                                fontSize: 20,
                                color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                        ),
                      )
                    ],
                  ),
                  Spacer(),
                ],
              ),
            );
          else
            return AnimatedContainer(
              duration: Duration(milliseconds: duration),
              height: height / 2.2,
              width: width / 1.3,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 0),
                        color: Color.fromARGB(97, 0, 0, 0),
                        spreadRadius: 2,
                        blurRadius: 10)
                  ],
                  color: Color.fromARGB(194, 252, 212, 151),
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8, top: 8),
                    child: Text(
                      "Welcome to,",
                      style: GoogleFonts.actor(
                          fontSize: 25, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0, left: 8),
                    child: Text(
                      "Trade Shield",
                      style: GoogleFonts.roboto(
                          fontSize: 40,
                          fontWeight: FontWeight.w200,
                          color: Color.fromARGB(255, 5, 5, 5)),
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: duration),
                    height: ani,
                    margin: EdgeInsets.symmetric(vertical: 5),
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: TextField(
                      controller: signInName,
                      cursorColor: Color.fromARGB(255, 12, 12, 12),
                      decoration: InputDecoration(
                          labelText: "Name",
                          labelStyle: GoogleFonts.actor(
                              color: Color.fromARGB(255, 14, 14, 14),
                              fontSize: 20),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 13, 13, 13),
                                  width: 1)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 23, 22, 22),
                                  width: 2))),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: TextField(
                      controller: signInEmail,
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Color.fromARGB(255, 9, 9, 9),
                      decoration: InputDecoration(
                          labelText: "Email",
                          labelStyle: GoogleFonts.actor(
                              color: Color.fromARGB(255, 10, 10, 10),
                              fontSize: 20),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 12, 12, 12),
                                  width: 1)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 12, 12, 12),
                                  width: 2))),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: TextField(
                      controller: signInPassword,
                      keyboardType: TextInputType.visiblePassword,
                      cursorColor: Color.fromARGB(255, 12, 12, 12),
                      decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: GoogleFonts.actor(
                              color: Color.fromARGB(255, 14, 14, 14),
                              fontSize: 20),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 13, 13, 13),
                                  width: 1)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 23, 22, 22),
                                  width: 2))),
                    ),
                  ),
                  Spacer(),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            signInName.text = '';
                            signup.value = false;
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: width / 3,
                            height: 60,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(221, 115, 127, 240),
                                borderRadius: BorderRadius.circular(20)),
                            child: Text(
                              "Login",
                              style: GoogleFonts.actor(
                                  fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (signInEmail.text == '' ||
                                signInName.text == '' ||
                                signInPassword.text == '') {
                              Get.snackbar(
                                  "Invalid value", "Please fill each field",
                                  backgroundColor: Color.fromARGB(118, 0, 0, 0),
                                  colorText: Colors.white);
                            } else {
                              loadingSignin.value = true;
                              FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                      email: signInEmail.text,
                                      password: signInPassword.text)
                                  .then((value) {
                                GetStorage("Datas").write("login", true);
                                loadingSignin.value = false;
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (ctx) => DrawerPage()));
                              }).onError((error, stackTrace) {
                                String e;
                                print(error);
                                print(error.toString().replaceAll(
                                    "[firebase_auth/email-already-in-use]",
                                    ""));
                                e = error.toString().replaceAll(
                                    "[firebase_auth/email-already-in-use]", "");
                                e = e.replaceAll(
                                    "[firebase_auth/invalid-email]", '');
                                e = e.replaceAll(
                                    "[firebase_auth/weak-password]", '');
                                e = e.replaceAll(
                                    "[firebase_auth/network-request-failed]",
                                    "");
                                Get.snackbar(e, '',
                                    backgroundColor:
                                        Color.fromARGB(118, 0, 0, 0),
                                    colorText: Colors.white);
                                loadingSignin.value = false;
                              });
                              loadingSignin.value = false;
                            }
                          },
                          child: Container(
                              alignment: Alignment.center,
                              width: width / 3,
                              height: 60,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color.fromARGB(255, 31, 31, 31)),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Obx(() {
                                if (loadingSignin.value == true) {
                                  return Center(
                                    child: LoadingAnimationWidget.twistingDots(
                                        leftDotColor: Colors.black,
                                        rightDotColor: Colors.amber,
                                        size: 20),
                                  );
                                } else {
                                  return Text(
                                    "Sign Up",
                                    style: GoogleFonts.actor(
                                        fontSize: 20,
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                  );
                                }
                              })),
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                ],
              ),
            );
        })),
      ),
    );
  }
}
