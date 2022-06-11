
import 'GiftInfo.dart';
import 'package:flutter/material.dart';

// 礼品详情页面
class GiftDetailPage extends StatefulWidget {
  final int index;
  GiftDetailPage({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<GiftDetailPage> createState() => _GiftDetailPageState();
}

class _GiftDetailPageState extends State<GiftDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("礼品详情")),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 礼品信息：礼品要求+礼品图标+截止时间...
            Expanded(child: GiftInfo(index: widget.index)),
          ],
        ));
  }
}


