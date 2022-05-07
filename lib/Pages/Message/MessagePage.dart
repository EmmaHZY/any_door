import 'package:any_door/Pages/Message/CommunicationPage.dart';
import 'package:any_door/res/listPeople.dart';
import 'package:flutter/material.dart';

import '../../my_colors.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("对话列表"),
            automaticallyImplyLeading : false,),
        //列表生成
        body: ListView.builder(
          itemCount: listPeople.length,
          itemBuilder: (context, i) {
            return buildRow(i);
          }
        ));
  }

  //每一行的生成
  Widget buildRow(int index){
    //带参跳转
    return GestureDetector(
      onTap: (() => {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CommunicationPage(
              index: index,
            )))
      }),
      child:  ListTile(
        leading: CircleAvatar(
            backgroundImage: NetworkImage(listPeople[index]["personImage"])),
        title: buildNameTime(index),
        subtitle: Text(listPeople[index]["lastMessage"]),
      ),
    );
  }

  //昵称+时间布局
  Widget buildNameTime(int index){
    return IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(listPeople[index]["userName"]),
            SizedBox(
              child: Text(listPeople[index]["lastTime"],style: const TextStyle(
                fontSize: 14,
                color: Colors.grey
              ),),
              height: double.infinity,
            )
          ],
        ));
  }
}
