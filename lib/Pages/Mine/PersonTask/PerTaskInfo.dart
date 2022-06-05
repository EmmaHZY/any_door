import 'package:any_door/adapt.dart';
import 'package:any_door/res/listData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 任务详细信息：标签+标题+赏金数目+描述+任务图片+截止时间

class PerTaskInfo extends StatefulWidget {
  final int index;
  PerTaskInfo({Key? key, required this.index}) : super(key: key);

  @override
  State<PerTaskInfo> createState() => _PerTaskInfoState();
}

class _PerTaskInfoState extends State<PerTaskInfo> {
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
                child: Text("#" + tagList[listData[widget.index]["tag"] - 1]),
              ),
              // 任务标题
              Expanded(
                child: Text(
                  listData[widget.index]["taskTitle"],
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
              Text("${listData[widget.index]["taskCoin"]}"),
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
            '任务状态：'+listData[widget.index]["taskState"],
            style: TextStyle(
              fontSize: Adapt.px(25.5),
            ),
          ),
          SizedBox(
            height: Adapt.px(31),
          ),
          // 任务内容
          Text(
            listData[widget.index]["taskContent"],
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
              listData[widget.index]["taskImage"],
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
                "截止时间" + listData[widget.index]["deadline"],
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
          SizedBox(
            height: Adapt.px(31),
          ),
          Text(
            '接取者ID：'+listData[widget.index]["receiverID"],
            style: TextStyle(
              fontSize: Adapt.px(25.5),
            ),
          ),
          SizedBox(
            height: Adapt.px(31),
          ),
          // 接受任务按钮
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
          //     ElevatedButton(
          //         onPressed: () {
          //           var dialog = CupertinoAlertDialog(
          //             content:
          //             Text("确定接受？", style: TextStyle(fontSize: Adapt.px(31))),
          //             actions: <Widget>[
          //               CupertinoButton(
          //                   child: Text("取消"),
          //                   onPressed: () {
          //                     Navigator.pop(context);
          //                   }),
          //               CupertinoButton(
          //                   child: Text("确定"),
          //                   onPressed: () {
          //                     Navigator.pop(context);
          //                   })
          //             ],
          //           );
          //           showDialog(context: context, builder: (_) => dialog);
          //         },
          //         child: Text("接受")),
          //   ],
          // )

        ],
      ),
    );
  }
}
