import 'dart:convert';
import 'dart:typed_data';

import 'package:any_door/Pages/Mine/Info/ExchPassword.dart';
import 'package:any_door/Pages/Mine/Other/OtherPage.dart';
import 'package:any_door/account.dart';
import 'package:flutter/material.dart';
import 'package:any_door/my_colors.dart';
import '../../adapt.dart';
import 'Auction/PubAuc.dart';
import 'Auction/TakeAuc.dart';
import 'Info/PersonalData.dart';
import 'Gift/MineGift.dart';
import 'MineInfo.dart';
import 'MineWallet.dart';
import 'PersonTask/Accept/Accept.dart';
import 'PersonTask/Done/Done.dart';
import 'PersonTask/Ing/Ing.dart';
import 'PersonTask/Released.dart';
import '../../HttpTools.dart';
import 'dart:developer';
import 'package:flutter/services.dart';
import 'package:im_flutter_sdk/im_flutter_sdk.dart';
import '../../account.dart';
import 'PersonTrade/Acc/Acc.dart';
import 'PersonTrade/Published.dart';

class MinePage extends StatefulWidget {
  const MinePage({Key? key}) : super(key: key);

  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  // var activeMine = <TaskModel>[];
  // late String autograph,image,name;
  // late List minedata;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,//防止键盘溢出
        appBar: AppBar(
          automaticallyImplyLeading: false,//去掉leading位置的返回箭头
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
              Container(
                height: Adapt.px(394),
                child: MineInfo(),
              ),
              //_buildOrderType(),
              _buildTaskTitle(),
              _buildTaskType(),
              _buildTradeTitle(),
              _buildTradeType(),
              blank(),
              LeaveButton(),
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

  void getdata(){
      setState(() {
        // print("setstate");
      });
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
                IconButton(onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const AcceptPage();
                      },
                    ),
                  );
                },
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
                IconButton(onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const DonePage();
                      },
                    ),
                  );
                },
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
                IconButton(onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const IngPage();
                      },
                    ),
                  );
                },
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
                IconButton(onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const PublishedPage();
                      },
                    ),
                  );
                },
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
                IconButton(onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const AccPage();
                      },
                    ),
                  );
                },
                    splashColor: Colors.white24,
                    icon: Icon(Icons.local_mall_outlined,
                      color: Colors.redAccent,)),
                Text("接收交易",
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
                        return const PubAucPage();
                      },
                    ),
                  );
                },
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
                IconButton(onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const TakeAucPage();
                      },
                    ),
                  );
                },
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