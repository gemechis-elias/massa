import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:smart_gebere/features/analysis/domain/entities/analysis.dart';
import 'package:http/http.dart' as http;
import 'package:smart_gebere/features/analysis/presentation/screens/result.dart';
import '../../../../core/utils/my_colors.dart';
import '../../../chat/presentation/widgets/my_text.dart';

class AnalysisRoute extends StatefulWidget {
  const AnalysisRoute({super.key});

  @override
  AnalysisRouteState createState() => AnalysisRouteState();
}

class AnalysisRouteState extends State<AnalysisRoute> {
  final TextEditingController soilTypeController = new TextEditingController();
  final TextEditingController pHLevelController = new TextEditingController();
  final TextEditingController erosionSusceptibilityController =
      new TextEditingController();
  // longitudeController
  final TextEditingController longitudeController = new TextEditingController();
  // latitudeController
  // cityController
  final TextEditingController cityController = new TextEditingController();
  final TextEditingController latitudeController = new TextEditingController();
  final TextEditingController inputController4 = new TextEditingController();
  final TextEditingController inputController5 = new TextEditingController();
  final TextEditingController inputController6 = new TextEditingController();
  final TextEditingController inputController7 = new TextEditingController();
  bool _isLoading = false;
  @override
  void initState() {
    super.initState();
    soilTypeController.text = "Clay";
    pHLevelController.text = "7.5";
    erosionSusceptibilityController.text = "2";
    // longitude of addis ababa, ethiopia
    longitudeController.text = "38.7468";
    // latitude of addis ababa, ethiopia
    latitudeController.text = "9.0227";
    cityController.text = "Addis Ababa";

    inputController4.text = "Wheat";
    inputController5.text = "2020";
    inputController6.text = "1200";
    inputController7.text = "Common Pests";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        // Use BoxDecoration with DecorationImage to set the background image
        backgroundColor: Color.fromARGB(87, 7, 26, 7),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'assets/images/farm.jpg'), // Replace with your asset path
              fit: BoxFit.cover, // Adjust the fit as needed
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(150),
          child: Container(
            padding: const EdgeInsets.fromLTRB(60, 15, 0, 25),
            alignment: Alignment.bottomLeft,
            constraints: const BoxConstraints.expand(height: 150),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Analysis",
                    style: MyText.headline(context)!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                Container(height: 10),
                Text(
                    "Enter data of your farm to get analysis with Generative AI",
                    style:
                        MyText.body1(context)!.copyWith(color: Colors.white)),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        scrollDirection: Axis.vertical,
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("SOIL DATA",
                    style: MyText.body1(context)!
                        .copyWith(color: MyColors.grey_60)),
                Container(height: 5),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  margin: EdgeInsets.all(0),
                  elevation: 0,
                  child: Container(
                    height: 40,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      maxLines: 1,
                      controller: soilTypeController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(-12),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(height: 15),
                Text("SOIL PH LEVEL",
                    style: MyText.body1(context)!
                        .copyWith(color: MyColors.grey_60)),
                Container(height: 5),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  margin: EdgeInsets.all(0),
                  elevation: 0,
                  child: Container(
                    height: 40,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      maxLines: 1,
                      controller: pHLevelController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(-12),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(height: 15),
                Text("Erosion Susceptibility".toUpperCase(),
                    style: MyText.body1(context)!
                        .copyWith(color: MyColors.grey_60)),
                Container(height: 5),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  margin: EdgeInsets.all(0),
                  elevation: 0,
                  child: Container(
                    height: 40,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      maxLines: 1,
                      keyboardType: TextInputType.emailAddress,
                      controller: erosionSusceptibilityController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(-12),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(height: 15),
                Text("Historical Crop Yields".toUpperCase(),
                    style: MyText.body1(context)!
                        .copyWith(color: MyColors.grey_60)),
                Container(height: 5),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  margin: EdgeInsets.all(0),
                  elevation: 0,
                  child: Container(
                    height: 40,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      maxLines: 1,
                      keyboardType: TextInputType.phone,
                      controller: inputController4,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(-12),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(height: 15),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("YEAR",
                              style: MyText.body1(context)!
                                  .copyWith(color: MyColors.grey_60)),
                          Container(height: 5),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3),
                            ),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            margin: EdgeInsets.all(0),
                            elevation: 0,
                            child: Container(
                              height: 40,
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Row(
                                children: <Widget>[
                                  Container(width: 15),
                                  Expanded(
                                    child: TextField(
                                      maxLines: 1,
                                      keyboardType: TextInputType.phone,
                                      controller: inputController5,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(-12),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  Icon(Icons.expand_more,
                                      color: MyColors.grey_40)
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("YIELD",
                              style: MyText.body1(context)!
                                  .copyWith(color: MyColors.grey_60)),
                          Container(height: 5),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3),
                            ),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            margin: EdgeInsets.all(0),
                            elevation: 0,
                            child: Container(
                              height: 40,
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: TextField(
                                maxLines: 1,
                                keyboardType: TextInputType.phone,
                                controller: inputController6,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(-12),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Container(height: 15),
                Text("Pest And Disease Data".toUpperCase(),
                    style: MyText.body1(context)!
                        .copyWith(color: MyColors.grey_60)),
                Container(height: 5),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  margin: EdgeInsets.all(0),
                  elevation: 0,
                  child: Container(
                    height: 40,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      children: <Widget>[
                        Container(width: 15),
                        Expanded(
                          child: TextField(
                            maxLines: 1,
                            keyboardType: TextInputType.phone,
                            controller: inputController7,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(-12),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Icon(Icons.expand_more, color: MyColors.grey_40)
                      ],
                    ),
                  ),
                ),
                Container(height: 15),
                Container(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff20813c), elevation: 0),
                    onPressed: () async {
                      setState(() {
                        _isLoading = true;
                      });
                      Map<String, dynamic> data = await sendAnalysisRequest();

                      // ignore: use_build_context_synchronously
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResultPage(data: data)),
                      );
                    },
                    child: _isLoading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          ) // Show a CircularProgressIndicator if login is in progress
                        : const Text(
                            'Process',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Urbanist-Bold',
                                fontSize: 16),
                          ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<Map<String, dynamic>> sendAnalysisRequest() async {
    // Get user inputs from text controllers
    String soilType = soilTypeController.text;
    double pHLevel = double.parse(pHLevelController.text);
    double erosionSusceptibility =
        double.parse(erosionSusceptibilityController.text);
    double longitude = double.parse(longitudeController.text);
    double latitude = double.parse(latitudeController.text);
    String city = cityController.text;

    Map<String, dynamic> requestData = {
      "SoilData": {
        "SoilType": soilType,
        "pHLevel": pHLevel,
        "ErosionSusceptibility": erosionSusceptibility
      },
      "location": {"longtude": longitude, "latitude": latitude, "city": city},
      "HistoricalCropYields": [
        {
          "CropType": "Wheat",
          "YieldData": [
            {"Year": 2020, "Yield": 1200},
            {"Year": 2019, "Yield": 1100}
          ]
        },
        {
          "CropType": "Corn",
          "YieldData": [
            {"Year": 2020, "Yield": 800},
            {"Year": 2019, "Yield": 750}
          ]
        }
      ],
      "PestAndDiseaseData": {
        "CommonPests": ["Aphids", "Whiteflies"],
        "CommonDiseases": ["Powdery Mildew", "Rust"]
      }
    };

    // Convert the Dart Map to a JSON string
    String requestBody = json.encode(requestData);
    try {
      final response = await http.post(
        Uri.parse('https://api.tiletsolution.com/massa/public/api/suggestion'),
        body: jsonEncode(requestBody),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        // Check if the response has a "status" field and it's true
        if (jsonResponse['status'] == true) {
          // Access the CropRecommendations data
          Map<String, dynamic> cropRecommendations =
              jsonResponse['0']['CropRecommendations'];

          // Access specific fields within CropRecommendations
          List<dynamic> possibleCropTypes =
              cropRecommendations['PossibleCropTypes'];
          List<dynamic> cropRotationPlan =
              cropRecommendations['CropRotationPlan'];

// Ensure that cropRotationPlan is a List<dynamic>
          if (cropRotationPlan is List<dynamic>) {
            // Convert dynamic list to List<String>
            List<String> cropRotationPlanString =
                cropRotationPlan.map((item) => item.toString()).toList();

            // Now you can use cropRotationPlanString as needed
            log('Possible Crop Types: $possibleCropTypes');
            log('Crop Rotation Plan: $cropRotationPlanString');
          } else {
            // Handle the case where CropRotationPlan is not a list
            log('Crop Rotation Plan is not a list');
          }

          List<dynamic> toolsNeeded = jsonResponse['0']['ToolsNeeded'];

          List<String> toolsNeededString =
              toolsNeeded.map((item) => item.toString()).toList();

          log('Tools Needed: $toolsNeededString');
          return jsonResponse['0'];
          // navigate to ResultPage()
        } else {
          String errorMessage = jsonResponse['message'];
          log('API Error: $errorMessage');
          return jsonResponse['message'];
        }
      } else {
        return {};
      }
    } catch (e) {
      // Handle exceptions
      log('Error: $e');
      throw e;
    }
  }
}
