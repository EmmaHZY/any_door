import 'dart:convert';
import 'dart:typed_data';

import 'package:any_door/HttpTools.dart';
import 'package:any_door/account.dart';
import 'package:any_door/adapt.dart';
import 'package:any_door/models/deal_model.dart';
import 'package:any_door/my_colors.dart';
import 'package:flutter/material.dart';

import 'DealDetailPage.dart';

class DealSearch extends StatefulWidget {
  final String content;
  DealSearch({Key? key, required this.content}) : super(key: key);

  @override
  State<DealSearch> createState() => _DealSearchState();
}

class _DealSearchState extends State<DealSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.content + "   的搜索结果：",
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
          backgroundColor: MyColors.mDealColor,
        ),
        body: Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              height: Adapt.screenH() -
                  2 * Adapt.px(62) -
                  Adapt.px(186) -
                  2 * Adapt.padTopH() -
                  90 -
                  3 * Adapt.padBotH(),
              child: DealSearchBody(content: widget.content),
            ),
          ],
        ));
  }
}

class DealSearchBody extends StatefulWidget {
  final String content;
  DealSearchBody({Key? key, required this.content}) : super(key: key);

  @override
  State<DealSearchBody> createState() => _DealSearchBodyState();
}

class _DealSearchBodyState extends State<DealSearchBody> {
  var activeDeals = <DealModel>[];
  Widget _getListData(context, index) {
    // print("_getlistData----------");
    return GestureDetector(
      onTap: (() => {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DealDetailPage(
                      activeDeal: activeDeals[index],
                    )))
          }),
      child: Card(
        color: MyColors.mDealColorLight,
        child: Column(children: <Widget>[
          // 交易图片
          Expanded(
            flex: 4,
            child: AspectRatio(
              aspectRatio: 14 / 9,
              child: Image.network(
                activeDeals[index].dealImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // 交易标题
          Expanded(
            child: Text(
              activeDeals[index].dealTitle,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: Adapt.px(25)),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          // 交易价格
          Expanded(
            child: Container(
              margin: EdgeInsets.fromLTRB(Adapt.px(15.5), 0, 0, 0),
              child: Row(
                children: [
                  Text(
                    "￥",
                    style: TextStyle(
                      fontSize: Adapt.px(25),
                      color: MyColors.mDealColor,
                    ),
                  ),
                  SizedBox(
                    width: Adapt.px(5.5),
                  ),
                  Text("${activeDeals[index].dealPrice}",
                      style: TextStyle(
                        fontSize: Adapt.px(31),
                        fontWeight: FontWeight.bold,
                        color: MyColors.mDealColor,
                      )),
                ],
              ),
            ),
          ),
          // 头像
          // 用户名
          Expanded(
            child: Container(
              margin: EdgeInsets.fromLTRB(Adapt.px(15.5), 0, 0, 0),
              height: Adapt.px(36.5),
              child: Row(
                children: [
                  Container(
                    width: Adapt.px(41),
                    height: Adapt.px(41),
                    // width: 20,
                    // height: 20,
                    child: CircleAvatar(
                        backgroundImage:
                            NetworkImage(activeDeals[index].personImage)),
                  ),
                  SizedBox(
                    width: Adapt.px(18),
                  ),
                  Text(
                    activeDeals[index].userName,
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: Adapt.px(19)),
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
  void initState() {
    // print("initstate");
    getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (activeDeals.isEmpty) {
      return const Center(
        child: Text(
          "抱歉，没有搜索到相关内容",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      );
    } else {
      return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 5.0,
          mainAxisSpacing: 5.0,
          crossAxisCount: 2,
        ),
        itemCount: activeDeals.length,
        itemBuilder: _getListData,
      );
    }
  }

  void getdata() {
    // print("!!111:getdata-------r");
    // 执行查看全部任务方法
    Future<Uint8List> back = NetUtils.getJsonBytes(
        'http://1.117.239.54:8080/trade?operation=getByOtherPublisherID&index=' +
            widget.content +
            '&key=');
    back.then((value) {
      // print("!!!1111:handlingResult---------");
      Map<String, dynamic> result = json.decode(utf8.decode(value)); //结果的map对象
      print(result);
      Iterable list = result["data"];
      activeDeals = list.map((model) => DealModel.fromMap(model)).toList();
      // 重新加载页面
      setState(() {
        // print("setstate");
      });
    });
  }
}
