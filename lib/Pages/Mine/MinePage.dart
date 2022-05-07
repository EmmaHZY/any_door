// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:any_door/my_colors.dart';

// enum IconTextAlignment {
//   iconTopTextBottom,//图在上文字在下
//   iconBottomTextTop,//图在下文字在上
//   iconLeftTextRight,//图在左文字在右
//   iconRightTextLeft,//图在右文字在左
// }

class MinePage extends StatefulWidget {
  const MinePage({Key? key}) : super(key: key);

  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: MyColors.mTaskColor,
          title: Text(
            "我的",
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          //导航栏下那条黑线
          elevation: 0,
          //右侧按钮，可设置多个
          actions: <Widget>[
            // FlatButton(
            //   child: Text(
            //     // prefixIcon: Icon(Icons.account_circle),
            //     "搜索",
            //     style: TextStyle(
            //         color: Colors.white,
            //         fontSize: 15,
            //         fontWeight: FontWeight.bold),
            //   ),
            //   onPressed: () {
            //
            //   },
            // ),
            IconButton(onPressed: (){},
                icon: Icon(
                  Icons.settings_outlined,
                ),),


          ],
        ),
        body: Container(
          color: MyColors.mTaskColor,
          child: Column(
            children: <Widget>[
              _buildUserInfo(),
              // _buildOrderTitle(),
              _buildOrderType(),
              _buildTaskTitle(),
              _buildTaskType(),
              _buildTradeTitle(),
              _buildTradeType(),
              Expanded(
                  child: Container(
                    color: Colors.white,
                  )
              )
            ],
          ),
        )
    );
  }
  Widget _buildUserInfo() {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              //Color.fromRGBO(73, 129, 245, 1),
              MyColors.mTaskColor,
              MyColors.mTaskColor,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
      child: Container(
        margin: EdgeInsets.only(top: 16, bottom: 16),
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 16),
              child: ClipOval(
                child: Icon(
                  Icons.person_outline,
                  size: 70,
                ),
                // child: Image(
                //     image: AssetImage('assets/logo.png'),
                //     width: 48),
              ),
            ),
            Expanded(
              flex: 100,
              child: Container(
                margin: EdgeInsets.only(left: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, //元素左对齐
                  children: <Widget>[
                    Container(
                      child: Text(
                        "张荣添",///可加长，会显示点点点
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          letterSpacing: 1.5,//字体间隔
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        "1952541",///可加长，会显示点点点
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          letterSpacing: 2,//字体间隔
                          height: 2,//行高设置
                          fontSize: 10,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
//            Spacer(),
//             Container(
//               height: 24,
//               padding: EdgeInsets.only(right: 16, left: 6),
//               child: OutlineButton(
//                 color: Colors.white,
//                 child: Baseline(
//                   baseline: 12,
//                   baselineType: TextBaseline.alphabetic,
//                   child: Text("编辑信息",
//                       style: TextStyle(color: Colors.white, fontSize: 12),
//                       textAlign: TextAlign.center),
//                 ),
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12.0)),
//                 borderSide: new BorderSide(color: Colors.white),
//                 onPressed: () {
//
//                 },
//               ),
//             ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderTitle() {
    return GestureDetector(
      onTap: () {
        print("tap");
      },
      child: Container(
        height: 40,
        margin: EdgeInsets.only(top: 5, left: 0, right: 0),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
//              topLeft: Radius.circular(10), topRight: Radius.circular(10)
          ),
          child: Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 39.5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(
                          left: 16,
                        ),
                        child: Text("管理",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                            textAlign: TextAlign.center),
                      ),
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(bottom: 0),
                    color: Color.fromRGBO(238, 238, 238, 1),
                    height: 0.5),
              ],
            ),
          ),
        ),
