import 'package:any_door/account.dart';
import 'package:any_door/res/listData.dart';
import 'package:flutter/material.dart';

import '../../../models/deal_model.dart';
import '../Other/OtherPage.dart';

// 头像+用户名+发布时间

class PubAvatar extends StatefulWidget {
  final DealModel activeTrade;
  PubAvatar({Key? key, required this.activeTrade}) : super(key: key);

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
          if(widget.activeTrade.publisherID!=Account.account)
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  OtherPage(userID: widget.activeTrade.publisherID)))
        }),
        child: ListTile(
          leading: CircleAvatar(
              backgroundImage: NetworkImage(widget.activeTrade.personImage)),
          title: Text(
              widget.activeTrade.publisherID + "   " + widget.activeTrade.userName),
          subtitle: Text("发布于" + widget.activeTrade.publishTime),
        )
      // child: Text(widget.imageUrl),
    );
  }
}
