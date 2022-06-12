import 'dart:convert';
import 'dart:typed_data';

import 'package:any_door/Pages/Message/CommunicationPage.dart';
import 'package:any_door/models/communication_model.dart';
import 'package:flutter/material.dart';
import 'package:any_door/my_colors.dart';

import '../../../HttpTools.dart';
import '../../../account.dart';

class OtherPage extends StatefulWidget {
  final String userID;
  const OtherPage({Key? key, required this.userID}) : super(key: key);

  @override
  _OtherPageState createState() => _OtherPageState();
}

class _OtherPageState extends State<OtherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //automaticallyImplyLeading: false,//去掉leading位置的返回箭头
          centerTitle: true,
          backgroundColor: MyColors.mTaskColor,
          title: const Text(
            "个人主页",
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          //导航栏下那条黑线
          elevation: 0,
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Container(
                height: 650,
                child: OtherInfo(userID: widget.userID),
              ),
              //DataType(),
              Expanded(
                  child: Container(
                color: Colors.white,
              ))
            ],
          ),
        ));
  }

  Widget _buildUserInfo(String userID) {
    return Container(
      decoration: const BoxDecoration(
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
        margin: const EdgeInsets.only(top: 16, bottom: 16),
        child: Row(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(left: 16),
              child: const ClipOval(
                  child: Image(
                image: NetworkImage(
                    "https://img0.baidu.com/it/u=3524086258,727431468&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500"),
                width: 65,
              )),
            ),
            Expanded(
              flex: 100,
              child: Container(
                margin: EdgeInsets.only(left: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, //元素左对齐
                  children: <Widget>[
                    Container(
                      child: const Text(
                        "放不开",

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
                        widget.userID,

                        ///可加长，会显示点点点
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
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
            const Spacer(),
            Container(
              margin: const EdgeInsets.only(right: 12),
              child: Column(
                children: <Widget>[
                  IconButton(
                      onPressed: () {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //   builder: (context) =>
                        //     CommunicationPage(userID: widget.activeTask.publisherID)))
                      },
                      splashColor: Colors.blueGrey,
                      icon: const Icon(Icons.textsms_outlined,
                          size: 20, color: Colors.blueGrey)),
                  const Text(
                    "发送消息",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      // fontWeight: FontWeight.w400)
                    ),
                  )
                ],
              ),
            )
          ],
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

class OtherInfo extends StatefulWidget {
  late String userID;
  OtherInfo({Key? key, required this.userID}) : super(key: key);
  @override
  State<OtherInfo> createState() => _OtherInfoState();
}

class _OtherInfoState extends State<OtherInfo> {
  late String autograph = "",
      image =
          "https://img1.baidu.com/it/u=3871105402,2821163553&fm=253&fmt=auto&app=138&f=JPEG?w=300&h=300",
      name = "",
      sex = "",
      QQ = "",
      wechat = "",
      tel = "",
      school = "",
      place = "";
  int score = 0;

  Widget _getMineData() {
    return Container(
      decoration: const BoxDecoration(
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
        margin: const EdgeInsets.only(top: 16, bottom: 16),
        child: Row(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(left: 16),
              child: ClipOval(
                child: Image.network(
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
                margin: const EdgeInsets.only(left: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, //元素左对齐
                  children: <Widget>[
                    Container(
                      child: Text(
                        name,

                        ///可加长，会显示点点点
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          letterSpacing: 1.5, //字体间隔
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        widget.userID,

                        ///可加长，会显示点点点
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
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
                        String send = "{\"userID\":\"" +
                            Account.account +
                            "\"," +
                            "\"friendID\":\"" +
                            widget.userID +
                            "\"}";

                        print(send);
                        Future<Uint8List> back = NetUtils.postJsonBytes(
                            'http://1.117.239.54:8080/chat',
                            send);
                            back.then((value){
                              print(value);
                            });
                        CommunicationModel communication = CommunicationModel(
                            userID: Account.account,
                            friend: widget.userID,
                            personImage: image,
                            userName: name,
                            lastMessage: "lastMessage",
                            lastTime: "lastTime");
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CommunicationPage(
                                  activeCommunication: communication,
                                )));
                      },
                      splashColor: Colors.greenAccent,
                      icon: const Icon(Icons.textsms_outlined,
                          size: 20,
                          color: Colors
                              .blueGrey)), //Color.fromRGBO(10, 202, 149, 100)
                  const Text(
                    "发送消息",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      // fontWeight: FontWeight.w400)
                    ),
                  )
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
        height: 540,
        child: SingleChildScrollView(
          //实现页面上下滑动
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceAround,

            children: <Widget>[
              // itemCell("学号          ", Account.account),
              //
              // Container(
              //     margin: EdgeInsets.only(right: 10, left: 10),
              //     color: Colors.grey,
              //     height: 1), //分割线
              //
              // itemCell("昵称          ", name),
              //
              // Container(
              //     margin: EdgeInsets.only(right: 10, left: 10),
              //     color: Colors.grey,
              //     height: 1), //分割线

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

              blank(),
              blank(),
            ],
          ),
        ));
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
                      Text(
                        itemTitle,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          // fontWeight: FontWeight.w400)
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Flexible(
                        child: Text(
                          Content,

                          ///可加长，会显示点点点
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            // fontWeight: FontWeight.w400)
                          ),
                        ),
                      ),
                    ])),
          ],
        ));
  }

  Widget blank() {
    return Container(
      color: Colors.white,
      height: 20,
    );
  }

  @override
  void initState() {
    // print("initstate");
    getdata();
    super.initState();
  }

  void getdata() {
    //log("!!111:getdata-------");
    // 执行查看全部任务方法
    Future<Uint8List> back = NetUtils.getJsonBytes(
        'http://1.117.239.54:8080/user?operation=getMe&index=' + widget.userID);
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
      name = (result["data"][0]["username"]);

      if (result["data"][0]["sex"] == null)
        sex = "无";
      else
        sex = (result["data"][0]["sex"]);

      if (result["data"][0]["personimage"] != null)
        image = (result["data"][0]["personimage"]);

      if (result["data"][0]["personlabel"] == null)
        autograph = "无";
      else
        autograph = (result["data"][0]["personlabel"]);

      score = (result["data"][0]["creditscore"]);

      if (result["data"][0]["wechatnumber"] == null)
        wechat = "无";
      else
        wechat = (result["data"][0]["wechatnumber"]);

      if (result["data"][0]["qqnumber"] == null)
        QQ = "无";
      else
        QQ = (result["data"][0]["qqnumber"]);

      if (result["data"][0]["telnumber"] == null)
        tel = "无";
      else
        tel = result["data"][0]["telnumber"];

      if (result["data"][0]["place"] == null)
        school = "无";
      else
        school = result["data"][0]["place"];
      // log(image);
      // Iterable list = result["data"];
      // activeTasks = list.map((model) => TaskModel.fromMap(model)).toList();
      //重新加载页面
      setState(() {
        // print("setstate");
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
          _getMineData(),
          DataType(),
          Expanded(
              child: Container(
            color: Colors.white,
          ))
        ],
      ),
    );
  }
}
