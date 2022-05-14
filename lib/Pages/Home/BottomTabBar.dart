import 'package:flutter/material.dart';
import 'package:any_door/my_colors.dart';

import 'package:any_door/Pages/Task/TaskPage.dart';
import 'package:any_door/Pages/Deal/DealPage.dart';
import 'package:any_door/Pages/Publish/PublishPage.dart';
import 'package:any_door/Pages/Message/MessagePage.dart';
import 'package:any_door/Pages/Mine/MinePage.dart';


class BottomTabBar extends StatefulWidget {
  const BottomTabBar({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<StatefulWidget> createState() {
    return _BottomTabBarState();
  }
}

class _BottomTabBarState extends State<BottomTabBar> {
  int currentIndex = 0;
  List pageList = [const TaskPage(), const DealPage(), const PublishPage(),
                   const MessagePage(title: 'title',), const MinePage()];

  _onAdd(){//悬浮按钮的点击事件
    setState(() {
      currentIndex = 0;//发布背景是首页
      showModalBottomSheet(//底部弹窗
        barrierColor: Colors.black54,
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30))),
        builder: (ln) {
          return Container(
            height: 400,
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: const PublishPage(),
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[currentIndex],
      floatingActionButton: Container(//中心悬浮
        height: 70,
        width: 70,
        padding: const EdgeInsets.all(8),
        //设置：内边距8
        margin: const EdgeInsets.only(top: 2),
        //设置：外边距2
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40), color: Colors.white),
        child: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: _onAdd,
            backgroundColor: currentIndex == 2
                ? MyColors.mPrimaryColor
                : Colors.grey //利用三目运算符，实现选中时，浮动按钮背景颜色变化
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomNavigationBar(//底部导航栏布局
        currentIndex: currentIndex,
        onTap: (int index) {
          if(index==2){// tab添加被点击
            _onAdd();
            return;
          }
          setState(() {
            currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed, //配置底部tabs可以有
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.assignment_turned_in),label:"任务"),
          BottomNavigationBarItem(icon: Icon(Icons.gavel),label:"交易"),
          BottomNavigationBarItem(icon: Icon(Icons.add),label:"发布"),
          BottomNavigationBarItem(icon: Icon(Icons.textsms),label:"消息"),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle_rounded),label:"我的"),
        ],
      ),
    );
  }
}
