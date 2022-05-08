import 'package:any_door/adapt.dart';
import 'package:any_door/my_colors.dart';
import 'package:any_door/res/dealListData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 交易详细信息：标签+标题+物品金额+描述+交易图片+截止时间

class DealInfo extends StatefulWidget {
  final int index;
  DealInfo({Key? key, required this.index}) : super(key: key);

  @override
  State<DealInfo> createState() => _DealInfoState();
}

class _DealInfoState extends State<DealInfo> {
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 交易标签和标题
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 交易标签
              Card(
                child: Text("#" + tagList[listData[widget.index]["tag"] - 1]),
              ),
              // 交易标题
              Expanded(
                child: Text(
                  listData[widget.index]["dealTitle"],
                  style: TextStyle(
                    fontSize: Adapt.px(30.5),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: Adapt.px(31),
          ),
          // 商品价格
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // 交易价格
              Text("￥",
                  style: TextStyle(
                    fontSize: Adapt.px(25),
                    color: MyColors.mDealColor
                  )),

              SizedBox(
                width: Adapt.px(18),
              ),
              Text("${listData[widget.index]["dealPrice"]}",
                  style: TextStyle(
                    fontSize: Adapt.px(31),
                    fontWeight: FontWeight.bold,
                    color: MyColors.mDealColor
                  )),
              SizedBox(
                width: Adapt.px(21),
              ),
            ],
          ),
          SizedBox(
            height: Adapt.px(31),
          ),
          // 交易商品详情
          Text(
            listData[widget.index]["dealContent"],
            style: TextStyle(
              fontSize: Adapt.px(25.5),
            ),
          ),
          SizedBox(
            height: Adapt.px(31),
          ),
          // 商品图片
          AspectRatio(
            aspectRatio: 14 / 9,
            child: Image.network(
              listData[widget.index]["dealImage"],
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

          // 接取交易按钮
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: MyColors.mDealColor
                ),
                onPressed: () {
                  var dialog = CupertinoAlertDialog(
                    content:
                        Text("确定购买？", style: TextStyle(fontSize: Adapt.px(31))),
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
                child: Text("购买")),
            ],
          ),
        ],
      ),
    );
  }
}
