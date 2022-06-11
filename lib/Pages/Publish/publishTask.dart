import 'package:flutter/material.dart';

// 发布任务页面
class PublishTaskPage extends StatefulWidget {
  PublishTaskPage({Key? key}) : super(key: key);

  @override
  State<PublishTaskPage> createState() => _PublishTaskPageState();
}

class _PublishTaskPageState extends State<PublishTaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("发布任务")),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 头像+用户名+发布时间
            Text("发布任务页面")
            // Avatar(activeTask: widget.activeTask),
            // // 任务信息：任务要求+任务图标+截止时间...
            // Expanded(child: TaskInfo(activeTask: widget.activeTask)),
          ],
        ));
  }
}






