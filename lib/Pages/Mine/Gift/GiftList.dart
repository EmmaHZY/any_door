import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:any_door/account.dart';

import '../../../HttpTools.dart';
import '../../../models/gift_Model.dart';
import '../../../models/task_model.dart';
import 'GiftDetail.dart';
import 'package:any_door/adapt.dart';
import 'package:any_door/my_colors.dart';
import 'package:any_door/res/listData.dart';
import 'package:flutter/material.dart';

// 礼品列表
class GiftList extends StatefulWidget {
  GiftList({Key? key}) : super(key: key);

  @override
  State<GiftList> createState() => _GiftListState();
}

class _GiftListState extends State<GiftList> {

  var activeGift = <GiftModel>[];
  Widget _getListData(context, index) {
    return GestureDetector(
      onTap: (() => {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => GiftDetailPage(
              activeGift: activeGift[index],
            )))
      }),
      child: Card(
        color: Colors.white,
        child: Column(children: <Widget>[
          // 任务标签图片
          Expanded(
            flex: 4,
            child: AspectRatio(
              aspectRatio: 14 / 9,
              child: Image.network(
                activeGift[index].giftImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // 任务标签
          Expanded(
            child: Text(
              activeGift[index].giftName,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: Adapt.px(25)),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          // 状态+金额
          Expanded(
            child: Container(
              margin: EdgeInsets.all(Adapt.px(15.5)),
              height: Adapt.px(36.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      // 状态
                      Text("库存：",style: TextStyle(fontSize: Adapt.px(19))),
                      Text(
                        activeGift[index].storage.toString(),
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: Adapt.px(19)),
                      ),
                    ],
                  ),
                  // 金额
                  Row(
                    children: [
                      // 金额
                      Container(
                        width: Adapt.px(31),
                        height: Adapt.px(31),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        ),
                        // width: 20,
                        // height: 20,
                        // child: Image.asset(
                        //   "assets/coin.png",
                        //   fit: BoxFit.cover,
                        // ),
                      ),
                      SizedBox(
                        width: Adapt.px(15.5),
                      ),
                      Text("￥ "+"${activeGift[index].giftPrice.toString()}",style: TextStyle(fontSize: Adapt.px(19))),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Expanded(child: child),

          // SizedBox(height: Adapt.px(15.5)),
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
        crossAxisCount: 2,
      ),
      itemCount: activeGift.length,
      itemBuilder: _getListData,
    );
  }

  @override
  void initState(){
    // print("initstate");
    getdata();
    super.initState();
  }

  void getdata(){
    //print("!!111:getdata-------");
    // 执行查看全部任务方法
    Future<Uint8List> back = NetUtils.getJsonBytes(
        'http://1.117.239.54:8080/gift');
    //     Future<Uint8List> back = NetUtils.getJsonBytes(
    // 'http://1.117.239.54:8080/task?operation=getAll&index=&key=');
    back.then((value) {
      // print("!!!1111:handlingResult---------");
      Map<String, dynamic> result = json.decode(utf8.decode(value)); //结果的map对象
      // print(result);
      Iterable list = result["data"];
      activeGift = list.map((model) => GiftModel.fromMap(model)).toList();
      // 重新加载页面
      //log("hhh");
      setState(() {
        // print("setstate");
      });
    });
  }
}


