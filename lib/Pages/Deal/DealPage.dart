// 在模拟器夜神adb.exe下cmd
//nox_adb.exe connect 127.0.0.1:62001连接虚拟机
// flutter run --no-sound-null-safety



// 交易页面
import 'package:any_door/Pages/Deal/widget/DealList.dart';
import 'package:any_door/Pages/Deal/widget/DealTag.dart';
import 'package:any_door/adapt.dart';
import 'package:any_door/my_colors.dart';
import 'package:flutter/material.dart';

import 'SearchDealBar.dart';


// 交易主页
class DealPage extends StatefulWidget {
  const DealPage({Key? key}) : super(key: key);
  @override
  State<DealPage> createState() => _DealPageState();
}

class _DealPageState extends State<DealPage> {
  @override
  Widget build(BuildContext context) {
    // getdata();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, //去掉leading位置的返回箭头
        titleSpacing: 0,
        toolbarHeight: Adapt.padTopH() + Adapt.px(31),
        backgroundColor: MyColors.mDealColor,
        elevation: 0,
        title: const SearchAppBar(hintLabel: "请输入要搜索的内容"),
      ),
      body: const DealHome(),
    );
  }
}

class DealHome extends StatelessWidget {
  const DealHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: <Widget>[
            // 分类标签
            SizedBox(
              height: Adapt.px(62),
              child: Container(
                child: Container(
                  margin: EdgeInsets.fromLTRB(Adapt.px(31), 0, 0, 0),
                  child: const Text(
                    "分类标签",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 94, 92, 92),
                    ),
                  ),
                ),
                alignment: Alignment.centerLeft,
                color: Colors.white,
              ),
            ),

            // 标签
            Container(
              height: Adapt.px(186),
              child: DealTag(),
            ),

            // 闲置好物
            SizedBox(
              height: Adapt.px(62),
              child: Container(
                color: Colors.white,
                child: Container(
                  margin: EdgeInsets.fromLTRB(Adapt.px(31), 0, 20, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "闲置好物",
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

            // 商品列表
            Container(
              height: Adapt.screenH() -
                  2 * Adapt.px(62) -
                  Adapt.px(186) -
                  2 * Adapt.padTopH() -
                  90 -
                  3 * Adapt.padBotH(),
              child: DealList(),
            ),
            // TaskList(),
            // Container(
            //   child: Text("${listData[1]["tag"]}"),
            // )
          ],
        ),
      ],
    );
  }
}







