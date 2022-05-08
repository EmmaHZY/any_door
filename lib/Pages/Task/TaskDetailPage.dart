import 'package:any_door/Pages/Task/widget/Avartar.dart';
import 'package:any_door/Pages/Task/widget/TaskInfo.dart';
import 'package:flutter/material.dart';

// 任务详情页面
class TaskDetailPage extends StatefulWidget {
  final int index;
  TaskDetailPage({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<TaskDetailPage> createState() => _TaskDetailPageState();
}

class _TaskDetailPageState extends State<TaskDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("任务详情")),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 头像+用户名+发布时间
            Avatar(index: widget.index),
            // 任务信息：任务要求+任务图标+截止时间...
            Expanded(child: TaskInfo(index: widget.index)),
          ],
        ));
  }
}


