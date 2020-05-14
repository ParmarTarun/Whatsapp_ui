import 'package:flutter/material.dart';

import 'package:whatsapp_ui/Models/message.dart';

class ChatsTab extends StatelessWidget {
  final List chats = Message.chats;

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView.builder(
          itemCount: chats.length,
          itemBuilder: (BuildContext context, index) {
            Message chat = chats[index];
            return ListTile(
              leading: CircleAvatar(
                radius: 25.0,
                backgroundImage: AssetImage(chat.sender.imageUrl),
              ),
              title: Text(
                chat.sender.name,
                style: Theme.of(context).textTheme.title,
              ),
              subtitle: Text(
                chat.text,
                maxLines: 1,
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(chat.time),
                  chat.unread
                      ? Container(
                          padding: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).accentColor),
                          child:
                              Text("1", style: TextStyle(color: Colors.white)),
                        )
                      : SizedBox()
                ],
              ),
            );
          }),
    );
  }
}
