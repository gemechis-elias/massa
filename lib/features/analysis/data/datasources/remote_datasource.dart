// Future<Map<String, dynamic>> sendAnalysisRequest() async {
//     // Get user inputs from text controllers
//     String soilType = soilTypeController.text;
//     double pHLevel = double.parse(pHLevelController.text);
//     double erosionSusceptibility =
//         double.parse(erosionSusceptibilityController.text);
//     double longitude = double.parse(longitudeController.text);
//     double latitude = double.parse(latitudeController.text);
//     String city = cityController.text;

//     Map<String, dynamic> requestData = {
//       "SoilData": {
//         "SoilType": soilType,
//         "pHLevel": pHLevel,
//         "ErosionSusceptibility": erosionSusceptibility
//       },
//       "location": {"longtude": longitude, "latitude": latitude, "city": city},
//       "HistoricalCropYields": [
//         {
//           "CropType": "Wheat",
//           "YieldData": [
//             {"Year": 2020, "Yield": 1200},
//             {"Year": 2019, "Yield": 1100}
//           ]
//         },
//         {
//           "CropType": "Corn",
//           "YieldData": [
//             {"Year": 2020, "Yield": 800},
//             {"Year": 2019, "Yield": 750}
//           ]
//         }
//       ],
//       "PestAndDiseaseData": {
//         "CommonPests": ["Aphids", "Whiteflies"],
//         "CommonDiseases": ["Powdery Mildew", "Rust"]
//       }
//     };

//     // Convert the Dart Map to a JSON string
//     String requestBody = json.encode(requestData);
//     try {
//       final response = await http.post(
//         Uri.parse('https://api.tiletsolution.com/massa/public/api/suggestion'),
//         body: jsonEncode(requestBody),
//         headers: {'Content-Type': 'application/json'},
//       );

//       if (response.statusCode == 200) {
//         final jsonResponse = json.decode(response.body);

//         // Check if the response has a "status" field and it's true
//         if (jsonResponse['status'] == true) {
//           // Access the CropRecommendations data
//           Map<String, dynamic> cropRecommendations =
//               jsonResponse['0']['CropRecommendations'];

//           // Access specific fields within CropRecommendations
//           List<dynamic> possibleCropTypes =
//               cropRecommendations['PossibleCropTypes'];
//           List<dynamic> cropRotationPlan =
//               cropRecommendations['CropRotationPlan'];

// // Ensure that cropRotationPlan is a List<dynamic>
//           if (cropRotationPlan is List<dynamic>) {
//             // Convert dynamic list to List<String>
//             List<String> cropRotationPlanString =
//                 cropRotationPlan.map((item) => item.toString()).toList();

//             // Now you can use cropRotationPlanString as needed
//             log('Possible Crop Types: $possibleCropTypes');
//             log('Crop Rotation Plan: $cropRotationPlanString');
//           } else {
//             // Handle the case where CropRotationPlan is not a list
//             log('Crop Rotation Plan is not a list');
//           }

//           List<dynamic> toolsNeeded = jsonResponse['0']['ToolsNeeded'];

//           List<String> toolsNeededString =
//               toolsNeeded.map((item) => item.toString()).toList();

//           log('Tools Needed: $toolsNeededString');
//           return jsonResponse['0'];
//           // navigate to ResultPage()
//         } else {
//           String errorMessage = jsonResponse['message'];
//           log('API Error: $errorMessage');
//           return jsonResponse['message'];
//         }
//       } else {
//         return {};
//       }
//     } catch (e) {
//       // Handle exceptions
//       log('Error: $e');
//       throw e;
//     }
//   }
