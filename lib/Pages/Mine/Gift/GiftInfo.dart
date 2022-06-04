import 'package:any_door/adapt.dart';
import 'package:any_door/res/GiftData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 礼品详细信息：名称+库存+价格+描述+礼品图片+截止时间

class GiftInfo extends StatefulWidget {
  final int index;
  GiftInfo({Key? key, required this.index}) : super(key: key);

  @override
  State<GiftInfo> createState() => _GiftInfoState();
}

class _GiftInfoState extends State<GiftInfo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 礼品名称
              Expanded(
                child: Text(
                  GiftData[widget.index]["name"],
                  style: TextStyle(
                    fontSize: Adapt.px(30.5),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),

          // 库存
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 库存
                Text(
                  "库存："+GiftData[widget.index]["stock"],
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: Adapt.px(21)),
              ),
            ],
          ),
          // 礼品价格
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // 价格
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
              Text("${GiftData[widget.index]["price"]}"),
              SizedBox(
                width: Adapt.px(21),
              ),
            ],
          ),
          SizedBox(
            height: Adapt.px(31),
          ),
          // 礼品描述
          Text(
            GiftData[widget.index]["Content"],
            style: TextStyle(
              fontSize: Adapt.px(25.5),
            ),
          ),
          SizedBox(
            height: Adapt.px(31),
          ),
          // 礼品图片
          AspectRatio(
            aspectRatio: 14 / 14,
            child: Image.network(
              GiftData[widget.index]["Image"],
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
                "截止时间" + GiftData[widget.index]["deadline"],
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),

          // 兑换礼品按钮
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                  onPressed: () {
                    var dialog = CupertinoAlertDialog(
                      content:
                      Text("确定兑换？", style: TextStyle(fontSize: Adapt.px(31))),
                      actions: <Widget>[
                        CupertinoButton(
                            child: Text("取消"),
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                        CupertinoButton(
                            child: Text("确定"),
                            onPressed: () {
                              Navigator.pop(context);
                            })
                      ],
                    );
                    showDialog(context: context, builder: (_) => dialog);
                  },
                  child: Text("兑换")),
            ],
          )

        ],
      ),
    );
  }
}
