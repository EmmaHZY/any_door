// 在模拟器夜神adb.exe下cmd
//nox_adb.exe connect 127.0.0.1:62001连接虚拟机
// flutter run --no-sound-null-safety

// 任务页面
import 'dart:convert';
import 'dart:typed_data';

import 'package:any_door/account.dart';
import 'package:any_door/adapt.dart';
import 'package:any_door/models/deal_model.dart';
import 'package:any_door/models/task_model.dart';
import 'package:any_door/my_colors.dart';
import 'package:flutter/material.dart';
import '../../HttpTools.dart';
import 'DealDetailPage.dart';
import 'SearchDealBar.dart';

// 全部任务页面

class BookPage extends StatefulWidget {
  BookPage({Key? key}) : super(key: key);

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        toolbarHeight: Adapt.padTopH() + Adapt.px(31),
        backgroundColor: MyColors.mDealColor,
        elevation: 0,
        title: const SearchAppBar(hintLabel: "请输入要搜索的内容"),
      ),
      body: const BookHome(),
    );
  }
}

class BookHome extends StatelessWidget {
  const BookHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: <Widget>[
            // 猜你喜欢
            SizedBox(
              height: Adapt.px(62),
              child: Container(
                color: Colors.white,
                child: Container(
                  margin: EdgeInsets.fromLTRB(Adapt.px(31), 0, 20, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "书籍",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 94, 92, 92),
                        ),
                      ),
                    ],
                  ),
                ),
                alignment: Alignment.center,
              ),
            ),
            // 任务列表
            Container(
              height: Adapt.screenH() -
                  2 * Adapt.px(62) -
                  2 * Adapt.padTopH() - 20,
              child: BookList(),
            ),
          ],
        ),
      ],
    );
  }
}

class BookList extends StatefulWidget {
  BookList({Key? key}) : super(key: key);
  @override
  State<BookList> createState() => _BookListState();
}

class _BookListState extends State<BookList> {
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
                    activeDeals[index].publisherID + "   " + activeDeals[index].userName,
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

  void getdata() {
    // print("!!111:getdata-------");
    // 执行查看全部任务方法
    Future<Uint8List> back = NetUtils.getJsonBytes(
        'http://1.117.239.54:8080/trade?operation=getByTag&index=' +
            Account.account +
            '&key=2');
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

