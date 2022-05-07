import 'package:any_door/Pages/Message/CommunicationPage.dart';
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
  List pageList = [const TaskPage(), const DealPage(), const PublishPage(),const MessagePage(title: 'title',), const MinePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('任易门'),
      // ),
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
            onPressed: () {
              setState(() {
                //可以实现重新渲染页面，因为_currentIndex变成了1，所以页面会跳转到分类页面
                currentIndex = 2; //点击浮动按钮时，切换到分类页面
              });
            },
            backgroundColor: currentIndex == 2
                ? MyColors.mPrimaryColor
                : Colors.grey //利用三目运算符，实现选中时，浮动按钮背景颜色变化
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomNavigationBar(//底部导航栏布局
        currentIndex: currentIndex,
        onTap: (int index) {
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
