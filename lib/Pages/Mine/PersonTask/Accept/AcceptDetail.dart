
import '../../../../models/task_model.dart';
import '../PerTaskAvartar.dart';
import '../PerTaskInfo.dart';
import 'package:flutter/material.dart';

// 任务详情页面
class AcceptDetailPage extends StatefulWidget {
  final TaskModel activeTask;
  AcceptDetailPage({
    Key? key,
    required this.activeTask,
  }) : super(key: key);

  @override
  State<AcceptDetailPage> createState() => _AcceptDetailPageState();
}

class _AcceptDetailPageState extends State<AcceptDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("任务详情")),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 头像+用户名+发布时间
            PerTaskAvatar(activeTask: widget.activeTask),
            // 任务信息：任务要求+任务图标+截止时间...
            Expanded(child: PerTaskInfo(activeTask: widget.activeTask)),
          ],
        ));
  }
}


