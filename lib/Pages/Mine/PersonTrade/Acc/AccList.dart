import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:any_door/account.dart';

import '../../../../HttpTools.dart';
import '../../../../models/deal_model.dart';
import '../PubDetail.dart';
import 'package:any_door/adapt.dart';
import 'package:any_door/my_colors.dart';
import 'package:any_door/res/listData.dart';
import 'package:flutter/material.dart';

import 'AccDetail.dart';

// 礼品列表
class AccList extends StatefulWidget {
  AccList ({Key? key}) : super(key: key);

  @override
  State<AccList> createState() => _AccListState();
}

class _AccListState extends State<AccList> {

  var activeTrade = <DealModel>[];
  Widget _getListData(context, index) {

    return GestureDetector(
      onTap: (() => {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AccDetailPage(
              activeTrade: activeTrade[index],
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
                activeTrade[index].dealImage,  //这里应该是tag对应的图片，而不是任务图片
                fit: BoxFit.cover,
              ),
            ),
          ),
          // 任务标签
          Expanded(
            child: Text(
              activeTrade[index].dealTitle,
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
                      Text("交易状态：",style: TextStyle(fontSize: Adapt.px(19))),
                      Text(
                        activeTrade[index].dealState,
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
                        child: Image.asset(
                          "assets/coin.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: Adapt.px(15.5),
                      ),
                      Text("${activeTrade[index].dealPrice}",style: TextStyle(fontSize: Adapt.px(19))),
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
      itemCount: activeTrade.length,
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
    //log("hhhhh");
    Future<Uint8List> back = NetUtils.getJsonBytes(
        'http://1.117.239.54:8080/trade?operation=getByReceiverID&index='+Account.account+'&key=');
    //     Future<Uint8List> back = NetUtils.getJsonBytes(
    // 'http://1.117.239.54:8080/task?operation=getAll&index=&key=');
    back.then((value) {
      // print("!!!1111:handlingResult---------");
      Map<String, dynamic> result = json.decode(utf8.decode(value)); //结果的map对象
      // print(result);
      Iterable list = result["data"];
      // log(jsonEncode(result["data"][0]["price"]));
      // log(jsonEncode(list));
      activeTrade = list.map((model) => DealModel.fromMap(model)).toList();
      //log(jsonEncode(activeTask[0].taskCoin));
      // log((activeTask[0].price).toString());
      // 重新加载页面
      setState(() {
        // print("setstate");
      });
    });
  }
}


