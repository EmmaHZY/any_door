import 'package:any_door/Pages/Task/TaskDetailPage.dart';
import 'package:any_door/adapt.dart';
import 'package:any_door/my_colors.dart';
import 'package:any_door/res/listData.dart';
import 'package:flutter/material.dart';

// 任务列表
class TaskList extends StatelessWidget {
  const TaskList({Key? key}) : super(key: key);

  Widget _getListData(context, index) {
    List tagImageList = [
      "assets/run1.png",
      "assets/study.png",
      "assets/entertain1.png",
      "assets/else.png",
    ];
    return GestureDetector(
      onTap: (() => {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TaskDetailPage(
                      index: index,
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
                tagImageList[
                    listData[index]["tag"] - 1], //这里应该是tag对应的图片，而不是任务图片
                fit: BoxFit.cover,
              ),
            ),
          ),
          // 任务标签
          Expanded(
            child: Text(
              listData[index]["taskTitle"],
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
                        // width: 20,
                        // height: 20,
                        child: CircleAvatar(
                            backgroundImage:
                                NetworkImage(listData[index]["personImage"])),
                      ),

                      // 用户名
                      Text(
                        listData[index]["userName"],
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
                      Text("${listData[index]["taskCoin"]}"),
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
      itemCount: listData.length,
      itemBuilder: _getListData,
    );
  }
}
