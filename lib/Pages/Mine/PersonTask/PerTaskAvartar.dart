import 'package:any_door/res/listData.dart';
import 'package:flutter/material.dart';

import '../../../account.dart';
import '../../../models/task_model.dart';
import '../Other/OtherPage.dart';

// 头像+用户名+发布时间

class PerTaskAvatar extends StatefulWidget {
  final TaskModel activeTask;
  PerTaskAvatar({Key? key, required this.activeTask}) : super(key: key);

  @override
  State<PerTaskAvatar> createState() => _PerTaskAvatarState();
}

class _PerTaskAvatarState extends State<PerTaskAvatar> {
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
    child: Container(
        child: ListTile(
          leading: CircleAvatar(
              backgroundImage: NetworkImage(widget.activeTask.personImage)),
          title: Text(
              widget.activeTask.publisherID + "   " + widget.activeTask.username),
          subtitle: Text("发布于" + widget.activeTask.publishTime),
        )
    )
      // child: Text(widget.imageUrl),
    );
  }
}
