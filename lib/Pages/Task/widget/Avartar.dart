import 'package:any_door/res/listData.dart';
import 'package:flutter/material.dart';

// 头像+用户名+发布时间

class Avatar extends StatefulWidget {
  final int index;
  Avatar({Key? key, required this.index}) : super(key: key);

  @override
  State<Avatar> createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
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
