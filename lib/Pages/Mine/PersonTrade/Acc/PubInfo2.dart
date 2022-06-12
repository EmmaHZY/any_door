import 'dart:convert';
import 'dart:typed_data';

import 'package:any_door/Pages/Mine/PersonTrade/Published.dart';
import 'package:any_door/adapt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../HttpTools.dart';
import '../../../../account.dart';
import '../../../../models/deal_model.dart';
import '../../Other/OtherPage.dart';

// 任务详细信息：标签+标题+赏金数目+描述+任务图片+截止时间

class PubInfo2 extends StatefulWidget {
  final DealModel activeTrade;
  PubInfo2({Key? key, required this.activeTrade}) : super(key: key);

  @override
  State<PubInfo2> createState() => _PubInfo2State();
}

class _PubInfo2State extends State<PubInfo2> {
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
                  widget.activeTrade.dealTitle,
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
              Text("${widget.activeTrade.dealPrice}"),
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
            '交易状态：'+widget.activeTrade.dealState,
            style: TextStyle(
              fontSize: Adapt.px(25.5),
            ),
          ),
          SizedBox(
            height: Adapt.px(31),
          ),
          // 任务内容
          Text(
            widget.activeTrade.dealContent,
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
              widget.activeTrade.dealImage,
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
                "截止时间" + widget.activeTrade.deadline,
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
                    "接取者ID："+ widget.activeTrade.receiverID,
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {
                    if(widget.activeTrade.receiverID!=Account.account&&widget.activeTrade.receiverID!='暂无接收者')
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              OtherPage(userID: widget.activeTrade.receiverID)));
                  },
                ),
              ],
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
