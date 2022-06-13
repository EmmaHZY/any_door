import 'dart:convert';
import 'dart:typed_data';

import 'package:any_door/Pages/Mine/PersonTrade/Published.dart';
import 'package:any_door/adapt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../HttpTools.dart';
import '../../../../account.dart';
import '../../../../models/deal_model.dart';
import '../../../../my_colors.dart';
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
    List tagList = [
      "日用品",
      "书籍",
      "饮食",
      "其他",
    ];
    return Padding(
      padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 任务标签和标题
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 交易标签
              Card(
                child:
                Text("#" + tagList[int.parse(widget.activeTrade.tag) - 1]),
              ),
              // 交易标题
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // 金币数
              // 金币数
              Text("￥",
                  style: TextStyle(
                      fontSize: Adapt.px(25), color: MyColors.mDealColor)),

              SizedBox(
                width: Adapt.px(18),
              ),
              Text("${widget.activeTrade.dealPrice}",
                  style: TextStyle(
                      fontSize: Adapt.px(31),
                      fontWeight: FontWeight.bold,
                      color: MyColors.mDealColor)),
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
          Container(
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
      ));
  }

}
