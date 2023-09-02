import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';

class GenerateIcon extends StatefulWidget {
  TextEditingController promptController, genController;
  GenerateIcon(
      {super.key, required this.promptController, required this.genController});

  @override
  State<GenerateIcon> createState() => _GenerateIconState();
}

class _GenerateIconState extends State<GenerateIcon> {
  var promptController, genController;
  String promptText = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    promptController = widget.promptController;
    genController = widget.genController;
  }

  bool isLoading = false;

  Future<void> makeCall() async {
    String promptText = widget.promptController.text.toString().trim();

    print('running $isLoading');
    if (isLoading) {
      showToast("Generating ...", context: context);

      print("generating");

      // sleep(Duration(seconds: 3));
      await Future.delayed(Duration(seconds: 3));
      print("after sleep");

      String generatedText = await textGenerator(promptText);

      genController.value = TextEditingValue(text: generatedText);

      changeStatus();
    }
  }

  void changeStatus() {
    String promptText = widget.promptController.text.toString().trim();

    if (promptText.isEmpty) {
      print("prompt is empty");
      return;
    }
    isLoading = !isLoading;
    print("Changed $isLoading");
    setState(() {});
    WidgetsBinding.instance.addPostFrameCallback((_) => makeCall());
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return IconButton(
        icon: LoadingAnimationWidget.staggeredDotsWave(
            color: const Color.fromARGB(255, 6, 76, 133), size: 30),
        onPressed: () {
          // changeStatus();
        },
      );
    } else {
      // if(!isInitial){}
      // changeStatus();
      return IconButton(
        icon: Icon(Icons.refresh),
        onPressed: () async {
          changeStatus();
        },
      );
    }
  }
}

Future<String> textGenerator(String prompt) async {
  log("started gen");
  String apiKey = "AIzaSyAzaztq3pFR0M0FWEyMvQzcEXWQYpHE2B0",
      googleUrl =
          "https://generativelanguage.googleapis.com/v1beta2/models/text-bison-001:generateText?key=$apiKey";
  try {
    final reqBody = jsonEncode({
      "prompt": {
        "text": "help me write on this '$prompt' in a very short paragraph"
      }
    });
    var response = await http.post(Uri.parse('$googleUrl'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: reqBody);
    // log("started gen");

    final responseData = json.decode(response.body);
    log("received data");

    if (response.statusCode == 200) {
      log("success");
      var outputText = responseData["candidates"][0]["output"];
      log("fetched: $outputText");

      return outputText;
    } else {
      log("else block");

      log("error: $responseData");
      final errorMessage =
          responseData['message'] as String? ?? 'Unknown error - here';
      throw Exception(errorMessage);
    }
  } catch (e) {
    log("error:: $e");
    // log(message)
  }
  return "";
}
