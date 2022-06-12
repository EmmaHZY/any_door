
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';

import '../../../../HttpTools.dart';
import '../../../../account.dart';
import '../../../../models/deal_model.dart';
import '../PubAvartar.dart';
import '../PubInfo.dart';
import 'package:flutter/material.dart';


// 任务详情页面
class AccDetailPage extends StatefulWidget {
  final DealModel activeTrade;
  AccDetailPage({
    Key? key,
    required this.activeTrade,
  }) : super(key: key);

  @override
  State<AccDetailPage> createState() => _AccDetailPageState();
}

class _AccDetailPageState extends State<AccDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("交易详情")),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 头像+用户名+发布时间
            PubAvatar(activeTrade: widget.activeTrade),
            // 任务信息：任务要求+任务图标+截止时间...
            Expanded(child: PubInfo(activeTrade: widget.activeTrade)),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 15,
                )
              ],
            ),
            Container(
              height: 110,
            )
          ],
        ));
  }
}


