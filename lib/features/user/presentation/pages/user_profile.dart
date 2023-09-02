import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/data/img.dart';
import '../../../../core/data/my_colors.dart';
import '../../../../core/data/my_strings.dart';
import '../../../chat/presentation/widgets/my_text.dart';

class ProfileRedRoute extends StatefulWidget {
  ProfileRedRoute();

  @override
  ProfileRedRouteState createState() => new ProfileRedRouteState();
}

class ProfileRedRouteState extends State<ProfileRedRoute> {
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
      floatingActionButton: FloatingActionButton(
        heroTag: "fab3",
        backgroundColor: const Color(0xff20813c),
        elevation: 3,
        child: const Icon(
          Icons.star,
          color: Colors.white,
        ),
        onPressed: () {
          print('Clicked');
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(height: 35),
            Text("Abebe Kebede",
                style:
                    MyText.title(context)!.copyWith(color: MyColors.grey_90)),
            Container(height: 5),
            Text("Agricultural Extension",
                style:
                    MyText.body1(context)!.copyWith(color: MyColors.grey_60)),
            Container(height: 15),
            CircleAvatar(
              radius: 53,
              backgroundColor: const Color(0xff20813c),
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(Img.get("profile.png")),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
              child: Text(
                  "Abebe Kebede is an agricultural extension worker, he is working in the field for 10 years. He is a hard working person and he is very friendly.",
                  textAlign: TextAlign.center,
                  style: MyText.subhead(context)!
                      .copyWith(color: MyColors.grey_90)),
            ),
          ],
        ),
      ),
    );
  }
}
