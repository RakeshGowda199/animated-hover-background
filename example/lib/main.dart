import 'dart:ui';

import 'package:animated_hover_background/animated_hover_background.dart';
import 'package:background_anim/custom_calender.dart';
import 'package:background_anim/home_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String pageName = 'home';

  @override
  Widget build(BuildContext context) {
    return AnimatedHoverBackground(Scaffold(
      backgroundColor: Colors.transparent,
      body: pageName == "home" ? Home_Dash_Screen() : CustomCalender(),
      bottomNavigationBar: Stack(
        children: [
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(bottom: 20, right: 12, left: 12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white24,
                border: Border.all(color: Colors.grey.shade200)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                    onTap: () {
                      pageName = 'home';
                      setState(() {});
                    },
                    child: const Icon(Icons.dashboard_customize_outlined)),
                GestureDetector(
                    onTap: () {
                      pageName = 'calender';
                      setState(() {});
                    },
                    child: const Icon(Icons.calendar_month)),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
