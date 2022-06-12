
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';

import '../../../HttpTools.dart';
import '../../../account.dart';
import '../../../models/task_model.dart';
import 'PerTaskAvartar.dart';
import 'PerTaskInfo.dart';
import 'package:flutter/material.dart';

import 'Released.dart';

// 任务详情页面
class PerTaskDetailPage extends StatefulWidget {
  final TaskModel activeTask;
  PerTaskDetailPage({
    Key? key,
    required this.activeTask,
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
            PerTaskAvatar(activeTask: widget.activeTask),
            // 任务信息：任务要求+任务图标+截止时间...
            Expanded(child: PerTaskInfo(activeTask: widget.activeTask)),
          ],
        ));
  }

}


