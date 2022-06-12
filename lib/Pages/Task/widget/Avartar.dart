import 'package:any_door/Pages/Mine/Other/OtherPage.dart';
import 'package:any_door/models/task_model.dart';
import 'package:flutter/material.dart';

// 头像+用户名+发布时间

class Avatar extends StatefulWidget {
  final TaskModel activeTask;
  Avatar({Key? key, required this.activeTask}) : super(key: key);

  @override
  State<Avatar> createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() => {
            // 跳转
            // print("跳转啦"),
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    OtherPage(userID: widget.activeTask.publisherID)))
          }),
      child: Container(
          child: ListTile(
        leading: CircleAvatar(
            backgroundImage: NetworkImage(widget.activeTask.personImage)),
        title: Text(
          widget.activeTask.publisherID + "   " + widget.activeTask.username,
        ),
        subtitle: Text("发布于" + widget.activeTask.publishTime),
      )
          // child: Text(widget.imageUrl),
          ),
    );
  }
}
