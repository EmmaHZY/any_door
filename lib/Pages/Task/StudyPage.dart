// 在模拟器夜神adb.exe下cmd
//nox_adb.exe connect 127.0.0.1:62001连接虚拟机
// flutter run --no-sound-null-safety

// 任务页面
import 'dart:convert';
import 'dart:typed_data';

import 'package:any_door/Pages/Task/widget/TaskList.dart';
import 'package:any_door/Pages/Task/widget/TaskTag.dart';
import 'package:any_door/account.dart';
import 'package:any_door/adapt.dart';
import 'package:any_door/models/task_model.dart';
import 'package:any_door/my_colors.dart';
import 'package:flutter/material.dart';
import '../../HttpTools.dart';
import 'SearchTaskBar.dart';
import 'TaskDetailPage.dart';

// 全部任务页面

class StudyPage extends StatefulWidget {
  StudyPage({Key? key}) : super(key: key);

  @override
  State<StudyPage> createState() => _StudyPageState();
}

class _StudyPageState extends State<StudyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        toolbarHeight: Adapt.padTopH() + Adapt.px(31),
        backgroundColor: MyColors.mTaskColor,
        elevation: 0,
        title: const SearchAppBar(hintLabel: "请输入要搜索的内容"),
      ),
      body: const StudyHome(),
    );
  }
}

class StudyHome extends StatelessWidget {
  const StudyHome({Key? key}) : super(key: key);

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
                        "学习任务",
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
              child: StudyList(),
            ),
          ],
        ),
      ],
    );
  }
}

class StudyList extends StatefulWidget {
  StudyList({Key? key}) : super(key: key);
  @override
  State<StudyList> createState() => _StudyListState();
}

class _StudyListState extends State<StudyList> {

  var activeTasks = <TaskModel>[];
  Widget _getListData(context, index) {
    List tagImageList = [
      "assets/run1.png",
      "assets/study.png",
      "assets/entertain1.png",
      "assets/else.png",
    ];
    // print("_getlistData----------");
    return GestureDetector(
      onTap: (() => {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TaskDetailPage(
                      activeTask: activeTasks[index],
                    )))
          }),
      child: Card(
        color: MyColors.mTaskColorLight,
        child: Column(children: <Widget>[
          // 任务标签图片
          Expanded(
            flex: 4,
            child: AspectRatio(
              aspectRatio: 14 / 9,
              child: Image.asset(
                tagImageList[int.parse(activeTasks[index].tag) -
                    1], //这里应该是tag对应的图片，而不是任务图片
                fit: BoxFit.cover,
              ),
            ),
          ),
          // 任务标签
          Expanded(
            child: Text(
              activeTasks[index].taskTitle,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: Adapt.px(25)),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          // 头像+赏金
          Expanded(
            child: Container(
              margin: EdgeInsets.all(Adapt.px(15.5)),
              height: Adapt.px(36.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // 头像和用户名
                  Row(
                    children: [
                      // 头像
                      Container(
                        width: Adapt.px(41),
                        height: Adapt.px(41),
                        child: CircleAvatar(
                            backgroundImage:
                                NetworkImage(activeTasks[index].personImage)),
                      ),

                      // 用户名
                      Text(
                        activeTasks[index].publisherID +
                            "   " +
                            activeTasks[index].username,
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: Adapt.px(19)),
                      ),
                    ],
                  ),

                  // 金币数
                  Row(
                    children: [
                      // 金币数
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
                    ],
                  ),
                ],
              ),
            ),
          ),
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
      itemCount: activeTasks.length,
      itemBuilder: _getListData,
    );
  }

  void getdata() {
    Future<Uint8List> back = NetUtils.getJsonBytes(
        'http://1.117.239.54:8080/task?operation=getByTag&index='+Account.account+'&key=2');
    back.then((value) {
      Map<String, dynamic> result = json.decode(utf8.decode(value)); //结果的map对象
      // print(result);
      Iterable list = result["data"];
      activeTasks = list.map((model) => TaskModel.fromMap(model)).toList();
      // 重新加载页面
      setState(() {
        // print("setstate");
      });
    });
  }
}

