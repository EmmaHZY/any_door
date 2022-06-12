import 'dart:convert';
import 'dart:typed_data';

import 'package:any_door/adapt.dart';
import 'package:any_door/res/listData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../HttpTools.dart';
import '../../../account.dart';
import '../../../models/task_model.dart';
import 'Released.dart';

// 任务详细信息：标签+标题+赏金数目+描述+任务图片+截止时间

class PerTaskInfo2 extends StatefulWidget {
  final TaskModel activeTask;
  PerTaskInfo2({Key? key, required this.activeTask}) : super(key: key);

  @override
  State<PerTaskInfo2> createState() => _PerTaskInfo2State();
}

class _PerTaskInfo2State extends State<PerTaskInfo2> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // 任务标签和标题
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 任务标签
              // Card(
              //   child: Text("#" + widget.activeTask.tag - 1]),
              // ),
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
          SizedBox(
            height: Adapt.px(31),
          ),
          Text(
            '接取者ID：'+widget.activeTask.receiverID,
            style: TextStyle(
              fontSize: Adapt.px(25.5),
            ),
          ),
          SizedBox(
            height: Adapt.px(31),
          ),

        ],
      ),
    );
  }

}
