import 'package:flutter/material.dart';
import 'package:any_door/my_colors.dart';

import 'package:any_door/Pages/Task/TaskPage.dart';
import 'package:any_door/Pages/Deal/DealPage.dart';
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
  List pageList = [const TaskPage(), const DealPage(), const MessagePage(), const MinePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('任易门'),
      ),
      body: pageList[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed, //配置底部tabs可以有
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home),label:"任务"),
          BottomNavigationBarItem(icon: Icon(Icons.category),label:"交易"),
          BottomNavigationBarItem(icon: Icon(Icons.textsms),label:"消息"),
          BottomNavigationBarItem(icon: Icon(Icons.perm_identity),label:"我的"),
        ],
      ),
    );
  }
}
