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

  Widget blank() {
    return Container(
      color: Colors.white,
      height: 30,
    );
  }
}