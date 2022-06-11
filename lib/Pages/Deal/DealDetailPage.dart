import 'package:any_door/Pages/Deal/widget/DealAvatar.dart';
import 'package:any_door/Pages/Deal/widget/DealInfo.dart';
import 'package:any_door/models/deal_model.dart';
import 'package:any_door/my_colors.dart';
import 'package:flutter/material.dart';

// 交易详情页面
class DealDetailPage extends StatefulWidget {
  final DealModel activeDeal;
  DealDetailPage({
    Key? key,
    required this.activeDeal,
  }) : super(key: key);

  @override
  State<DealDetailPage> createState() => _DealDetailPageState();
}

class _DealDetailPageState extends State<DealDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("商品详情"),
          backgroundColor: MyColors.mDealColor,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 头像+用户名+发布时间
            // DealAvatar(index: widget.index),
            // 交易信息：商品要求+商品图标+截止时间...
            // Expanded(child: DealInfo(index: widget.index)),
          ],
        ));
  }
}
