
import 'PerTaskAvartar.dart';
import 'PerTaskInfo.dart';
import 'package:flutter/material.dart';

// 任务详情页面
class PerTaskDetailPage extends StatefulWidget {
  final int index;
  PerTaskDetailPage({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<PerTaskDetailPage> createState() => _PerTaskDetailPageState();
}

class _PerTaskDetailPageState extends State<PerTaskDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("任务详情")),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 头像+用户名+发布时间
            PerTaskAvatar(index: widget.index),
            // 任务信息：任务要求+任务图标+截止时间...
            Expanded(child: PerTaskInfo(index: widget.index)),
          ],
        ));
  }
}


