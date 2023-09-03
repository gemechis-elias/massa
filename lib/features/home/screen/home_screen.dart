import 'dart:async';
import 'dart:developer';
import 'package:flutter/services.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:smart_gebere/core/utils/greeting.dart';
import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart' as graphic;
import '../../chat/presentation/screen/chat_home.dart';
import '../../forum/presentation/screen/forum.dart';
import '../../user/presentation/pages/user_profile.dart';
import 'home_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

class _HomeState extends State<Home> {
  List<Widget> listOfStrings = [
    const HomePage(),
    ChatBotRoute(),
    ForumRoute(),
    ProfileRedRoute()
  ];

  @override
  void initState() {
    super.initState();
  }

  String greeting = getGreeting();
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FAFF),
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: Container(color: Colors.black)),
      body: listOfStrings[_currentIndex],
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) {
          setState(() {
            _currentIndex = i;
            log(_currentIndex.toString());
          });
        },
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: const Icon(Icons.home),
            title: const Text("Home"),
            selectedColor: const Color(0xff20813c),
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: const Icon(Icons.chat),
            title: const Text("Chat"),
            selectedColor: const Color(0xff20813c),
          ),

          /// Search
          SalomonBottomBarItem(
            icon: const Icon(Icons.group),
            title: const Text("Forum"),
            selectedColor: const Color(0xff20813c),
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: const Icon(Icons.person),
            title: const Text("Profile"),
            selectedColor: const Color(0xff20813c),
          ),
        ],
      ),
    );
  }
}
