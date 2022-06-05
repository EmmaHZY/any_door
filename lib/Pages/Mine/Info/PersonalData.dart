import 'package:flutter/material.dart';
import 'package:any_door/my_colors.dart';
import '../../../adapt.dart';
import 'Modify.dart';

class PersonalDataPage extends StatefulWidget {
  const PersonalDataPage({Key? key}) : super(key: key);

  @override
  _PersonalDataPageState createState() => _PersonalDataPageState();
}

class _PersonalDataPageState extends State<PersonalDataPage> {
  bool _isFavorited = true;
  int _favoriteCount = 41;
  String name = "张荣添",
      sex="男",
      userID = "1952541",
      autograph = "干饭人，干饭魂",
      QQ = "100001",
      wechat = "ZRT",
      tel = "137xxxxxxxx",
      area = "嘉定区";
  int score = 100;
  double coin = 100.0;

  // void _toggleFavorite() {
  //   // 通过 setState() 更新数据
  //   // 组件树就会自动刷新了
  //   setState(() {
  //     if (_isFavorited) {
  //       _favoriteCount -= 1;
  //       _isFavorited = false;
  //     } else {
  //       _favoriteCount += 1;
  //       _isFavorited = true;
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //automaticallyImplyLeading: false,//去掉leading位置的返回箭头
          centerTitle: true,
          backgroundColor: MyColors.mTaskColor,
          title: Text(
            "个人资料",
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          actions: <Widget>[
            IconButton(onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) =>
                      ModifyPage(
                        name: name,
                        userID: userID,
                        QQ: QQ,
                        wechat: wechat,
                        autograph: autograph,
                        tel: tel,
                        area: area,
                      )));
            },
              icon: Icon(
                Icons.edit_outlined,
              ),),
          ],
        ),
        body: Container(
          color: MyColors.mTaskColor,
          child: Column(
            children: <Widget>[
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

  Widget DataType() {
    return Container(
      color: Colors.white,
      height: 650,
      child: SingleChildScrollView(//实现页面上下滑动
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,

          children: <Widget>[
            HeadImage(),

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

            itemCell("学号          ", userID),

            Container(
                margin: EdgeInsets.only(right: 10, left: 10),
                color: Colors.grey,
                height: 1), //分割线

            itemCell("个性签名", autograph),

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

            itemCell("系统id       ", "15936543"),

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

  Widget HeadImage() {
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
                            child: Image(
                              image: AssetImage('assets/HeadPhoto.png'),
                              width: 40,
                            )
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
}
