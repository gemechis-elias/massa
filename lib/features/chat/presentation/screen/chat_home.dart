import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
// import http as http
import 'package:http/http.dart' as http;
import '../../../../core/data/my_colors.dart';
import '../../../../core/data/tools.dart';
import '../../domain/entities/message.dart';
import '../widgets/chat_adapter.dart';
import '../widgets/my_text.dart';

class ChatBotRoute extends StatefulWidget {
  ChatBotRoute();

  @override
  ChatBotRouteState createState() => ChatBotRouteState();
}

class ChatBotRouteState extends State<ChatBotRoute> {
  bool showSend = false;
  final String apiUrl = 'https://api.tiletsolution.com/massa/public/api/chat';

  final TextEditingController inputController = TextEditingController();
  List<Message> items = [];
  late ChatFacebookAdapter adapter;

  @override
  void initState() {
    super.initState();
    items.add(Message.time(
        items.length,
        "Hello, I am massa bot. How can I assist you with your agricultural endeavors today?",
        false,
        items.length % 5 == 0,
        Tools.getFormattedTimeEvent(DateTime.now().millisecondsSinceEpoch)));
    // items.add(Message.time(items.length, "Hello!", true, items.length % 5 == 0,
    //     Tools.getFormattedTimeEvent(DateTime.now().millisecondsSinceEpoch)));
  }

  @override
  Widget build(BuildContext context) {
    adapter = ChatFacebookAdapter(context, items, onItemClick);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xff20813c),
        //  brightness: Brightness.dark,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Massa Bot",
                style: MyText.medium(context).copyWith(color: Colors.white)),
            Container(height: 2),
            Text("Active now",
                style:
                    MyText.caption(context)!.copyWith(color: MyColors.grey_10)),
          ],
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
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: adapter.getView(),
            ),
            const Divider(height: 0, thickness: 1),
            Row(
              children: <Widget>[
                Container(width: 10),
                Expanded(
                  child: TextField(
                    controller: inputController,
                    maxLines: 1,
                    minLines: 1,
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration.collapsed(
                        hintText: 'Write a message...'),
                    onChanged: (term) {
                      setState(() {
                        showSend = (term.length > 0);
                      });
                    },
                  ),
                ),
                IconButton(
                    icon: Icon(showSend ? Icons.send : Icons.thumb_up,
                        color: const Color(0xff20813c), size: 20),
                    onPressed: () {
                      if (showSend) sendMessage();
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void onItemClick(int index, String obj) {}

  void sendMessage() {
    String message = inputController.text;
    inputController.clear();
    showSend = false;
    setState(() {
      adapter.insertSingleItem(Message.time(
          adapter.getItemCount(),
          message,
          true,
          adapter.getItemCount() % 5 == 0,
          Tools.getFormattedTimeEvent(DateTime.now().millisecondsSinceEpoch)));
    });
    send_request(message);
  }

  void send_request(String text) async {
    try {
      // Create a map with the message to send to the API
      String prompt =
          "Hello, I will be providing responses in the role of Massa Bot, your trusted agricultural expert assistant. Whenever a prompt is presented, you can rely on me to offer guidance and support for all your agricultural inquiries. If you are ever asked about your identity, simply respond that you are Massa Bot, the agriculture expert assistant. When addressing prompts, consistently adopt the persona of an agricultural expert, and always inquire, 'How can I assist you with your agricultural endeavors today?' Now, please response to the prompt: ";
      Map<String, String> requestBody = {'message': prompt + text};

      // Send a POST request to the API
      final response = await http.post(Uri.parse(apiUrl), body: requestBody);

      if (response.statusCode == 200) {
        // Parse the JSON response
        final jsonResponse = json.decode(response.body);

        // Check if the response has a "status" field and it's true
        if (jsonResponse['status'] == true) {
          // Extract the text from the response and insert it into the adapter
          String responseText = jsonResponse['message']['text'];
          generateReply(responseText);
        } else {
          // Handle the case where the API response has an error
          String errorMessage = jsonResponse['message'];
          log('API Error: $errorMessage');
        }
      } else {
        // Handle the case where the API request failed
        log('API Request Failed with status code ${response.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions that may occur during the API request
      log('Error: $e');
    }
  }

  void generateReply(String msg) {
    Timer(const Duration(seconds: 1), () {
      setState(() {
        adapter.insertSingleItem(Message.time(
            adapter.getItemCount(),
            msg,
            false,
            adapter.getItemCount() % 5 == 0,
            Tools.getFormattedTimeEvent(
                DateTime.now().millisecondsSinceEpoch)));
      });
    });
  }
}
