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

import 'Modify.dart';


bool visible = false;

// 任务列表
class DataInfo extends StatefulWidget {
  DataInfo({Key? key}) : super(key: key);
  @override
  State<DataInfo> createState() => _DataInfoState();
}

class _DataInfoState extends State<DataInfo> {
  late String autograph="",image="https://img1.baidu.com/it/u=3871105402,2821163553&fm=253&fmt=auto&app=138&f=JPEG?w=300&h=300",
      name="",sex="",QQ = "", wechat = "", tel = "", school = "",level="",place="";
  double coin=0;
  int score=0;
  Widget DataType() {
    return Container(
        color: Colors.white,
        height: 580,
        child: SingleChildScrollView(//实现页面上下滑动
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceAround,

            children: <Widget>[
              HeadImage(),

              Container(
                  margin: EdgeInsets.only(right: 10, left: 10),
                  color: Colors.grey,
                  height: 1), //分割线

              itemCell("学号          ", Account.account),

              Container(
                  margin: EdgeInsets.only(right: 10, left: 10),
                  color: Colors.grey,
                  height: 1), //分割线

              itemCell("昵称          ", name),

              Container(
                  margin: EdgeInsets.only(right: 10, left: 10),
                  color: Colors.grey,
                  height: 1), //分割线

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

              itemCell("系统等级", level),

              Container(
                  margin: EdgeInsets.only(right: 10, left: 10),
                  color: Colors.grey,
                  height: 1), //分割线

              itemCell("金币          ", coin.toString()),

              Container(
                  margin: EdgeInsets.only(right: 10, left: 10),
                  color: Colors.grey,
                  height: 1), //分割线

              itemCell("信誉分      ", score.toString()),

              Container(
                  margin: EdgeInsets.only(right: 10, left: 10),
                  color: Colors.grey,
                  height: 1), //分割线

              itemCell("校区          ", school),

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


              // itemCell("收货地址", place),
              //
              // Container(
              //     margin: EdgeInsets.only(right: 10, left: 10),
              //     color: Colors.grey,
              //     height: 1), //分割线
              blank(),
              blank(),
            ],
          ),
        )
    );
  }

  Widget Button() {
    return Container(
        child: Column(
            children:<Widget>[
              Container(
                color: Colors.white,
                height: 20,
              ),
              SizedBox(
                height: 50,
                width: 300,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.lightGreen),
                  ),
                  child: const Text(
                      '修改资料',
                      style: TextStyle(
                          fontSize: 20,
                          color:Colors.white)
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ModifyPage(image:image,sex:sex,name: name, userID: Account.account, autograph: autograph, school: school, QQ: QQ, wechat: wechat, tel: tel);
                        },
                      ),
                    ).then((val) => getdata());
                  },
                ),
              ),
            ]
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

                      Flexible(
                        child: Text(Content,
                          ///可加长，会显示点点点
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            // fontWeight: FontWeight.w400)
                          ),),),

                    ]
                )
            ),
          ],
        )
    );
  }

  Widget HeadImage() {
    return Container(
        color: Colors.white,
        height: 60,
        child: Column(
          children: <Widget>[
            Container(
                height: 50,
                margin: EdgeInsets.only(right: 10, left: 10,top: 5),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text("头像  ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          // fontWeight: FontWeight.w400)
                        ),),

                      SizedBox(width: 15,),

                      Container(
                        margin: EdgeInsets.only(left: 16),
                        child: ClipOval(
                          child:Image.network(
                            image,
                            width: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
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
      height: 20,
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

      if(result["data"][0]["sex"]==null)sex="无";
      else sex=(result["data"][0]["sex"]);

      if(result["data"][0]["personimage"]!=null)image=(result["data"][0]["personimage"]);

      if(result["data"][0]["personlabel"]==null)autograph="无";
      else autograph=(result["data"][0]["personlabel"]);

      coin=(result["data"][0]["coin"]);
      score=(result["data"][0]["creditscore"]);

      if(result["data"][0]["level"]==null)level=" ";
      else level=(result["data"][0]["level"]);

      if(result["data"][0]["wechatnumber"]==null)wechat="无";
      else wechat=(result["data"][0]["wechatnumber"]);

      if(result["data"][0]["qqnumber"]==null)QQ="无";
      else QQ=(result["data"][0]["qqnumber"]);

      if(result["data"][0]["telnumber"]==null)tel="无";
      else tel=result["data"][0]["telnumber"];

      if(result["data"][0]["place"]==null)school="无";
      else school=result["data"][0]["place"];
      // log(image);
      // Iterable list = result["data"];
      // activeTasks = list.map((model) => TaskModel.fromMap(model)).toList();
      //重新加载页面
      setState(() {
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: MyColors.mTaskColor,
      color: Colors.white,
      child: Column(
        children: <Widget>[
          DataType(),
          Button(),
          Expanded(
              child: Container(
                color: Colors.white,
              )
          )
        ],
      ),
    );
  }
}
