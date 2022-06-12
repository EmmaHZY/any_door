import 'package:flutter/material.dart';
import 'package:any_door/my_colors.dart';
import '../../../adapt.dart';
import 'DataInfo.dart';
import 'Modify.dart';

class PersonalDataPage extends StatefulWidget {
  const PersonalDataPage({Key? key}) : super(key: key);

  @override
  _PersonalDataPageState createState() => _PersonalDataPageState();
}

class _PersonalDataPageState extends State<PersonalDataPage> {
  bool _isFavorited = true;
  int _favoriteCount = 41;

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
        resizeToAvoidBottomInset: false,//防止键盘溢出
        appBar: AppBar(
          //automaticallyImplyLeading: false,//去掉leading位置的返回箭头
          centerTitle: true,
          backgroundColor: MyColors.mTaskColor,
          title: const Text(
            "个人资料",
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          // actions: <Widget>[
          //
          // ],
        ),
        body: Container(
          color: MyColors.mTaskColor,
          child: Column(
            children: <Widget>[
              Container(
                height: 650,
                child: DataInfo(),
              ),
              //DataType(),
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
