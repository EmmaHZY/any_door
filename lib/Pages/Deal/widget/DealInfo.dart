import 'dart:convert';
import 'dart:typed_data';

import 'package:any_door/HttpTools.dart';
import 'package:any_door/Pages/Deal/DealPage.dart';
import 'package:any_door/account.dart';
import 'package:any_door/adapt.dart';
import 'package:any_door/models/deal_model.dart';
import 'package:any_door/my_colors.dart';
import 'package:any_door/res/dealListData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 交易详细信息：标签+标题+物品金额+描述+交易图片+截止时间

class DealInfo extends StatefulWidget {
  final DealModel activeDeal;
  DealInfo({Key? key, required this.activeDeal}) : super(key: key);

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
                child: Text("#" + tagList[int.parse(widget.activeDeal.tag) - 1]),
              ),
              // 交易标题
              Expanded(
                child: Text(
                  widget.activeDeal.dealTitle,
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
              Text("${widget.activeDeal.dealPrice}",
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
            widget.activeDeal.dealContent,
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
              widget.activeDeal.dealImage,
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
                "截止时间" + widget.activeDeal.deadline,
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
                    showCupertinoDialog(
                      //点击空白处取消
                      barrierDismissible: true,
                      context: context,
                      builder: (context) {
                        return CupertinoAlertDialog(
                          title: Text("提示"),
                          content: Text("确定接取此交易？"),
                          actions: [
                            CupertinoDialogAction(
                              child: Text("取消"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            CupertinoDialogAction(
                              child: Text("确定"),
                              onPressed: () {
                                // 接取交易接口
                                Navigator.of(context).pop();
                                String send = "{\"tradeID\":\"" +
                                    widget.activeDeal.dealID.toString() +
                                    "\"," +
                                    "\"receiverID\":\"" +
                                    Account.account +
                                    "\"}";
                                print(send);
                                Future<Uint8List> back = NetUtils.putJsonBytes(
                                    'http://1.117.239.54:8080/trade?operation=accept',
                                    send);
                                back.then((value){
                                  Map<String, dynamic> result = json.decode(utf8.decode(value)); //结果的map对象
                                  print(result);
                                  if(result["meta"]["status"] == "202")
                                  {
                                    showCupertinoDialog(
                                      context: context, 
                                      builder: (BuildContext context){
                                        return CupertinoAlertDialog(
                                          title: const Text("提示"),
                                          content: const Text("接取交易成功"),
                                          actions: [
                                            FlatButton(onPressed: (() {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context){
                                                  return const DealPage();
                                                }));
                                            }), child: const Text("确定"))
                                          ],
                                        );
                                      });
                                  }
                                  else{
                                    showCupertinoDialog(
                                      context: context, 
                                      builder: (BuildContext context){
                                        return CupertinoAlertDialog(
                                          title: const Text("提示"),
                                          content: const Text("接取交易失败，请重试"),
                                          actions: [
                                            FlatButton(onPressed: (() {
                                               Navigator.of(context).pop();
                                            }), child: const Text("确定"))
                                          ],
                                        );
                                      });
                                  }
                                });

                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text("接取")),
            ],
          )
        ],
      ),
    );
  }
}