//      child:
      ),
    );
  }

  Widget _buildOrderType() {

    return Container(
      color: Colors.white,
      height: 92,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,

        children: <Widget>[
          TextButton.icon(
              onPressed:(){},
              icon: Icon(
                Icons.bar_chart,
                color: Colors.grey,
              ),
              label: Text("资料",style: TextStyle(color: Colors.grey),)
          ),

          TextButton.icon(
              onPressed:(){},
              icon: Icon(
                Icons.grade,
                color: Colors.grey,
              ),
              label: Text("收藏",style: TextStyle(color: Colors.grey),)
          ),

          TextButton.icon(
              onPressed:(){},
              icon: Icon(
                Icons.account_balance_wallet,
                color: Colors.grey,
              ),
              label: Text("钱包",style: TextStyle(color: Colors.grey),)
          ),

          TextButton.icon(
              onPressed:(){},
              icon: Icon(
                Icons.redeem,
                color: Colors.grey,
              ),
              label: Text("礼品",style: TextStyle(color: Colors.grey),)
          ),
        ],
      ),
    );
  }

  Widget _buildTaskTitle() {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(color: Color.fromRGBO(249, 249, 250, 1), height: 20),
          Container(
            margin: EdgeInsets.only(top: 0, left: 16),
            color: Colors.white,
            height: 39.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text("我的任务",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400)),
                Spacer(),
                IconButton(icon: Icon(Icons.chevron_right),
                  onPressed: () {},)
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.only(bottom: 0),
              color: Color.fromRGBO(238, 238, 238, 1),
              height: 1),
        ],
      ),
    );
  }

  Widget _buildTaskType() {
    return Container(
      color: Colors.white,
      height: 92,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          TextButton.icon(
              onPressed:(){},
              icon: Icon(
                Icons.assignment_outlined,
                color: Colors.grey,
              ),
              label: Text("已发布",style: TextStyle(color: Colors.grey),)
          ),

          TextButton.icon(
              onPressed:(){},
              icon: Icon(
                Icons.receipt_long_outlined,
                color: Colors.grey,
              ),
              label: Text("已接取",style: TextStyle(color: Colors.grey),)
          ),

          TextButton.icon(
              onPressed:(){},
              icon: Icon(
                Icons.add_task_outlined,
                color: Colors.grey,
              ),
              label: Text("已完成",style: TextStyle(color: Colors.grey),)
          ),

          TextButton.icon(
              onPressed:(){},
              icon: Icon(
                Icons.event_busy_outlined,
                color: Colors.grey,
              ),
              label: Text("已取消",style: TextStyle(color: Colors.grey),)
          ),
        ],
      ),
    );
  }

  Widget _buildTradeTitle() {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(color: Color.fromRGBO(249, 249, 250, 1), height: 20),
          Container(
            margin: EdgeInsets.only(top: 0, left: 16),
            color: Colors.white,
            height: 39.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text("我的交易",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400)),
                Spacer(),
                IconButton(icon: Icon(Icons.chevron_right),
                  onPressed: () {},)


              ],
            ),
          ),
          Container(
              margin: EdgeInsets.only(bottom: 0),
              color: Color.fromRGBO(238, 238, 238, 1),
              height: 1),
        ],
      ),
    );
  }

  Widget _buildTradeType() {
    return Container(
      color: Colors.white,
      height: 92,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          TextButton.icon(
              onPressed:(){},
              icon: Icon(
                Icons.assignment_outlined,
                color: Colors.grey,
              ),
              label: Text("已发布",style: TextStyle(color: Colors.grey),)
          ),

          TextButton.icon(
              onPressed:(){},
              icon: Icon(
                Icons.receipt_long_outlined,
                color: Colors.grey,
              ),
              label: Text("已接取",style: TextStyle(color: Colors.grey),)
          ),

          TextButton.icon(
              onPressed:(){},
              icon: Icon(
                Icons.add_task_outlined,
                color: Colors.grey,
              ),
              label: Text("已完成",style: TextStyle(color: Colors.grey),)
          ),

          TextButton.icon(
              onPressed:(){ },
              icon: Icon(
                Icons.event_busy_outlined,
                color: Colors.grey,
              ),
              label: Text("已取消",style: TextStyle(color: Colors.grey),)
          ),
        ],
      ),
    );
  }

  Widget itemCell(Icon itemIcon, String itemTitle, String url, int count) {
    double c_width;
    if (count < 10) {
      c_width = 20;
    } else if (count > 100) {
      c_width = 35;
    } else
      c_width = 30;
    return GestureDetector(
      onTap: () {

      },
      child: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 23,
                  margin: EdgeInsets.only(top: 28, left: 20, right: 20),
                  child: IconButton(
                    padding: EdgeInsets.all(0),
                    icon: itemIcon,
                    tooltip: 'item',
                    iconSize: 23, onPressed: () {  },
                  ),
                ),
                Positioned(
                  left: 17,
                  top: 20,
                  child: Offstage(
                    offstage: count == 0,
                    child: Container(
                      margin: EdgeInsets.only(left: 30),
                      width: c_width,
                      height: 14,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(7),
                            bottomRight: Radius.circular(7),
                            topRight: Radius.circular(7)),
                        color: Color(0xFFFF491C),
                      ),
                      child: Text(
                        count >= 100 ? '99+' : count.toString(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Container(
              color: Colors.white,
              margin: EdgeInsets.only(top: 4),
              child: Text(
                itemTitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
