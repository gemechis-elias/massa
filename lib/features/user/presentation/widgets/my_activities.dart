import 'dart:developer';

import 'package:smart_gebere/features/blog/domain/entities/article.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_gebere/features/user/domain/entities/user.dart' as UserEntity;

// import 'package:profile/widgets/my_post.dart';

import 'my_post.dart';

class MyActivity extends StatefulWidget {
  final String activity;
  final UserEntity.User user;
  final List<Article> articles;

  const MyActivity(
      {super.key,
      required this.activity,
      required this.articles,
      required this.user});

  @override
  State<MyActivity> createState() => _MyActivityState();
}

class _MyActivityState extends State<MyActivity> {
  bool showGridView = false;
  List<Article> filteredArticles = [];

  @override
  Widget build(BuildContext context) {
    String userIdToFilter = widget.user.id ?? "123";
    log("User ID to filter: $userIdToFilter");
    filteredArticles = widget.articles
        .where((article) => article.user?.id == userIdToFilter)
        .toList();

    Map<String, Widget> metricData = {
      'Posts': blogListView(showGridView, widget.articles, widget.articles),
      'Following': const Text('Following'),
      'Follower': const Text('Follower'),
      // ... More key-value pairs
    };

    return Container(
      width: MediaQuery.of(context).size.width,
      // height: 200,

      decoration: const BoxDecoration(
        color: Colors.white, // Set your desired background color
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0x0F5182FF),
            blurRadius: 30,
            offset: Offset(0, 10),
            spreadRadius: 0,
          ),
        ],
      ),

      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const SizedBox(width: 20),
              Text(
                widget.activity,
                style: const TextStyle(
                  color: Color(0xFF1A1A1A),
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Urbanist',
                  fontSize: 20,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  setState(() {
                    showGridView = true;
                  });
                },
                icon: Stack(
                  children: [
                    Icon(Icons.grid_view,
                        size: 34,
                        color: showGridView
                            ? const Color.fromARGB(255, 95, 55, 252)
                            : const Color.fromARGB(
                                255, 96, 96, 96)), // Stroke icon
                    // FaIcon(FontAwesomeIcons.gripHorizontal,
                    //     size: 32,
                    //     color: const Color.fromARGB(
                    //         255, 255, 255, 255)), // Main icon
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0, left: 16),
                child: IconButton(
                    onPressed: () {
                      setState(() {
                        showGridView = false;
                      });
                    },
                    icon: Icon(
                      Icons.menu,
                      color: showGridView
                          ? const Color.fromARGB(255, 96, 96, 96)
                          : const Color.fromARGB(255, 95, 55, 252),
                      size: 30,
                    )),
              ),
              // SizedBox(
              //   width: 20,
              // ),
            ],
          ),
          Expanded(child: metricData[widget.activity]!),
        ],
      ),
    );
  }
}
