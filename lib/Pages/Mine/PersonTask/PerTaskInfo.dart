import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:any_door/adapt.dart';
import 'package:any_door/res/listData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../HttpTools.dart';
import '../../../account.dart';
import '../../../models/task_model.dart';
import '../../../my_colors.dart';
import '../Other/OtherPage.dart';
import 'Released.dart';

// 任务详细信息：标签+标题+赏金数目+描述+任务图片+截止时间

class PerTaskInfo extends StatefulWidget {
  final TaskModel activeTask;
  PerTaskInfo({Key? key, required this.activeTask}) : super(key: key);

  @override
  State<PerTaskInfo> createState() => _PerTaskInfoState();
}

class _PerTaskInfoState extends State<PerTaskInfo> {
  int _part = 0;//记录tag的选择
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
    child: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
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
          // 任务状态
          Text(
            '任务状态：'+widget.activeTask.taskState,
            style: TextStyle(
              fontSize: Adapt.px(25.5),
            ),
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
          Container(
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
          SizedBox(
            height: Adapt.px(31),
          ),
          Container(
            child: Row(
              children: [
                TextButton(
                  child: Text(
                      "接取者ID："+ widget.activeTask.receiverID,
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {
                    if(widget.activeTask.receiverID!=Account.account&&widget.activeTask.receiverID!='暂无接收者')
                      Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                      OtherPage(userID: widget.activeTask.receiverID)));
                  },
                ),
              ],
            ),
          ),
          // Text(
          //   '接取者ID：'+widget.activeTask.receiverID,
          //   style: TextStyle(
          //     fontSize: Adapt.px(25.5),
          //   ),
          // ),
          SizedBox(
            height: Adapt.px(21),
          ),
          _Button(),
        ],
      ),
     )
    );
  }

  Widget _Button(){
    if(widget.activeTask.taskState=='待接收') {
      return Container(
        // color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              child:Row(
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
                              content: Text("确定撤销此任务？"),
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
                                        "\"publisherID\":\"" +
                                        Account.account +
                                        "\"}";
                                    print(send);
                                    Future<Uint8List> back = NetUtils.putJsonBytes(
                                        'http://1.117.239.54:8080/task?operation=cancel',
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
                                                content: const Text("撤销任务成功"),
                                                actions: [
                                                  FlatButton(onPressed: (() {
                                                    Navigator.pop(context,true);
                                                    Navigator.pop(context,true);
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
                                                content: const Text("撤销任务失败，请重试"),
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
                      child: Text("撤销")),//撤销按钮
                  SizedBox(
                    width: 10,
                  )
                ],
              ),
            )
          ]
        )
    );
    }
    else if(widget.activeTask.taskState=='进行中') {
      return Container(
        // color: Colors.white,
        child: Column(
            children: <Widget>[
              Text(
                '请为本次任务接受者评分',
                style: TextStyle(
                  fontSize: Adapt.px(25.5),
                ),
              ),
              SizedBox(
                height: Adapt.px(31),
              ),
              Container(
                // alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 25),
                  child: Row(
                    children: [
                      Radio(
                          value: 1,
                          groupValue: _part,
                          activeColor: MyColors.mPrimaryColor,
                          onChanged: (value) {
                            debugPrint(value.toString());
                            setState(() {
                              _part = 1;
                            });
                          }),
                      const Text("1"),
                      Radio(
                          value: 2,
                          groupValue: _part,
                          activeColor: MyColors.mPrimaryColor,
                          onChanged: (value) {
                            debugPrint(value.toString());
                            setState(() {
                              _part = 2;
                            });
                          }),
                      const Text("2"),
                      Radio(
                          value: 3,
                          groupValue: _part,
                          activeColor: MyColors.mPrimaryColor,
                          onChanged: (value) {
                            debugPrint(value.toString());
                            setState(() {
                              _part = 3;
                            });
                          }),
                      const Text("3"),
                      Radio(
                          value: 4,
                          groupValue: _part,
                          activeColor: MyColors.mPrimaryColor,
                          onChanged: (value) {
                            debugPrint(value.toString());
                            setState(() {
                              _part = 4;
                            });
                          }),
                      const Text("4"),
                      Radio(
                          value: 5,
                          groupValue: _part,
                          activeColor: MyColors.mPrimaryColor,
                          onChanged: (value) {
                            debugPrint(value.toString());
                            setState(() {
                              _part = 5;
                            });
                          }),
                      const Text("5"),
                    ],
                  )
              ),
              Container(
                child: Row(
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
                                content: Text("确定撤销此任务？"),
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
                                          "\"publisherID\":\"" +
                                          Account.account +
                                          "\"}";
                                      print(send);
                                      Future<Uint8List> back = NetUtils.putJsonBytes(
                                          'http://1.117.239.54:8080/task?operation=cancel',
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
                                                  content: const Text("撤销任务成功"),
                                                  actions: [
                                                    FlatButton(onPressed: (() {
                                                      Navigator.pop(context,true);
                                                      Navigator.pop(context,true);
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
                                                  content: const Text("撤销任务失败，请重试"),
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
                        child: Text("撤销")),//撤销按钮
                    SizedBox(
                      width: 15,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          log(_part.toString());
                          showCupertinoDialog(
                            //点击空白处取消
                            barrierDismissible: true,
                            context: context,
                            builder: (context) {
                              return CupertinoAlertDialog(
                                title: Text("提示"),
                                content: Text("确定此任务已完成？"),
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
                                      // 完成任务接口
                                      if(_part==0){
                                        showCupertinoDialog(
                                            context: context,
                                            builder: (BuildContext context){
                                              return CupertinoAlertDialog(
                                                title: const Text("提示"),
                                                content: const Text("请完成评分"),
                                                actions: [
                                                  FlatButton(onPressed: (() {
                                                    Navigator.of(context).pop();
                                                    Navigator.of(context).pop();
                                                  }), child: const Text("确定"))
                                                ],
                                              );
                                            });
                                      }
                                      else {
                                        Navigator.of(context).pop();
                                        String send = "{\"taskID\":\"" +
                                            widget.activeTask.taskID.toString() +
                                            "\"," +
                                            "\"score\":\"" +
                                            _part.toString() +
                                            "\"}";
                                        Future<Uint8List> back = NetUtils.putJsonBytes(
                                            'http://1.117.239.54:8080/task?operation=finish',
                                            send);
                                        back.then((value){
                                          Map<String, dynamic> result = json.decode(utf8.decode(value)); //结果的map对象

                                          if(result["meta"]["status"] == "202")
                                          {
                                            showCupertinoDialog(
                                                context: context,
                                                builder: (BuildContext context){
                                                  return CupertinoAlertDialog(
                                                    title: const Text("提示"),
                                                    content: const Text("完成任务成功"),
                                                    actions: [
                                                      FlatButton(onPressed: (() {
                                                        Navigator.pop(context,true);
                                                        Navigator.pop(context,true);
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
                                                    content: const Text("完成任务失败，请重试"),
                                                    actions: [
                                                      FlatButton(onPressed: (() {
                                                        Navigator.of(context).pop();
                                                      }), child: const Text("确定"))
                                                    ],
                                                  );
                                                });
                                          }
                                        });
                                      }


                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Text("完成")),//完成按钮
                  ],
                ),
              )
            ]
        )
    );
    }
    else {
      return Container(
        color: Colors.white,
      );
    }
  }
}
