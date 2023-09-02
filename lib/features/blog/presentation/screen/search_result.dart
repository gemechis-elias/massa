import 'package:flutter/material.dart';

class SearchResult extends StatefulWidget {
  final String keyword;

  const SearchResult({super.key, required this.keyword});

  @override
  SearchResultState createState() => SearchResultState();
}

class SearchResultState extends State<SearchResult> {
  bool finishLoading = true;
  bool showClear = false;
  final TextEditingController inputController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FAFF),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: TextField(
          maxLines: 1,
          controller: inputController,
          style: TextStyle(color: Colors.grey[800], fontSize: 18),
          keyboardType: TextInputType.text,
          onSubmitted: (term) {
            setState(() {
              finishLoading = false;
            });
            delayShowingContent();
          },
          onChanged: (term) {
            setState(() {
              showClear = (term.length > 2);
            });
          },
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: 'Search',
            hintStyle: TextStyle(fontSize: 20.0),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          showClear
              ? IconButton(
                  icon: const Icon(Icons.close, color: Colors.black),
                  onPressed: () {
                    inputController.clear();
                    showClear = false;
                    setState(() {});
                  },
                )
              : Container(),
        ],
      ),
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedOpacity(
          opacity: finishLoading ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 100),
          child: buildContent(context),
        ),
        AnimatedOpacity(
          opacity: finishLoading ? 0.0 : 1.0,
          duration: const Duration(milliseconds: 100),
          child: buildLoading(context),
        ),
      ],
    );
  }

  Widget buildLoading(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: 80,
        height: 80,
        alignment: Alignment.center,
        child: const CircularProgressIndicator(),
      ),
    );
  }

  Widget buildContent(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: 180,
        height: 100,
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("No result",
                style: TextStyle(
                    color: Colors.grey[500], fontWeight: FontWeight.bold)),
            Container(height: 5),
            Text("Try input more general keyword/tags",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[500])),
          ],
        ),
      ),
    );
  }

  void delayShowingContent() {
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        finishLoading = true;
      });
    });
  }
}
