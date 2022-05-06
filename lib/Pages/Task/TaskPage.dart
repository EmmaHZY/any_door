// 在模拟器夜神adb.exe下cmd
//nox_adb.exe connect 127.0.0.1:62001连接虚拟机
// flutter run --no-sound-null-safety

import 'package:any_door/adapt.dart';
import 'package:flutter/material.dart';
import '../../res/listData.dart';
import 'package:any_door/my_colors.dart';
import 'dart:ui';
import 'TaskDetail.dart';
import '../../adapt.dart';

// 任务页面
class TaskPage extends StatelessWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, // 不显示右上角的 debug
        home: Scaffold(
          appBar: AppBar(
            titleSpacing: 0,
            toolbarHeight: Adapt.padTopH() + Adapt.px(31),
            backgroundColor: MyColors.mTaskColor,
            elevation: 0,
            title: const SearchAppBar(hintLabel: "请输入要搜索的内容"),
          ),
          body: const TaskHome(),
        ));
  }
}

// 搜索栏
class SearchAppBar extends StatefulWidget {
  const SearchAppBar({Key? key, required this.hintLabel}) : super(key: key);

  final String hintLabel;

  @override
  State<StatefulWidget> createState() {
    return SearchAppBarState();
  }
}

class SearchAppBarState extends State<SearchAppBar> {
  late FocusNode _focusNode;

  ///默认不展示控件

  bool _offstage = true;

  ///监听TextField内容变化
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _textEditingController.addListener(() {
      var isVisible = _textEditingController.text.isNotEmpty;
      _updateDelIconVisible(isVisible);
    });
  }

  _updateDelIconVisible(bool isVisible) {
    setState(() {
      _offstage = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: Adapt.px(46.5),
      child: Row(
        children: [
          // 搜索框
          Expanded(
            flex: 1,
            child: Container(
              // 整个搜索框
              height: double.infinity,
              margin: const EdgeInsets.only(left: 16),
              decoration: BoxDecoration(
                  color: const Color(0xFFF5F6FA),
                  borderRadius: BorderRadius.circular(4)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(padding: EdgeInsets.only(left: 8)),
                  // 搜索图标
                  const Icon(
                    Icons.search,
                    size: 16.0,
                    color: Colors.black,
                  ),
                  const Padding(padding: EdgeInsets.only(left: 8)),
                  // 文字输入框
                  Expanded(
                    flex: 1,
                    child: TextField(
                      controller: _textEditingController,
                      autofocus: true,
                      focusNode: _focusNode,
                      style: const TextStyle(fontSize: 14, color: Colors.black),
                      decoration: InputDecoration(
                        hintText: widget.hintLabel,
                        // fillColor: Colors.black,
                        // filled: true,
                        isCollapsed:
                            true, //重点，相当于高度包裹的意思，必须设置为true，不然有默认奇妙的最小高度
                        border: InputBorder.none, //去下划线
                      ),
                      // so strange!!!!👆
                      maxLines: 1,
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(left: 8)),
                  // 隐藏的清除按钮，当有文字时出现
                  Offstage(
                    offstage: _offstage,
                    child: GestureDetector(
                      onTap: () => {_textEditingController.clear()},
                      child: const Icon(
                        Icons.clear,
                        size: 16.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(left: 8)),
                ],
              ),
            ),
          ),
          // 搜索
          GestureDetector(
            onTap: () {
              // 传递数据给后端
            },
            child: Container(
              padding:
                  EdgeInsets.only(left: Adapt.px(24.8), right: Adapt.px(24.8)),
              child: Text("搜索",
                  style: TextStyle(
                    fontSize: Adapt.px(24.8),
                    color: Colors.white,
                  )),
            ),
          ),

          // 取消
          GestureDetector(
            onTap: () {
              _focusNode.unfocus();
            },
            child: Container(
              padding:
                  EdgeInsets.only(left: Adapt.px(24.8), right: Adapt.px(24.8)),
              child: Text("取消",
                  style:
                      TextStyle(fontSize: Adapt.px(24.8), color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.unfocus();
  }
}

// 任务主页
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
            // const SizedBox(
            //   height: 10,
            // ),

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
                  3*Adapt.padBotH(),
              child: const TaskList(),
            ),
            // TaskList(),
          ],
        ),
      ],
    );
  }
}

// 任务标签
class TaskTag extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: Container(
            child: TagContainer(Icons.search, description: "search1"),
            decoration: BoxDecoration(
                border: Border.all(
                    color: Color.fromRGBO(250, 250, 250, 1),
                    width: Adapt.px(1.55))),
          ),
          flex: 1,
        ),
        Expanded(
          child: Container(
            child: TagContainer(Icons.search, description: "search2"),
            decoration: BoxDecoration(
                border: Border.all(
                    color: Color.fromRGBO(250, 250, 250, 1),
                    width: Adapt.px(1.55))),
          ),
          flex: 1,
        ),
        Expanded(
          child: Container(
            child: TagContainer(Icons.search, description: "search3"),
            decoration: BoxDecoration(
                border: Border.all(
                    color: Color.fromRGBO(250, 250, 250, 1),
                    width: Adapt.px(1.55))),
          ),
          flex: 1,
        ),
        Expanded(
          child: Container(
            child: TagContainer(Icons.search, description: "search4"),
            decoration: BoxDecoration(
                border: Border.all(
                    color: Color.fromRGBO(250, 250, 250, 1),
                    width: Adapt.px(1.55))),
          ),
          flex: 1,
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class TagContainer extends StatelessWidget {
  double size = 32;
  Color color = MyColors.mTaskColorLight;
  String description = "tag";
  IconData icon;

  TagContainer(this.icon,
      {this.color = MyColors.mTaskColorLight,
      this.size = 32,
      this.description = "tag"});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: Adapt.px(186),
      width: Adapt.px(178.25),
      color: this.color,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(this.icon, size: this.size, color: MyColors.mTaskColor),
            Text(
              this.description,
              style: const TextStyle(color: MyColors.mTaskColor),
            )
          ],
        ),
      ),
    );
  }
}

// 任务列表
class TaskList extends StatelessWidget {
  const TaskList({Key? key}) : super(key: key);

  Widget _getListData(context, index) {
    return Card(
      child: Column(children: <Widget>[
        AspectRatio(
          aspectRatio: 14 / 9,
          child: Image.network(
            listData[index]["imageUrl"],
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: Adapt.px(15.5)),
        Text(
          listData[index]["title"],
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: Adapt.px(31)),
        ),
        Container(
          margin: EdgeInsets.all(Adapt.px(15.5)),
          height: Adapt.px(36.5),
          child: Row(
            children: [
              Container(
                width: Adapt.px(41),
                height: Adapt.px(41),
                // width: 20,
                // height: 20,
                child: CircleAvatar(
                    backgroundImage: NetworkImage(listData[index]["imageUrl"])),
              ),
              SizedBox(
                width: Adapt.px(25),
              ),
              Text(
                listData[index]["author"],
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: Adapt.px(19)),
              ),
            ],
          ),
        ),
      ]),
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




