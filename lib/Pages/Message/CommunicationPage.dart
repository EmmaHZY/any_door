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
      appBar: AppBar(
        centerTitle: true, // 标题居中
        title: const Text('~雨仙女~'),
      ),
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
            //
            buildMessage(),
          ],
        ));
  }

  //消息发送框布局
  Widget buildInput() {
    return TextField(
      minLines: 1,
      maxLines: 6,
      controller: textEditingController,
      decoration: const InputDecoration(
        hintText: '请输入消息',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20)
          ),
        ),
      ),
      onSubmitted: sendMessage,
    );
  }
  //发送按钮布局
  Widget buildSendButton() {
    return ClipRRect(
      child: FlatButton(
        disabledColor:MyColors.mPrimaryColor,
        splashColor: MyColors.mThirdLight,
        highlightColor: MyColors.mThirdLight,
        hoverColor: MyColors.mThirdLight,
        color: MyColors.mPrimaryColor,
        padding: const EdgeInsets.only(right: 0),
        child: const Text(
          "发送",
          textAlign: TextAlign.center,//水平居中
          style: TextStyle(fontSize: 16,color: Colors.white)),
        onPressed:(){
          sendMessage;
        },
      ),
      borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20)
      ),
    );
  }
  //消息发送部件整体布局
  Widget buildMessage(){
    return IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: buildInput(),
            ),
            Expanded(
                flex: 1,
                child: SizedBox(
                  child:  buildSendButton(),
                  height: double.infinity,
                )
            ),
            // const CodeTimer(),
          ],
        ));
  }


  //发送消息
  sendMessage(String text) {
    if (text.isEmpty) return;
    //username表示聊天对象，由上一个界面传入
    EMMessage message = EMMessage.createTxtSendMessage(username: "1951969", content: text);
    EMClient.getInstance.chatManager.sendMessage(message);
    print(text);
    setState(() {
      messageList.add(Message("我", text));
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
                  style: const TextStyle(fontSize: 14, color: MyColors.mPrimaryColor),
                ),
                decoration: const BoxDecoration(
                  color: Colors.white12,
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
  }

  @override
  void onConversationRead(String from, String to) {
  }

  @override
  void onConversationsUpdate() {
  }

  @override
  void onGroupMessageRead(List<EMGroupMessageAck> groupMessageAcks) {
  }

  @override
  void onMessagesDelivered(List<EMMessage> messages) {
  }

  @override
  void onMessagesRead(List<EMMessage> messages) {
  }

  @override
  void onMessagesRecalled(List<EMMessage> messages) {
  }

  @override
  void onMessagesReceived(List<EMMessage> messages) {
    for(var item in messages){
      setState(() {
        messageList.add(Message("小Q",item.toJson()["body"]["content"].toString()));
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



