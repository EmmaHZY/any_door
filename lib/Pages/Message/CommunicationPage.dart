import 'package:flutter/material.dart';
import 'package:im_flutter_sdk/im_flutter_sdk.dart';

import '../../account.dart';
import '../../my_colors.dart';


class CommunicationPage extends StatefulWidget {
  const CommunicationPage ({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<CommunicationPage> createState() => _CommunicationPageState();
}

class _CommunicationPageState extends State<CommunicationPage> implements EMChatManagerListener{
  var textEditingController = TextEditingController();
  var messageList = <Message>[];

  @override
  void initState() {
    super.initState();
    EMClient.getInstance.startCallback();
    EMClient.getInstance.chatManager.addChatManagerListener(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: <Widget>[
            Flexible(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    if (messageList[index].username == '我') {
                      return buildRightItem(messageList[index].content);
                    } else {
                      return buildLeftItem(messageList[index].content);
                    }
                  },
                  itemCount: messageList.length,
                )),
            TextField(
              controller: textEditingController,
              decoration: const InputDecoration.collapsed(hintText: '请输入消息'),
              onSubmitted: sendMessage,
            )
          ],
        ));
  }

  //发送消息
  sendMessage(String text) {
    if (text.isEmpty) return;
    EMMessage message = EMMessage.createTxtSendMessage(username: Account.account, content: text);
    EMClient.getInstance.chatManager.sendMessage(message);
    print(text);
    setState(() {
      messageList.add(Message("我", "我：" + text));
    });
    textEditingController.clear();
  }

  //回复消息布局
  buildLeftItem(content) {
    return Container(
      margin: const EdgeInsets.only(left: 5.0, right: 10.0),
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, //对齐方式，左上对齐
        children: <Widget>[
          // Image.network(
          //   'https://pp.myapp.com/ma_icon/0/icon_42284557_1517984341/96',
          //   width: 40,
          //   height: 40,
          //   fit: BoxFit.cover,
          // ),
          Flexible(
              child: Container(
                margin: const EdgeInsets.only(left: 10.0, right: 10, top: 10),
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  content,
                  style: const TextStyle(fontSize: 14, color: Colors.white),
                ),
                decoration: const BoxDecoration(
                  color: MyColors.mPrimaryColor,
                  borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(10.0)),
                ),
              ))
        ],
      ),
    );
  }

  //发送消息布局
  buildRightItem(content) {
    return Container(
      margin: const EdgeInsets.only(left: 5.0, right: 10.0),
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,//让自己的消息靠右
        crossAxisAlignment: CrossAxisAlignment.start, //对齐方式，左上对齐
        children: <Widget>[
          // Image.network(
          //   'https://pp.myapp.com/ma_icon/0/icon_42284557_1517984341/96',
          //   width: 40,
          //   height: 40,
          //   fit: BoxFit.cover,
          // ),
          Flexible(
              child: Container(
                margin: const EdgeInsets.only(left: 10.0, right: 10, top: 10),
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  content,
                  style: const TextStyle(fontSize: 14, color: Colors.white),
                ),
                decoration: const BoxDecoration(
                  color: MyColors.mPrimaryColor,
                  borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(10.0)),
                ),
              ))
        ],
      ),
    );
  }

  @override
  void dispose() {
    EMClient.getInstance.chatManager.removeChatManagerListener(this);
    super.dispose();
  }

  @override
  void onCmdMessagesReceived(List<EMMessage> messages) {
    print("fuck1");
  }

  @override
  void onConversationRead(String from, String to) {
    print("fuck2");
  }

  @override
  void onConversationsUpdate() {
    print("fuck3");
  }

  @override
  void onGroupMessageRead(List<EMGroupMessageAck> groupMessageAcks) {
    print("fuck4");
  }

  @override
  void onMessagesDelivered(List<EMMessage> messages) {
    print("fuck5");
  }

  @override
  void onMessagesRead(List<EMMessage> messages) {
    print("fuck6");
  }

  @override
  void onMessagesRecalled(List<EMMessage> messages) {
    print("fuck7");
  }

  @override
  void onMessagesReceived(List<EMMessage> messages) {
    print("fuck888888888888888888888888888888888888");
    for(var item in messages){
      setState(() {
        messageList.add(Message("小Q", "收到的：" + item.body.toString()));
      });
    }
  }
}

class Message {
  var username;
  var content;

  Message(username,content) {
    this.username = username;
    this.content = content;
  }
}



