import 'package:any_door/res/dealListData.dart';
import 'package:flutter/material.dart';

// 头像+用户名+发布时间

class DealAvatar extends StatefulWidget {
  final int index;
  DealAvatar({Key? key, required this.index}) : super(key: key);

  @override
  State<DealAvatar> createState() => _DealAvatarState();
}

class _DealAvatarState extends State<DealAvatar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListTile(
      leading: CircleAvatar(
          backgroundImage: NetworkImage(listData[widget.index]["personImage"])),
      title: Text(listData[widget.index]["userName"]),
      subtitle: Text("发布于" + listData[widget.index]["publishTime"]),
    )
        // child: Text(widget.imageUrl),
        );
  }
}
