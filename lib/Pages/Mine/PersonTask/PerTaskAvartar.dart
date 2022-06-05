import 'package:any_door/res/listData.dart';
import 'package:flutter/material.dart';

// 头像+用户名+发布时间

class PerTaskAvatar extends StatefulWidget {
  final int index;
  PerTaskAvatar({Key? key, required this.index}) : super(key: key);

  @override
  State<PerTaskAvatar> createState() => _PerTaskAvatarState();
}

class _PerTaskAvatarState extends State<PerTaskAvatar> {
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
