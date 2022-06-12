import 'dart:convert';
import 'dart:typed_data';

import 'package:any_door/Pages/Task/TaskPage.dart';
import 'package:any_door/account.dart';
import 'package:any_door/adapt.dart';
import 'package:any_door/models/task_model.dart';
import 'package:any_door/res/listData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../HttpTools.dart';

// 任务详细信息：标签+标题+赏金数目+描述+任务图片+截止时间

class TaskInfo extends StatefulWidget {
  final TaskModel activeTask;
  TaskInfo({Key? key, required this.activeTask}) : super(key: key);

  @override
  State<TaskInfo> createState() => _TaskInfoState();
}

class _TaskInfoState extends State<TaskInfo> {
  @override
  Widget build(BuildContext context) {
    List tagList = [
      "跑腿",
      "学习",
      "娱乐",
      "其他",
    ];
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 任务标签和标题
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 任务标签
              Card(
                child: Text("#" + tagList[int.parse(widget.activeTask.tag) - 1]),
              ),
              // 任务标题
              Expanded(
                child: Text(
                  widget.activeTask.taskTitle,
                  style: TextStyle(
                    fontSize: Adapt.px(30.5),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
          // 任务赏金
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // 金币数
              Container(
                width: Adapt.px(31),
                height: Adapt.px(31),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                ),
                child: Image.asset(
                  "assets/coin.png",
                  fit: BoxFit.cover,
                ),
              ),

              SizedBox(
                width: Adapt.px(21),
              ),
              Text("${widget.activeTask.price}"),
              SizedBox(
                width: Adapt.px(21),
              ),
            ],
          ),
          SizedBox(
            height: Adapt.px(31),
          ),
          // 任务内容
          Text(
            widget.activeTask.taskContent,
            style: TextStyle(
              fontSize: Adapt.px(25.5),
            ),
          ),
          SizedBox(
            height: Adapt.px(31),
          ),
          // 任务图片
          AspectRatio(
            aspectRatio: 14 / 9,
            child: Image.network(
              widget.activeTask.taskImage,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: Adapt.px(31),
          ),
          // 截止时间
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "截止时间" + widget.activeTask.deadline,
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),

          // 接受任务按钮
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                  onPressed: () {
                    showCupertinoDialog(
                      //点击空白处取消
                      barrierDismissible: true,
                      context: context,
                      builder: (context) {
                        return CupertinoAlertDialog(
                          title: Text("提示"),
                          content: Text("确定接受此任务？"),
                          actions: [
                            CupertinoDialogAction(
                              child: Text("取消"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            CupertinoDialogAction(
                              child: Text("确定"),
                              onPressed: () {
                                // 接受任务接口
                                Navigator.of(context).pop();
                                String send = "{\"taskID\":\"" +
                                    widget.activeTask.taskID.toString() +
                                    "\"," +
                                    "\"receiverID\":\"" +
                                    Account.account +
                                    "\"}";
                                print(send);
                                Future<Uint8List> back = NetUtils.putJsonBytes(
                                    'http://1.117.239.54:8080/task?operation=accept',
                                    send);
                                back.then((value){
                                  Map<String, dynamic> result = json.decode(utf8.decode(value)); //结果的map对象
                                  print(result);
                                  if(result["meta"]["status"] == "202")
                                  {
                                    showCupertinoDialog(
                                      context: context, 
                                      builder: (BuildContext context){
                                        return CupertinoAlertDialog(
                                          title: const Text("提示"),
                                          content: const Text("接受任务成功"),
                                          actions: [
                                            FlatButton(onPressed: (() {
                                               Navigator.of(context).pop();
                                               Navigator.of(context).pop();
                                            }), child: const Text("确定"))
                                          ],
                                        );
                                      });
                                  }
                                  else{
                                    showCupertinoDialog(
                                      context: context, 
                                      builder: (BuildContext context){
                                        return CupertinoAlertDialog(
                                          title: const Text("提示"),
                                          content: const Text("接受任务失败，请重试"),
                                          actions: [
                                            FlatButton(onPressed: (() {
                                               Navigator.of(context).pop();
                                            }), child: const Text("确定"))
                                          ],
                                        );
                                      });
                                  }
                                });

                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text("接受")),
            ],
          )
        ],
      ),
    );
  }
}
