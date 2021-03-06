
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';

import '../../../../HttpTools.dart';
import '../../../../account.dart';
import '../../../../models/task_model.dart';
import '../PerTaskAvartar.dart';
import '../PerTaskInfo.dart';
import 'package:flutter/material.dart';

import '../PerTaskInfo2.dart';
import 'Ing.dart';

// 任务详情页面
class IngDetailPage extends StatefulWidget {
  final TaskModel activeTask;
  IngDetailPage({
    Key? key,
    required this.activeTask,
  }) : super(key: key);

  @override
  State<IngDetailPage> createState() => _IngDetailPageState();
}

class _IngDetailPageState extends State<IngDetailPage> {
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
            // Expanded(child: PerTaskInfo2(activeTask: widget.activeTask)),
            judge(),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     ElevatedButton(
            //         onPressed: () {
            //           showCupertinoDialog(
            //             //点击空白处取消
            //             barrierDismissible: true,
            //             context: context,
            //             builder: (context) {
            //               return CupertinoAlertDialog(
            //                 title: Text("提示"),
            //                 content: Text("确定已完成任务？"),
            //                 actions: [
            //                   CupertinoDialogAction(
            //                     child: Text("取消"),
            //                     onPressed: () {
            //                       Navigator.of(context).pop();
            //                     },
            //                   ),
            //                   CupertinoDialogAction(
            //                     child: Text("确定"),
            //                     onPressed: () {
            //                       // 接受任务接口
            //                       Navigator.of(context).pop();
            //                       String send = "{\"taskID\":\"" +
            //                           widget.activeTask.taskID.toString() +
            //                           "\"," +
            //                           "\"publisherID\":\"" +
            //                           Account.account +
            //                           "\"}";
            //                       print(send);
            //                       Future<Uint8List> back = NetUtils.putJsonBytes(
            //                           'http://1.117.239.54:8080/task?operation=cancel',
            //                           send);
            //                       back.then((value){
            //                         Map<String, dynamic> result = json.decode(utf8.decode(value)); //结果的map对象
            //                         print(result);
            //                         if(result["meta"]["status"] == "202")
            //                         {
            //                           showCupertinoDialog(
            //                               context: context,
            //                               builder: (BuildContext context){
            //                                 return CupertinoAlertDialog(
            //                                   title: const Text("提示"),
            //                                   content: const Text("完成任务成功"),
            //                                   actions: [
            //                                     FlatButton(onPressed: (() {
            //                                       Navigator.push(
            //                                           context,
            //                                           MaterialPageRoute(builder: (context){
            //                                             return IngPage();
            //                                           }));
            //                                     }), child: const Text("确定"))
            //                                   ],
            //                                 );
            //                               });
            //                         }
            //                         else{
            //                           showCupertinoDialog(
            //                               context: context,
            //                               builder: (BuildContext context){
            //                                 return CupertinoAlertDialog(
            //                                   title: const Text("提示"),
            //                                   content: const Text("完成任务失败，请重试"),
            //                                   actions: [
            //                                     FlatButton(onPressed: (() {
            //                                       Navigator.of(context).pop();
            //                                     }), child: const Text("确定"))
            //                                   ],
            //                                 );
            //                               });
            //                         }
            //                       });
            //
            //                     },
            //                   ),
            //                 ],
            //               );
            //             },
            //           );
            //         },
            //         child: Text("完成")),
            //     SizedBox(
            //       width: 15,
            //     )
            //   ],
            // ),
            // Container(
            //   height: 10,
            // )
          ],
        ));
  }

  Widget judge(){
    if(widget.activeTask.publisherID==Account.account)return Expanded(child: PerTaskInfo(activeTask: widget.activeTask));
    else return Expanded(child: PerTaskInfo2(activeTask: widget.activeTask));
  }
}


