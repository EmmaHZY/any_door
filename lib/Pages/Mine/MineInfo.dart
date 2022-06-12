import 'dart:developer';
import 'dart:typed_data';

import 'package:any_door/Pages/Task/TaskDetailPage.dart';
import 'package:any_door/account.dart';
import 'package:any_door/adapt.dart';
import 'package:any_door/models/task_model.dart';
import 'package:any_door/my_colors.dart';
import 'package:any_door/res/listData.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import '../../../HttpTools.dart';
import 'package:http/http.dart' as http;

import 'Gift/MineGift.dart';
import 'Info/ExchPassword.dart';
import 'Info/PersonalData.dart';
import 'MineWallet.dart';

bool visible = false;

// 任务列表
class MineInfo extends StatefulWidget {
  MineInfo({Key? key}) : super(key: key);
  @override
  State<MineInfo> createState() => _MineInfoState();
}

class _MineInfoState extends State<MineInfo> {
  late String autograph,image="https://img1.baidu.com/it/u=3871105402,2821163553&fm=253&fmt=auto&app=138&f=JPEG?w=300&h=300",
      name="昵称",level="";

  Widget _getMineData() {
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
                  child:Image.network(
                    image,
                    width: 65,
                    fit: BoxFit.cover,
                  ),
                  // Image(
                  //   image: AssetImage(image),
                  //   width: 65,
                  // )
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
                        name,

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
                        Account.account,

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
                        Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (_) => ExchPasswordPage(userID:Account.account))).then((data)=>null);
                      },
                      splashColor: Colors.greenAccent,
                      icon: Icon(Icons.settings_outlined,
                          size: 20,
                          color: Colors.blueGrey)),//Color.fromRGBO(10, 202, 149, 100)
                  Text("修改密码",
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

  @override
  void initState(){
    // print("initstate");
    getdata();
    super.initState();
  }


  void getdata(){
    //log("!!111:getdata-------");
    // 执行查看全部任务方法
    Future<Uint8List> back = NetUtils.getJsonBytes(
        'http://1.117.239.54:8080/user?operation=getMe&index='+Account.account);
    //     Future<Uint8List> back = NetUtils.getJsonBytes(
    // 'http://1.117.239.54:8080/task?operation=getAll&index=&key=');
    back.then((value) {
      // print("!!!1111:handlingResult---------");
      Map<String, dynamic> result = json.decode(utf8.decode(value)); //结果的map对象
      // log(result);
      // log(jsonEncode(result));
      // log(jsonEncode(result["meta"]["status"]));
      // log(jsonEncode(result["data"]));
      // log(jsonEncode(result["data"][0]["username"]));
      name=(result["data"][0]["username"]);
      //image=(result["data"][0]["personimage"]);
      if(result["data"][0]["personimage"]!=null)image=(result["data"][0]["personimage"]);
      //level=result["data"][0]["level"];
      // log(image);
      // Iterable list = result["data"];
      // activeTasks = list.map((model) => TaskModel.fromMap(model)).toList();
      //重新加载页面
      setState(() {
        // print("setstate");
      });
    });
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
                  ).then((val) => getdata());
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

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(
            children: <Widget>[
              _getMineData(),
              _buildOrderType(),
            ]
        )
    );
  }
}
