import 'package:flutter/material.dart';

import '../../../chat/presentation/widgets/my_text.dart';

class ForumRoute extends StatefulWidget {
  ForumRoute();

  @override
  ForumRouteState createState() => new ForumRouteState();
}

class ForumRouteState extends State<ForumRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: const Color(0xff20813c),
          title: const Text(
            "Profile",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            PopupMenuButton<String>(
              onSelected: (String value) {},
              itemBuilder: (context) => [
                const PopupMenuItem(
                  textStyle: TextStyle(
                    color: Colors.white,
                  ),
                  value: "Settings",
                  child: Text("Settings"),
                ),
              ],
            )
          ]),
      body: Align(
        alignment: Alignment.center,
        child: Container(
          alignment: Alignment.center,
          width: 220,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.grey[300],
                  ),
                  Container(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(height: 10, width: 80, color: Colors.grey[300]),
                      Container(height: 10),
                      Container(
                          height: 10, width: 145, color: Colors.grey[300]),
                      Container(height: 10),
                      Container(height: 10, width: 40, color: Colors.grey[300])
                    ],
                  )
                ],
              ),
              Container(height: 20),
              Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.grey[200],
                  ),
                  Container(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          height: 10, width: 100, color: Colors.grey[200]),
                      Container(height: 10),
                      Container(
                          height: 10, width: 145, color: Colors.grey[200]),
                      Container(height: 10),
                      Container(height: 10, width: 40, color: Colors.grey[200])
                    ],
                  )
                ],
              ),
              Container(height: 25),
              Text("Archived conversations appear here",
                  style: MyText.subhead(context)!
                      .copyWith(color: Colors.grey[700])),
            ],
          ),
        ),
      ),
    );
  }
}
