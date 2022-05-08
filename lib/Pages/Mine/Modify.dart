import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:any_door/my_colors.dart';
import '../../HttpTools.dart';
import '../../account.dart';

class ModifyPage extends StatefulWidget {
  // const ModifyPage({Key? key, String? name, String? title,id}) : super(key: key);

  String name,id,autograph,QQ,wechat,tel,sex;
  ModifyPage({
    Key? key, required this.name,required this.id,required this.autograph,
    required this.QQ,required this.wechat,required this.tel,required this.sex
  }): super(key: key);
  @override
  _ModifyPageState createState() => _ModifyPageState();

}

class _ModifyPageState extends State<ModifyPage> {
  final GlobalKey _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //automaticallyImplyLeading: false,//去掉leading位置的返回箭头
          centerTitle: true,
          backgroundColor: MyColors.mTaskColor,
          title: Text(
            "修改资料",
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          color: MyColors.mTaskColor,
          child: Column(
            children: <Widget>[
              DataEdit(),
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

  Widget DataEdit(){
    return Container(
        color: Colors.white,
        height: 500,
        child: SingleChildScrollView(//实现页面上下滑动
          child: Column(
            children: <Widget>[
              blank(),
              HeadImage(),
              blank(),
              itemCell("昵称", widget.name),
              blank(),
              itemCell("性别", widget.sex),
              blank(),
              itemCell("个性签名", widget.autograph),
              blank(),
              itemCell("QQ", widget.QQ),
              blank(),
              itemCell("微信", widget.wechat),
              blank(),
              SaveButton(),
              blank(),
              blank(),
            ],
          ),
        )
      );
  }

  Widget modifyTextField(String Content) {
    return Container(
        margin: EdgeInsets.only(right: 10, left: 10),
        child: TextFormField(
          style: TextStyle(
            color: Colors.black,
            fontSize: 12,
          ),
          // obscureText: true, // 是否显示文字
          // onSaved: (v) => _password = v!,
          decoration: InputDecoration(
              hintText: Content,
              hintStyle: TextStyle(color: Colors.grey),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              ///设置内容内边距
              contentPadding: const EdgeInsets.only(
                top: 0,
                bottom: 0,
              ),
       )
      ),
    );
  }

  Widget SaveButton() {
    return Container(
      child: SizedBox(
        height: 50,
        width: 300,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.lightGreen),
          ),
          child: const Text(
              '保存',
              style: TextStyle(
                  fontSize: 20,
                  color:Colors.white)
          ),
          onPressed: () {
            (_formKey.currentState as FormState).save();
            Map<String,dynamic> result;
            // //TODO 执行登录方法
            // //调用工具类与后端交互
            // Future<String> back=NetUtils.getJson('http://1.117.249.72:8080/user?userID='+_account+'&password='+_password);
            // back.then((value) => handingResult(value));

          },
        ),
      ),
    );
  }

  Widget blank() {
    return Container(
      color: Colors.white,
      height: 20,
    );
  }

  Widget itemCell(String itemTitle, String Content) {
    return Container(
        color: Colors.white,
        child: Column(
            children: <Widget>[
              Container(
                  height: 20,
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
                    ],
                  )
              ),
              modifyTextField(Content),
            ]
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

                      Spacer(),

                      IconButton(onPressed: () { },
                        icon: Icon(
                          Icons.upload_outlined,
                          color: Colors.grey,
                        ),),
                    ]
                )
            ),
            Container(
                margin: EdgeInsets.only(right: 10, left: 10),
                color: Colors.black,
                height: 0.5),
          ],
        )
    );
  }
}