import 'package:any_door/account.dart';
import 'package:any_door/res/listData.dart';
import 'package:flutter/material.dart';

import '../../../models/deal_model.dart';
import '../Other/OtherPage.dart';

// 头像+用户名+发布时间

class PubAvatar extends StatefulWidget {
  final DealModel activeTask;
  PubAvatar({Key? key, required this.activeTask}) : super(key: key);

  @override
  State<PubAvatar> createState() => _PubAvatarState();
}

class _PubAvatarState extends State<PubAvatar> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (() => {
          // 跳转
          // print("跳转啦"),
          if(widget.activeTask.publisherID!=Account.account)
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  OtherPage(userID: widget.activeTask.publisherID)))
        }),
        child: ListTile(
          leading: CircleAvatar(
              backgroundImage: NetworkImage(widget.activeTask.personImage)),
          title: Text(
              widget.activeTask.publisherID + "   " + widget.activeTask.userName),
          subtitle: Text("发布于" + widget.activeTask.publishTime),
        )
      // child: Text(widget.imageUrl),
    );
  }
}
