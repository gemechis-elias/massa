import 'package:smart_gebere/features/blog/presentation/widgets/AddButtonCustom.dart';
import 'package:smart_gebere/features/blog/presentation/widgets/inputField.dart';
import 'package:flutter/material.dart';

class DynamicWrapper extends StatefulWidget {
  @override
  State<DynamicWrapper> createState() => _DynamicWrapperState();
}

class _DynamicWrapperState extends State<DynamicWrapper> {
  TextEditingController tagsController = TextEditingController();
  List<String> tags = [
    "Art",
    "design",
  ];

  void addTag() {
    String tag = tagsController.text.toLowerCase();
    if (tag.isNotEmpty && !tags.contains(tag)) tags.add(tag);
    print(tags);
    setState(() {});
    tagsController.clear();
  }

  void removeTag(int index) {
    tags.removeAt(index);
    setState(() {});
  }

  List<String> getTags() {
    return tags;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
                child: InputField(
              label: "Add tags",
              controller: tagsController,
            )),
            AddButtonCustom(
              onpressed: addTag,
            )
          ],
        ),
        Text(
          "Add as many tags as you want",
          style: TextStyle(fontSize: 16),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
          child: Wrap(
            spacing: 5,
            // add vertical spacing here
            runSpacing: 5,
            children: [
              ...[for (var i = 0; i < tags.length; i++) generateChip(i)]
            ],
          ),
        ),
      ],
    );
  }

  Container generateChip(int index) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
      child: Chip(
        deleteIconColor: Colors.blue,
        label: Text(
          tags[index],
          style: TextStyle(color: Colors.blue, fontSize: 14),
        ),
        backgroundColor: Colors.white,
        shape: StadiumBorder(
          side: BorderSide(color: Colors.blue, width: 1),
        ),
        onDeleted: () {
          // Handle delete action
          removeTag(index);
        },
      ),
    );
  }
}
