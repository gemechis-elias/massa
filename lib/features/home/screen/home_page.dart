// create stateful widget HomePage

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:graphic/graphic.dart' as graphic;

import '../../../core/data/img.dart';
import '../../../core/data/my_colors.dart';
import '../widgets/animation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

String fullName = '';
List<Map<String, Object>> data = [
  {'genre': 'Wind', 'sold': Random().nextInt(50)},
  {'genre': 'Humidity', 'sold': Random().nextInt(50)},
  {'genre': 'Humidity', 'sold': Random().nextInt(50)},
];

class _HomePageState extends State<HomePage> {
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  height: 180,
                  foregroundDecoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(16.0),
                      bottomRight: Radius.circular(16.0),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(16.0),
                      bottomRight: Radius.circular(16.0),
                    ),
                    child: Image.asset(
                      Img.get('bg_banner.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 180,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Hello, Abel",
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Sep 2, 2023",
                            style: TextStyle(
                              fontSize: 15,
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.menu, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.search, color: Colors.white),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.more_vert, color: Colors.white),
                    onPressed: () {},
                  ),
                ]),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(10),
              transform: Matrix4.translationValues(0.0, -50.0, 0.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white, // Set the background color
                            borderRadius: BorderRadius.circular(
                                10), // Set the border radius
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromRGBO(149, 157, 165, 0.2),
                                blurRadius: 24,
                                offset: Offset(0, 8),
                              ),
                            ],
                          ),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  0), // Set this to 0 to prevent card border overlap
                            ),
                            color: Colors
                                .transparent, // Set card color to transparent
                            elevation: 0, // Set card elevation to 0
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 15,
                                horizontal: 15,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  const Text("Weather",
                                      style:
                                          TextStyle(color: MyColors.grey_80)),
                                  Row(
                                    children: [
                                      Container(
                                          width: 60.0,
                                          height: 60.0,
                                          child: Image.asset(
                                            'assets/images/weather.png',
                                            fit: BoxFit.cover,
                                          )),

                                      // large bold text for temperature with degree symbol
                                      const Text("  25°",
                                          style: TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold,
                                              color: MyColors.grey_80)),
                                    ],
                                  ),
                                  // small text for weather condition
                                  const Text("Sunny, Addis Ababa Ethiopia",
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontSize: 11,
                                          color: MyColors.grey_80)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                          width: 16), // Add some spacing between the cards
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white, // Set the background color
                            borderRadius: BorderRadius.circular(
                                10), // Set the border radius
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromRGBO(149, 157, 165, 0.2),
                                blurRadius: 24,
                                offset: Offset(0, 8),
                              ),
                            ],
                          ),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  0), // Set this to 0 to prevent card border overlap
                            ),
                            color: Colors
                                .transparent, // Set card color to transparent
                            elevation: 0, // Set card elevation to 0
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 15,
                                horizontal: 15,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  const Text("Disease Alerts",
                                      style:
                                          TextStyle(color: MyColors.grey_80)),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Container(
                                            width: 50.0,
                                            height: 50.0,
                                            child: Image.asset(
                                              'assets/images/alert_2.png',
                                              fit: BoxFit.cover,
                                            )),
                                      ),

                                      // large bold text for temperature with degree symbol
                                      const Text(" 0",
                                          style: TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold,
                                              color: MyColors.grey_80)),
                                    ],
                                  ),
                                  // small text for weather condition
                                  const Text("No, Alert Notification",
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontSize: 11,
                                          color: MyColors.grey_80)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(height: 20),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            //material non nameed  navigate to AnimationPage when tapped
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AnimationPage()),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white, // Set the background color
                              borderRadius: BorderRadius.circular(
                                  10), // Set the border radius
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromRGBO(149, 157, 165, 0.2),
                                  blurRadius: 24,
                                  offset: Offset(0, 8),
                                ),
                              ],
                            ),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    0), // Set this to 0 to prevent card border overlap
                              ),
                              color: Colors
                                  .transparent, // Set card color to transparent
                              elevation: 0, // Set card elevation to 0
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 5,
                                  horizontal: 5,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    const Text("Forcast",
                                        style:
                                            TextStyle(color: MyColors.grey_80)),
                                    SizedBox(
                                      height: 120,
                                      child: Chart(
                                        rebuild: false,
                                        data: data,
                                        variables: {
                                          'genre': Variable(
                                            accessor: (Map map) =>
                                                map['genre'] as String,
                                          ),
                                          'sold': Variable(
                                            accessor: (Map map) =>
                                                map['sold'] as num,
                                            scale: LinearScale(min: 0),
                                          ),
                                        },
                                        transforms: [
                                          Sort(
                                              compare: (tuple1, tuple2) =>
                                                  tuple1['sold'] -
                                                  tuple2['sold'])
                                        ],
                                        marks: [
                                          IntervalMark(
                                            transition: graphic.Transition(
                                                duration:
                                                    const Duration(seconds: 1)),
                                            entrance: {MarkEntrance.y},
                                            label: LabelEncode(
                                                encoder: (tuple) => Label(
                                                    tuple['sold'].toString())),
                                            tag: (tuple) =>
                                                tuple['genre'].toString(),
                                          )
                                        ],
                                        axes: [
                                          Defaults.horizontalAxis,
                                          Defaults.verticalAxis,
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                          width: 16), // Add some spacing between the cards
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white, // Set the background color
                            borderRadius: BorderRadius.circular(
                                10), // Set the border radius
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromRGBO(149, 157, 165, 0.2),
                                blurRadius: 24,
                                offset: Offset(0, 8),
                              ),
                            ],
                          ),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  0), // Set this to 0 to prevent card border overlap
                            ),
                            color: Colors
                                .transparent, // Set card color to transparent
                            elevation: 0, // Set card elevation to 0
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 5,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  const Text("Analytics",
                                      style:
                                          TextStyle(color: MyColors.grey_80)),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Container(
                                            width: 65.0,
                                            height: 65.0,
                                            child: Image.asset(
                                              'assets/images/plant.png',
                                              fit: BoxFit.cover,
                                            )),
                                      ),

                                      // create column with list of words
                                      const SizedBox(
                                        height: 100,
                                        child: Column(
                                          children: [
                                            Text(
                                                textAlign: TextAlign.start,
                                                "1. Corn        ",
                                                maxLines: 1,
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.bold,
                                                    color: MyColors.grey_80)),
                                            Text("2. Wheat      ",
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.bold,
                                                    color: MyColors.grey_80),
                                                maxLines: 1),
                                            Text("3. Soybeans",
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.bold,
                                                    color: MyColors.grey_80),
                                                maxLines: 1),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  // small text for weather condition
                                  const Text(
                                      "Corn: 1000 bushels, Soybeans: 750 bushels, Wheat: 1200 bushels",
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontSize: 11,
                                          color: MyColors.grey_80)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(149, 157, 165, 0.2),
                          blurRadius: 24,
                          offset: Offset(0, 8),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Text(
                                "Recommendations",
                                style: TextStyle(
                                    fontSize: 18, color: MyColors.grey_80),
                              ),
                              Container(height: 10),
                              const Text(
                                "Receive personalized recommendations and valuable suggestions by simply inputting your agricultural data.",
                                style: TextStyle(color: MyColors.grey_40),
                              ),
                              Container(height: 5),
                            ],
                          ),
                        ),
                        const Icon(
                          Icons.chevron_right, // Replace with your desired icon
                          color: MyColors.grey_40,
                        ),
                      ],
                    ),
                  ),
                  Container(height: 15),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white, // Set the background color
                      borderRadius:
                          BorderRadius.circular(10), // Set the border radius
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(149, 157, 165, 0.2),
                          blurRadius: 24,
                          offset: Offset(0, 8),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text("Tasks",
                            style: TextStyle(
                                fontSize: 18, color: MyColors.grey_80)),
                        Container(height: 10),
                        // Inner Cards
                        Card(
                          elevation: 4,
                          shadowColor: const Color.fromRGBO(149, 157, 165, 0.2),
                          margin: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 10),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  margin: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child: Text(
                                    "C".toUpperCase(),
                                    style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),

                                const Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "Check soil moisture",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      // Add spacing between title and description
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Container(
                                  margin: const EdgeInsets.only(
                                      right: 5, bottom: 20),
                                  child: const Text(
                                    "Sep 2,2023",
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 2,
                                  height: 50,
                                  color: Colors.green,
                                ),
                                const SizedBox(
                                    width:
                                        10), // Add some spacing to the right of the last widget
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Card(
                          elevation: 4,
                          shadowColor: const Color.fromRGBO(149, 157, 165, 0.2),
                          margin: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 10),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  margin: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child: Text(
                                    "H".toUpperCase(),
                                    style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),

                                const Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "Harvesting crops in field 1",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      // Add spacing between title and description
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Container(
                                  margin: const EdgeInsets.only(
                                      right: 5, bottom: 20),
                                  child: const Text(
                                    "Sep 4,2023",
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 2,
                                  height: 50,
                                  color: Colors.green,
                                ),
                                const SizedBox(
                                    width:
                                        10), // Add some spacing to the right of the last widget
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
