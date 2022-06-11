import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:any_door/my_colors.dart';
import '../../HttpTools.dart';
import '../../account.dart';
import '../../adapt.dart';
import 'Info/Modify.dart';

class MineWalletPage extends StatefulWidget {
  const MineWalletPage({Key? key}) : super(key: key);

  @override
  _MineWalletPageState createState() => _MineWalletPageState();
}

class _MineWalletPageState extends State<MineWalletPage> {
  late double coin=0;
  late int score=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //automaticallyImplyLeading: false,//去掉leading位置的返回箭头
          centerTitle: true,
          backgroundColor: MyColors.mTaskColor,
          title: Text(
            "我的钱包",
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),

        body: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              blank(),
              itemMoney(),
              blank(),
              Container(
                  margin: EdgeInsets.only(right: 10, left: 10),
                  color: Colors.grey,
                  height: 1), //分割线
              blank(),
              itemCredit(),
              blank(),
              Container(
                  margin: EdgeInsets.only(right: 10, left: 10),
                  color: Colors.grey,
                  height: 1),
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
      score=(result["data"][0]["creditscore"]);
      coin=(result["data"][0]["coin"]);
      setState(() {
        // print("setstate");
      });
    });
  }

  Widget itemMoney() {
    return Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
                height: 70,
                margin: EdgeInsets.only(right: 10, left: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(Icons.payment_outlined,
                          color: Color.fromRGBO(254, 180, 12, 100),
                          size: 50,),
                      Text('金币',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 20,
                          // fontWeight: FontWeight.w400)
                        ),),

                      Spacer(),

                      Text('￥'+ coin.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25, // fontWeight: FontWeight.w400)
                        ),),

                      SizedBox(width: 25,),
                    ]
                )
            )
          ],
        )
    );
  }

  Widget itemCredit() {
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
                      Icon(Icons.credit_score_outlined,
                          color: Color.fromRGBO(254, 180, 12, 100),
                          size: 50,),
                      Text('信誉分',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 20,
                          // fontWeight: FontWeight.w400)
                        ),),

                      Spacer(),

                      Text(score.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          // fontWeight: FontWeight.w400)
                        ),),
                      SizedBox(width: 25,),
                    ]
                )
            )
          ],
        )
    );
  }

  Widget blank() {
    return Container(
      color: Colors.white,
      height: 10,
    );
  }
}
