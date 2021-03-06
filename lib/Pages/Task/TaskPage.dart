// 在模拟器夜神adb.exe下cmd
//nox_adb.exe connect 127.0.0.1:62001连接虚拟机
// flutter run --no-sound-null-safety

// 任务页面
import 'dart:convert';

import 'package:any_door/Pages/Task/TaskAllPage.dart';
import 'package:any_door/Pages/Task/widget/TaskList.dart';
import 'package:any_door/Pages/Task/widget/TaskTag.dart';
import 'package:any_door/adapt.dart';
// import 'package:any_door/image.dart';
import 'package:any_door/my_colors.dart';
import 'package:any_door/test.dart';
import 'package:flutter/material.dart';
import '../../HttpTools.dart';
import 'SearchTaskBar.dart';

// 任务主页

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);
  // const TaskPage({Key? key, required this.title}) : super(key: key);
  // final String title;
  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    // getdata();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, //去掉leading位置的返回箭头
        titleSpacing: 0,
        toolbarHeight: Adapt.padTopH() + Adapt.px(31),
        backgroundColor: MyColors.mTaskColor,
        elevation: 0,
        title: const SearchAppBar(hintLabel: "请输入要搜索的内容"),
      ),
      body: const TaskHome(),
    );
  }

  // @override
  // void initState() {
  //   super.initState();
  //   print("initState");
  //   getdata();
  // }

  // 对查看全部任务结果的处理
  // handingResult(String value) async {
  //   Map<String, dynamic> result = json.decode(value); //结果的map对象
  //   if (result["meta"]["status"] == "200") //登录成功
  //   {
  //     // result["data"]
  //   } else {
  //     //弹窗提示登录失败
  //     showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           title: const Text("提示"),
  //           content: const Text("页面加载失败，请重试"),
  //           actions: [
  //             FlatButton(
  //                 onPressed: () {
  //                   Navigator.push(
  //                     context,
  //                     MaterialPageRoute(
  //                       builder: (context) {
  //                         return const TaskPage(
  //                           title: 'title',
  //                         );
  //                       },
  //                     ),
  //                   );
  //                 },
  //                 child: const Text("确定")),
  //           ],
  //         );
  //       },
  //     );
  //   }
  // }

  // Future<void> getdata() async {
  //   print("!!111");
  //   // 执行查看全部任务方法
  //   Future<String> back = NetUtils.getJson(
  //       'http://1.117.239.54:8080/task?operation=getAll&index=&key=');
  //   back.then((value) => handingResult(value));
  // }
}

// class TaskPage extends StatelessWidget {
//   const TaskPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     log("111111");
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false, //去掉leading位置的返回箭头
//         titleSpacing: 0,
//         toolbarHeight: Adapt.padTopH() + Adapt.px(31),
//         backgroundColor: MyColors.mTaskColor,
//         elevation: 0,
//         title: const SearchAppBar(hintLabel: "请输入要搜索的内容"),
//       ),
//       body: const TaskHome(),
//     );
//   }
// }

class TaskHome extends StatelessWidget {
  const TaskHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: <Widget>[
            // GestureDetector(
            //   onTap: (() => {
            //         Navigator.of(context).push(
            //             MaterialPageRoute(builder: (context) => HeadImageUploadPage()))
            //       }),
            //   child: Text("跳转"),
            // ),
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
                    children: const [
                      Text(
                        "猜你喜欢",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 94, 92, 92),
                        ),
                      ),
                      // GestureDetector(
                      //   onTap: () {
                      //     // 跳到全部任务
                      //     Navigator.of(context).push(MaterialPageRoute(
                      //         builder: (context) => TaskAllPage()));
                      //   },
                      //   child: Container(
                      //     padding: EdgeInsets.only(
                      //         left: Adapt.px(24.8), right: Adapt.px(24.8)),
                      //     child: const Text("更多 >>",
                      //         style: TextStyle(
                      //           fontWeight: FontWeight.bold,
                      //           color: Color.fromARGB(255, 94, 92, 92),
                      //         )),
                      //   ),
                      // ),
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
              child: TaskList(),
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

// class Task extends StatefulWidget {
//   Task({Key? key}) : super(key: key);

//   @override
//   State<Task> createState() => _TaskState();
// }

// class _TaskState extends State<Task> {
//   @override
//   Widget build(BuildContext context) {
//     log("1111");
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false, //去掉leading位置的返回箭头
//         titleSpacing: 0,
//         toolbarHeight: Adapt.padTopH() + Adapt.px(31),
//         backgroundColor: MyColors.mTaskColor,
//         elevation: 0,
//         title: const SearchAppBar(hintLabel: "请输入要搜索的内容"),
//       ),
//       body: const TaskHome(),
//     );
//   }

//   @override
//   void initState() {
//     super.initState();
//     getdata();
//   }

//   //对登录结果的处理
//   handingResult(String value) async {
//     Map<String, dynamic> result = json.decode(value); //结果的map对象
//     print(result);
//   }

//   Future<void> getdata() async {
//     print("!!111");
//     // 执行查看全部任务方法
//     Future<String> back = NetUtils.getJson(
//         'http://1.117.239.54:8080/task?operation=getAll&index=&key=');
//     back.then((value) => handingResult(value));
//   }
// }




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




