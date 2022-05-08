// 在模拟器夜神adb.exe下cmd
//nox_adb.exe connect 127.0.0.1:62001连接虚拟机
// flutter run --no-sound-null-safety



// 任务页面
import 'package:any_door/Pages/Task/widget/TaskList.dart';
import 'package:any_door/Pages/Task/widget/TaskTag.dart';
import 'package:any_door/adapt.dart';
import 'package:any_door/my_colors.dart';
import 'package:flutter/material.dart';

import '../../SearchAppBar.dart';

// 任务主页
class TaskPage extends StatelessWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading : false,//去掉leading位置的返回箭头
        titleSpacing: 0,
        toolbarHeight: Adapt.padTopH() + Adapt.px(31),
        backgroundColor: MyColors.mTaskColor,
        elevation: 0,
        title: const SearchAppBar(hintLabel: "请输入要搜索的内容"),
      ),
      body: const TaskHome(),
    );
  }
}

class TaskHome extends StatelessWidget {
  const TaskHome({Key? key}) : super(key: key);

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
              child: TaskTag(),
            ),

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
                        "猜你喜欢",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 94, 92, 92),
                        ),
                      ),
                      // Text(
                      //   "更多",
                      //   style: TextStyle(
                      //     fontWeight: FontWeight.bold,
                      //     color: Color.fromARGB(255, 94, 92, 92),
                      //   ),
                      // ),
                      GestureDetector(
                        onTap: () {
                          // 跳到全部任务
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                              left: Adapt.px(24.8), right: Adapt.px(24.8)),
                          child: const Text("更多",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 94, 92, 92),
                              )),
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
                  Adapt.px(186) -
                  2 * Adapt.padTopH() -
                  90 -
                  3 * Adapt.padBotH(),
              child: const TaskList(),
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




// class LayoutDemo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: listData.map((value) {
//         return Card(
//           margin: EdgeInsets.all(10),
//           child: Column(
//             children: <Widget>[
//               AspectRatio(
//                 aspectRatio: 16 / 9,
//                 child: Image.network(
//                   value["imageUrl"],
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               ListTile(
//                 // leading: ClipOval(
//                 //   child: Image.network("https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2F6f91585a3bad622428c89dd48cf41eaf5714ff1643c40-qB6vmf_fw658&refer=http%3A%2F%2Fhbimg.b0.upaiyun.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1652100417&t=f9e4b93f900f033405f5760ef20fd7a9",fit: BoxFit.cover,height: 60,width: 60,),
//                 // ),
//                 leading: CircleAvatar(
//                     backgroundImage: NetworkImage(value["imageUrl"])),
//                 title: Text(value["title"]),
//                 subtitle: Text(
//                   value["description"],
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               )
//             ],
//           ),
//         );
//       }).toList(),
//     );
//   }
// }

// class LayoutDemo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     Widget container = Container(
//       // 添加修饰效果
//       decoration: BoxDecoration(
//         color: Colors.green,
//       ),
//       // 子元素指定一个垂直水平嵌套水平
//       child: Column(
//         children: <Widget>[
//           Row(
//             children: <Widget>[
//               // 使用 Expanded 防止子内容溢出
//               Expanded(
//                 child: Container(
//                   width: 150.0,
//                   height: 150.0,
//                   // 添加边框样式
//                   decoration: BoxDecoration(
//                       // 宽度 颜色
//                       border: Border.all(width: 10.0, color: Colors.blueGrey),
//                       borderRadius:
//                           const BorderRadius.all(const Radius.circular(8.0))),
//                   // 上下左右增加边框
//                   margin: const EdgeInsets.all(4.0),
//                   child: Image.asset('images/1.jpg'),
//                 ),
//               ),
//               Expanded(
//                 child: Container(
//                   width: 150.0,
//                   height: 150.0,
//                   // 添加边框样式
//                   decoration: BoxDecoration(
//                       // 宽度 颜色
//                       border: Border.all(width: 10.0, color: Colors.blueGrey),
//                       borderRadius:
//                           const BorderRadius.all(const Radius.circular(8.0))),
//                   // 上下左右增加边框
//                   margin: const EdgeInsets.all(4.0),
//                   child: Image.asset('images/2.jpg'),
//                 ),
//               ),
//             ],
//           ),
//           Row(
//             children: <Widget>[
//               // 使用 Expanded 防止子内容溢出
//               Expanded(
//                 child: Container(
//                   width: 150.0,
//                   height: 150.0,
//                   // 添加边框样式
//                   decoration: BoxDecoration(
//                       // 宽度 颜色
//                       border: Border.all(width: 10.0, color: Colors.blueGrey),
//                       borderRadius:
//                           const BorderRadius.all(const Radius.circular(8.0))),
//                   // 上下左右增加边框
//                   margin: const EdgeInsets.all(4.0),
//                   child: Image.asset('images/3.jpg'),
//                 ),
//               ),
//               Expanded(
//                 child: Container(
//                   width: 150.0,
//                   height: 150.0,
//                   // 添加边框样式
//                   decoration: BoxDecoration(
//                       // 宽度 颜色
//                       border: Border.all(width: 10.0, color: Colors.blueGrey),
//                       borderRadius:
//                           const BorderRadius.all(const Radius.circular(8.0))),
//                   // 上下左右增加边框
//                   margin: const EdgeInsets.all(4.0),
//                   child: Image.asset('images/4.jpg'),
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Container 布局容器实例'),
//       ),
//       body: container,
//     );
//   }
// }

// 自定义有状态组件

// class Homepage extends StatefulWidget {
//   Homepage({Key? key}) : super(key: key);
//   @override
//   State<Homepage> createState() => _HomepageState();
// }

// class _HomepageState extends State<Homepage> {
//   int countnum=0;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         Chip(label: Text("${this.countnum}")),
//         RaisedButton(
//           child: Text("button"),
//           onPressed: (){
//             setState(() {
//               countnum++;
//             });
//           }
//           ),
//       ],
//     );
//   }
// }




