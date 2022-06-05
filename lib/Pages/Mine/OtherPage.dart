import 'package:any_door/Pages/Mine/Info/ExchPassword.dart';
import 'package:flutter/material.dart';
import 'package:any_door/my_colors.dart';
import 'Info/PersonalData.dart';
import 'MineCollection.dart';
import 'Gift/MineGift.dart';
import 'MineWallet.dart';
import 'PersonTask/Released.dart';

class OtherPage extends StatefulWidget {
  const OtherPage({Key? key}) : super(key: key);

  @override
  _OtherPageState createState() => _OtherPageState();
}

class _OtherPageState extends State<OtherPage> {
  String userID = '1952336',autograph='春天该很好，你若尚在场',sex='女',QQ='65472xxx',
          wechat='31415926',tel='400-8820-8820',area='嘉定区';
  int score = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //automaticallyImplyLeading: false,//去掉leading位置的返回箭头
          centerTitle: true,
          backgroundColor: MyColors.mTaskColor,
          title: Text(
            "个人主页",
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          //导航栏下那条黑线
          elevation: 0,
          //右侧按钮，可设置多个
          // actions: <Widget>[
          //   IconButton(onPressed: () { },
          //     icon: Icon(
          //       Icons.settings_outlined,
          //     ),),
          // ],
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              _buildUserInfo(userID),
              DataType(),
              // _buildOrderType(),
              // _buildTaskTitle(),
              // _buildTaskType(),
              // _buildTradeTitle(),
              // _buildTradeType(),
              //blank(),
              // LeaveButton(),
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

  Widget _buildUserInfo(String userID) {
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
                  child:Image(
                    image: AssetImage('assets/flower.png'),
                    width: 65,
                  )
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
                        "陆百花",

                        ///可加长，会显示点点点
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          letterSpacing: 1.5, //字体间隔
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        userID,

                        ///可加长，会显示点点点
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          letterSpacing: 2, //字体间隔
                          height: 2, //行高设置
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Spacer(),
            Container(
              margin: EdgeInsets.only(right: 12),
              child: Column(
                children: <Widget>[
                  IconButton(
                      onPressed: () {

                      },
                      splashColor: Colors.blueGrey,
                      icon: Icon(Icons.textsms_outlined,
                          size: 20,
                          color: Colors.blueGrey)),
                  Text("发送消息",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      // fontWeight: FontWeight.w400)
                    ),)
                ],
              ),
            )

          ],
        ),
      ),
    );
  }

  Widget DataType() {
    return Container(
        color: Colors.white,
        height: 500,
        child: SingleChildScrollView(//实现页面上下滑动
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceAround,

            children: <Widget>[

              itemCell("性别          ", sex),

              Container(
                  margin: EdgeInsets.only(right: 10, left: 10),
                  color: Colors.grey,
                  height: 1), //分割线

              itemCell("个性签名", autograph),

              Container(
                  margin: EdgeInsets.only(right: 10, left: 10),
                  color: Colors.grey,
                  height: 1), //分割线

              itemCell("信誉分      ", score.toString()),

              Container(
                  margin: EdgeInsets.only(right: 10, left: 10),
                  color: Colors.grey,
                  height: 1), //分割线

              itemCell("校区          ", area),

              Container(
                  margin: EdgeInsets.only(right: 10, left: 10),
                  color: Colors.grey,
                  height: 1), //分割线

              itemCell("QQ               ", QQ),

              Container(
                  margin: EdgeInsets.only(right: 10, left: 10),
                  color: Colors.grey,
                  height: 1), //分割线

              itemCell("微信           ", wechat),

              Container(
                  margin: EdgeInsets.only(right: 10, left: 10),
                  color: Colors.grey,
                  height: 1), //分割线

              itemCell("电话          ", tel),

              Container(
                  margin: EdgeInsets.only(right: 10, left: 10),
                  color: Colors.grey,
                  height: 1), //分割线

              blank(),
              blank(),
            ],
          ),
        )
    );
  }

  Widget itemCell(String itemTitle, String Content) {
    return Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
                height: 50,
                margin: EdgeInsets.only(right: 10, left: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(itemTitle,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          // fontWeight: FontWeight.w400)
                        ),),

                      SizedBox(width: 15,),

                      Text(Content,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          // fontWeight: FontWeight.w400)
                        ),),
                    ]
                )
            )
          ],
        )
    );
  }

  Widget _buildOrderType() {
    return Container(
      color: Colors.white,
      height: 92,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,

        children: <Widget>[

          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const PersonalDataPage();
                      },
                    ),
                  );
                },
                    splashColor: Colors.white24,
                    icon: Icon(Icons.bar_chart,
                        size: 25,
                        color: Color.fromRGBO(10, 202, 149, 100))),
                Text("资料",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    // fontWeight: FontWeight.w400)
                  ),)
              ],
            ),
          ),

          // Container(
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: <Widget>[
          //       IconButton(onPressed: () {
          //         Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //             builder: (context) {
          //               return const MineCollectionPage();
          //             },
          //           ),
          //         );
          //       },
          //           splashColor: Colors.white24,
          //           icon: Icon(Icons.grade_outlined,
          //               size: 25,
          //               color: Color.fromRGBO(254, 180, 12, 100))),
          //       Text("收藏",
          //         style: TextStyle(
          //           color: Colors.black,
          //           fontSize: 12,
          //           // fontWeight: FontWeight.w400)
          //         ),)
          //     ],
          //   ),
          // ),

          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const MineWalletPage();
                      },
                    ),
                  );
                },
                    splashColor: Colors.white24,
                    icon: Icon(Icons.account_balance_wallet,
                        size: 25,
                        color: Colors.cyan)),
                Text("钱包",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    // fontWeight: FontWeight.w400)
                  ),)
              ],
            ),
          ),

          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const MineGiftPage();
                      },
                    ),
                  );
                },
                    splashColor: Colors.white24,
                    icon: Icon(Icons.redeem,
                        size: 25,
                        color: Color.fromRGBO(255, 80, 36, 100))),
                Text("礼品",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    // fontWeight: FontWeight.w400)
                  ),)
              ],
            ),
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
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const ReleasedPage();
                      },
                    ),
                  );
                },
                    splashColor: Colors.white24,
                    icon: Icon(Icons.assignment_outlined,
                        color: Color.fromRGBO(255, 80, 36, 100))),
                Text("已发布",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    // fontWeight: FontWeight.w400)
                  ),)
              ],
            ),
          ),

          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(onPressed: () {},
                    splashColor: Colors.white24,
                    icon: Icon(Icons.receipt_long_outlined,
                        color: Color.fromRGBO(31, 171, 254, 100))),
                Text("已接取",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    // fontWeight: FontWeight.w400)
                  ),)
              ],
            ),
          ),

          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(onPressed: () {},
                    splashColor: Colors.white24,
                    icon: Icon(Icons.add_task_outlined,
                        color: Color.fromRGBO(254, 180, 12, 100))),
                Text("已完成",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    // fontWeight: FontWeight.w400)
                  ),)
              ],
            ),
          ),

          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(onPressed: () {},
                    splashColor: Colors.white24,
                    icon: Icon(Icons.not_started_outlined,
                        color: Color.fromRGBO(10, 202, 149, 100))),
                Text("进行中",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    // fontWeight: FontWeight.w400)
                  ),)
              ],
            ),
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
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(onPressed: () {},
                  splashColor: Colors.white24,
                  icon: Icon(Icons.local_mall_outlined,
                    color: Colors.deepPurpleAccent,),),
                Text("发布交易",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    // fontWeight: FontWeight.w400)
                  ),)
              ],
            ),
          ),

          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(onPressed: () {},
                    splashColor: Colors.white24,
                    icon: Icon(Icons.local_mall_outlined,
                      color: Colors.redAccent,)),
                Text("参与交易",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    // fontWeight: FontWeight.w400)
                  ),)
              ],
            ),
          ),

          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(onPressed: () {},
                    splashColor: Colors.white24,
                    icon: Icon(Icons.gavel_outlined,
                      color: Colors.brown,)),
                Text("发布拍卖",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    // fontWeight: FontWeight.w400)
                  ),)
              ],
            ),
          ),

          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(onPressed: () {},
                    splashColor: Colors.white24,
                    icon: Icon(Icons.gavel_outlined,
                      color: Colors.orange,)),
                Text("参与拍卖",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    // fontWeight: FontWeight.w400)
                  ),)
              ],
            ),
          ),

        ],
      ),
    );
  }

  Widget LeaveButton() {
    return Container(
      child: SizedBox(
        height: 50,
        width: 300,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.red),
          ),
          child: const Text(
              '退出',
              style: TextStyle(
                  fontSize: 20,
                  color:Colors.white)
          ),
          onPressed: () {
            Navigator.pop(context,true);
          },
        ),
      ),
    );
  }

  Widget blank() {
    return Container(
      color: Colors.white,
      height: 30,
    );
  }
}