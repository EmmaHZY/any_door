import 'dart:convert';
import 'dart:typed_data';

import 'package:any_door/models/communication_model.dart';
import 'package:flutter/material.dart';
import 'package:im_flutter_sdk/im_flutter_sdk.dart';

import '../../HttpTools.dart';
import '../../account.dart';
import '../../models/message_model.dart';
import '../../my_colors.dart';


class CommunicationPage extends StatefulWidget {
  final CommunicationModel activeCommunication;
  const CommunicationPage ({Key? key, required this.activeCommunication}) : super(key: key);

  @override
  State<CommunicationPage> createState() => _CommunicationPageState();
}

class _CommunicationPageState extends State<CommunicationPage> implements EMChatManagerListener{
  var textEditingController = TextEditingController();
  var messageList = <MessageModel>[];
  String toSomebody="0000000";//发消息的对象


  @override
  void initState() {//初始化聊天界面（历史记录显示），并启用环信，注册事件监听器
    getdata();
    super.initState();
    EMClient.getInstance.startCallback();
    EMClient.getInstance.chatManager.addChatManagerListener(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, // 标题居中
        title: Text(widget.activeCommunication.userName),
      ),
        body: Column(
          children: <Widget>[
            Flexible(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    if (messageList[index].senderID == Account.account) {
                      return buildRightItem(messageList[index].content);
                    } else {
                      return buildLeftItem(messageList[index].content);
                    }
                  },
                  itemCount: messageList.length,
                )),
            //
            buildMessage()
          ],
        ));
  }


  //与后端交互，获取数据
  void getdata() {
    widget.activeCommunication.userID==Account.account?toSomebody=widget.activeCommunication.friend:toSomebody=widget.activeCommunication.userID;//辨别谁是自己谁是对方
    Future<Uint8List> back = NetUtils.getJsonBytes('http://1.117.239.54:8080/message?senderID='+Account.account+'&receiverID='+toSomebody);
    back.then((value) {
      Map<String, dynamic> result = json.decode(utf8.decode(value)); //结果的map对象
      // print(result);
      Iterable list = result["data"];
      messageList =
          list.map((model) => MessageModel.fromMap(model)).toList();
      // 重新加载页面
      setState(() {
        // print("setstate");
      });
    });
  }

  //消息发送框布局
  Widget buildInput() {
    return TextField(
      minLines: 1,
      maxLines: 6,
      controller: textEditingController,
      decoration:const InputDecoration(
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
          sendMessage(textEditingController.text);
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
    //username表示聊天对象，由上一个界面传入，存在toSomebody里
    EMMessage message = EMMessage.createTxtSendMessage(username:toSomebody, content: text);//消息构建，发给谁发什么
    EMClient.getInstance.chatManager.sendMessage(message);//把消息发到第三方平台
    String send="{\"senderID\":\""+Account.account+"\","+"\"receiverID\":\""+toSomebody+"\","+"\"content\":\""+text+"\"}";
    Future<String> back=NetUtils.postJson('http://1.117.239.54:8080/message',send);
    back.then((value) => print(value));
    //print(text);
    setState(() {//重新执行页面的build函数，在消息列表中增加
      messageList.add(MessageModel(senderID:Account.account,receiverID:toSomebody,content:text));
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
          const CircleAvatar(
              backgroundImage: NetworkImage("https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpic1.zhimg.com%2Fv2-1186626d03951712212bfdf449132934_r.jpg%3Fsource%3D1940ef5c&refer=http%3A%2F%2Fpic1.zhimg.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1654617191&t=44685cb2d28c271a83481479e9bcd2c4")),
          Flexible(
              child: Container(
                margin: const EdgeInsets.only(left: 10.0, right: 10, top: 10),
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  content,
                  style: const TextStyle(fontSize: 14, color: MyColors.mPrimaryColor),
                ),
                decoration: BoxDecoration(
                  color: Colors.white10,
                  border: Border.all(color:  MyColors.mPrimaryColor, width: 1),
                  borderRadius:
                  const BorderRadius.only(bottomRight: Radius.circular(10.0)),
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
              )),
          const CircleAvatar(
              backgroundImage: NetworkImage("https://img0.baidu.com/it/u=129884950,1165288552&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500")),
        ],

      ),
    );
  }

  @override
  void dispose() {//页面销毁调用的函数
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
  void onMessagesReceived(List<EMMessage> messages) {//当接收到消息时自动调用的函数，重新构建页面，把消息加入消息列表
    for(var item in messages){
      setState(() {
        // messageList.add(Message("小Q",item.toJson()["body"]["content"].toString()));
        messageList.add(MessageModel(senderID:toSomebody,receiverID:Account.account,content:item.toJson()["body"]["content"].toString()));
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



