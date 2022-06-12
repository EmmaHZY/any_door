import 'package:any_door/adapt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../models/deal_model.dart';

// 任务详细信息：标签+标题+赏金数目+描述+任务图片+截止时间

class PubInfo extends StatefulWidget {
  final DealModel activeTask;
  PubInfo({Key? key, required this.activeTask}) : super(key: key);

  @override
  State<PubInfo> createState() => _PubInfoState();
}

class _PubInfoState extends State<PubInfo> {
  @override
  Widget build(BuildContext context) {

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
              // Card(
              //   child: Text("#" + widget.activeTask.tag - 1]),
              // ),
              // 任务标题
              Expanded(
                child: Text(
                  widget.activeTask.dealTitle,
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
              Text("${widget.activeTask.dealCoin}"),
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
            '交易状态：'+widget.activeTask.dealState,
            style: TextStyle(
              fontSize: Adapt.px(25.5),
            ),
          ),
          SizedBox(
            height: Adapt.px(31),
          ),
          // 任务内容
          Text(
            widget.activeTask.dealContent,
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
              widget.activeTask.dealImage,
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
