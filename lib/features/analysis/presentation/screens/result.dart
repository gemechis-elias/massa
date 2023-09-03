// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:smart_gebere/core/utils/clear_token.dart';

import '../../../../core/data/img.dart';
import '../../../../core/data/my_colors.dart';
import 'analysis.dart';

class ResultPage extends StatefulWidget {
  final Map<String, dynamic> data;

  const ResultPage({super.key, required this.data});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    String plantingTime = widget.data['CropRecommendations']
        ['PlantingAndHarvestingTime']['Lettuce']['PlantingTime'];
    String HarvestingTime = widget.data['CropRecommendations']
        ['PlantingAndHarvestingTime']['Lettuce']['HarvestingTime'];
    String AdditionalWaterNeeds =
        widget.data['CropRecommendations']['AdditionalWaterNeeds']['Lettuce'];
    String Beans =
        widget.data['CropRecommendations']['AdditionalWaterNeeds']['Beans'];

    String ToolsNeeded = widget.data['ToolsNeeded'].toString();

    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xff20813c),
          title: const Text(
            "Report",
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
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    color: Color.fromARGB(255, 218, 237, 255),
                    width: double.infinity,
                    height: 280,
                    foregroundDecoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.4),
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
                      child: Container(
                        decoration: BoxDecoration(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 250,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: const Align(
                            alignment: Alignment.center,
                            child:
                                //  network image
                                Image(
                              image: NetworkImage(
                                'https://quickchart.io/chart?width=400&height=400&backgroundColor=white&c=%7Btype:%27bar%27,data:%7Blabels:[%27Lettuce%27,%27Beans%27,%27Cabbage%27],datasets:[%7Blabel:%27Yield%20(kg/acre)%27,data:[1200,800,1000],backgroundColor:[%27orange%27,%27aqua%27,%27coral%27]%7D],options:%7Bscales:%7By:%7BbeginAtZero:true%7D%7D%7D%7D%7D',
                              ),
                              width: 200,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: const Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Analysis Report",
                              style: TextStyle(
                                fontSize: 15,
                                color: Color.fromRGBO(0, 0, 0, 1),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                color: Color.fromARGB(255, 218, 237, 255),
                padding: const EdgeInsets.all(10),
                //  transform: Matrix4.translationValues(0.0, -50.0, 0.0),
                child: Column(
                  children: <Widget>[
                    Container(height: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AnalysisRoute()),
                        );
                      },
                      child: Container(
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
                                    "Tools Needed ",
                                    style: TextStyle(
                                        fontSize: 18, color: MyColors.grey_80),
                                  ),
                                  Container(height: 10),
                                  Text(
                                    ToolsNeeded,
                                    style: TextStyle(color: MyColors.grey_40),
                                  ),
                                  Container(height: 5),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(height: 15),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AnalysisRoute()),
                        );
                      },
                      child: Container(
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
                                    "Planting Time",
                                    style: TextStyle(
                                        fontSize: 18, color: MyColors.grey_80),
                                  ),
                                  Container(height: 10),
                                  Text(
                                    "$plantingTime. $HarvestingTime",
                                    style: TextStyle(color: MyColors.grey_40),
                                  ),
                                  Container(height: 5),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(height: 15),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AnalysisRoute()),
                        );
                      },
                      child: Container(
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
                                    "Additional Water Needs",
                                    style: TextStyle(
                                        fontSize: 18, color: MyColors.grey_80),
                                  ),
                                  Container(height: 10),
                                  Text(
                                    AdditionalWaterNeeds + " " + Beans,
                                    style: TextStyle(color: MyColors.grey_40),
                                  ),
                                  Container(height: 5),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(height: 15),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
