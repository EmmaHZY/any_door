import 'dart:convert';
import 'dart:typed_data';

import 'package:any_door/HttpTools.dart';
import 'package:any_door/Pages/Task/TaskDetailPage.dart';
import 'package:any_door/adapt.dart';
import 'package:any_door/models/task_model.dart';
import 'package:any_door/my_colors.dart';
import 'package:flutter/material.dart';

class TaskSearch extends StatefulWidget {
  final String content;
  TaskSearch({Key? key, required this.content}) : super(key: key);

  @override
  State<TaskSearch> createState() => _TaskSearchState();
}

class _TaskSearchState extends State<TaskSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.content + "   的搜索结果：",
            style: TextStyle(
              fontSize: 15,
            ),
          ),
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
                  Adapt.px(160) ,
              child: TaskSearchBody(content: widget.content),
            ),
          ],
        ));
  }
}

class TaskSearchBody extends StatefulWidget {
  final String content;
  TaskSearchBody({Key? key, required this.content}) : super(key: key);

  @override
  State<TaskSearchBody> createState() => _TaskSearchBodyState();
}

class _TaskSearchBodyState extends State<TaskSearchBody> {
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
                      // Text("${listData[index]["taskCoin"]}"),
                      // Text(activeTasks[index].taskCoin)
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
  void initState() {
    // print("initstate");
    getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (activeTasks.isEmpty) {
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
        itemCount: activeTasks.length,
        itemBuilder: _getListData,
      );
    }
  }

  void getdata() {
    // print("!!111:getdata-------");
    // 执行查看全部任务方法
    Future<Uint8List> back = NetUtils.getJsonBytes(
        'http://1.117.239.54:8080/task?operation=getByOtherPublisherID&index=' +
            widget.content +
            '&key=');
    //     Future<Uint8List> back = NetUtils.getJsonBytes(
    // 'http://1.117.239.54:8080/task?operation=getAll&index=&key=');
    back.then((value) {
      // print("!!!1111:handlingResult---------");
      Map<String, dynamic> result = json.decode(utf8.decode(value)); //结果的map对象
      print(result);
      Iterable list = result["data"];
      activeTasks = list.map((model) => TaskModel.fromMap(model)).toList();
      // 重新加载页面
      setState(() {
        // print("setstate");
      });
    });
  }
}
