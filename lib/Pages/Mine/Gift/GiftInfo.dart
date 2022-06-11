import 'dart:convert';
import 'dart:typed_data';

import 'package:any_door/adapt.dart';
import 'package:any_door/res/GiftData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../HttpTools.dart';
import '../../../account.dart';
import '../../../models/gift_Model.dart';
import 'MineGift.dart';

// 礼品详细信息：名称+库存+价格+描述+礼品图片+截止时间

class GiftInfo extends StatefulWidget {
  final GiftModel activeTask;
  GiftInfo({Key? key, required this.activeTask}) : super(key: key);

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
                  widget.activeTask.giftName,
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
                  "库存："+widget.activeTask.storage.toString(),
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
              Text("${widget.activeTask.giftPrice.toString()}"),
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
            widget.activeTask.giftIntroduction,
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
              widget.activeTask.giftImage,
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
                "截止时间" + widget.activeTask.downTime,
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
                    showCupertinoDialog(
                      //点击空白处取消
                      barrierDismissible: true,
                      context: context,
                      builder: (context) {
                        return CupertinoAlertDialog(
                          title: Text("提示"),
                          content: Text("确定兑换此礼品？"),
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
                                // 接受任务接口
                                Navigator.of(context).pop();
                                String send = "";
                                print(send);
                                Future<Uint8List> back = NetUtils.putJsonBytes(
                                    'http://1.117.239.54:8080/gift?giftID='+widget.activeTask.giftID.toString()+'&userID='+Account.account,
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
                                            content: const Text("兑换礼品成功"),
                                            actions: [
                                              FlatButton(onPressed: (() {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(builder: (context){
                                                      return MineGiftPage();
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
                                            content: const Text("兑换礼品失败，请重试"),
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
                  child: Text("兑换")),
            ],
          )

        ],
      ),
    );
  }
}
