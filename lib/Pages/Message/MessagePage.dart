import 'dart:convert';
import 'dart:typed_data';

import 'package:any_door/Pages/Message/CommunicationPage.dart';
import 'package:any_door/models/communication_model.dart';
import 'package:flutter/material.dart';

import '../../HttpTools.dart';
import '../../account.dart';


class MessagePage extends StatefulWidget {
  const MessagePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  var activeCommunication = <CommunicationModel>[];

  @override
  void initState() {
    getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("对话列表"),
          automaticallyImplyLeading: false,),
        //列表生成
        body: ListView.builder(
            itemCount: activeCommunication.length,
            itemBuilder: (context, i) {
              return buildRow(i);
            }
        ));
  }

  //与后端交互，获取数据
  void getdata() {
    Future<Uint8List> back = NetUtils.getJsonBytes('http://1.117.239.54:8080/chat?userID=' + Account.account);
    back.then((value) {
      Map<String, dynamic> result = json.decode(utf8.decode(value)); //结果的map对象
      // print(result);
      Iterable list = result["data"];
      activeCommunication =
          list.map((model) => CommunicationModel.fromMap(model)).toList();
      // 重新加载页面
      setState(() {
        //print("setstate");
      });
    });
  }


    //每一行的生成
    Widget buildRow(int index) {
      //带参跳转
      return GestureDetector(
        onTap: (() =>
        {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  CommunicationPage(
                    activeCommunication: activeCommunication[index],
                  ))).then((val)=>val?getdata():null)

        }),
        child: ListTile(
          leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  activeCommunication[index].personImage)),
          title: buildNameTime(index),
          subtitle: Text(activeCommunication[index].lastMessage),
        ),
      );
    }

    //昵称+时间布局
    Widget buildNameTime(int index) {
      return IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(activeCommunication[index].userName),
              SizedBox(
                child: Text(
                  activeCommunication[index].lastTime, style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey
                ),),
                height: double.infinity,
              )
            ],
          ));
    }
  }

