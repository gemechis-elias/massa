import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_gebere/features/chat/domain/entities/message.dart';
import 'package:smart_gebere/features/chat/presentation/widgets/my_text.dart';

import '../../../../core/data/img.dart';
import '../../../../core/data/my_colors.dart';
import 'circle_image.dart';

class ChatFacebookAdapter {
  List items = <Message>[];
  BuildContext context;
  Function onItemClick;
  ScrollController scrollController = new ScrollController();

  ChatFacebookAdapter(this.context, this.items, this.onItemClick);

  void insertSingleItem(Message msg) {
    int insertIndex = items.length;
    items.insert(insertIndex, msg);
    scrollController.animateTo(scrollController.position.maxScrollExtent + 100,
        duration: const Duration(milliseconds: 100), curve: Curves.easeOut);
  }

  Widget getView() {
    return ListView.builder(
      itemCount: items.length,
      padding: const EdgeInsets.symmetric(vertical: 10),
      controller: scrollController,
      itemBuilder: (context, index) {
        Message item = items[index];
        return buildListItemView(index, item);
      },
    );
  }

  Widget buildListItemView(int index, Message item) {
    bool isMe = item.fromMe;
    return Column(
      children: <Widget>[
        item.showTime
            ? Container(
                padding: const EdgeInsets.all(5),
                child: Text(item.date,
                    style:
                        const TextStyle(fontSize: 12, color: MyColors.grey_40)),
              )
            : const SizedBox(width: 0, height: 0),
        Row(
          crossAxisAlignment:
              isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(width: isMe ? 20 : 10, height: 0),
            isMe
                ? const SizedBox(width: 0, height: 0)
                : Container(
                    width: 30,
                    height: 30,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: CircleImage(
                      imageProvider: AssetImage(Img.get('robot.jpg')),
                    ),
                  ),
            Container(width: isMe ? 0 : 5),
            Expanded(
              child: Column(
                crossAxisAlignment:
                    isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: <Widget>[
                  Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      margin: EdgeInsets.fromLTRB(
                          isMe ? 20 : 0, 5, isMe ? 0 : 20, 5),
                      color: isMe ? const Color(0xff20813c) : MyColors.grey_10,
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 8),
                        child: Text(item.content,
                            style: MyText.subhead(context)!.copyWith(
                                color: isMe ? Colors.white : MyColors.grey_90)),
                      ))
                ],
              ),
            ),
            (index == items.length - 1 && isMe)
                ? Container(
                    padding: const EdgeInsets.all(5),
                    child: const Align(
                      alignment: Alignment.bottomRight,
                      child: Icon(
                        Icons.check_circle,
                        size: 10,
                        color: Color(0xff20813c),
                      ),
                    ),
                  )
                : const SizedBox(width: 10, height: 10),
            SizedBox(width: isMe ? 10 : 20, height: 0)
          ],
        )
      ],
    );
  }

  int getItemCount() => items.length;
}
