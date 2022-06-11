import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:any_door/my_colors.dart';
import '../../../HttpTools.dart';
import '../../../account.dart';

class ModifyPage extends StatefulWidget {
  // const ModifyPage({Key? key, String? name, String? title,id}) : super(key: key);

  String name,userID,autograph,QQ,wechat,tel,school,image,sex;
  ModifyPage({
    Key? key,required this.image,required this.sex, required this.name,required this.userID,required this.autograph,required this.school,
    required this.QQ,required this.wechat,required this.tel
  }): super(key: key);
  @override
  _ModifyPageState createState() => _ModifyPageState();

}

class _ModifyPageState extends State<ModifyPage> {
  late String name1=widget.name,autograph1=widget.autograph,QQ1=widget.QQ,
      wechat1=widget.wechat,tel1=widget.tel,school1=widget.school,image1=widget.image,sex1=widget.sex;
  final GlobalKey _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,//防止键盘溢出
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
          // color: MyColors.mTaskColor,
          color: Colors.white,
          child: Column(
            children: <Widget>[
              DataEdit(),
              SaveButton(),
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
        height: 580,
        child: SingleChildScrollView(//实现页面上下滑动
          child: Column(
            children: <Widget>[
              blank(),
              HeadImage(),
              // blank(),
              // itemCell("学号", widget.userID),
              blank(),
              itemCell1("昵称", widget.name),
              blank(),
              itemCell2("性别", widget.sex),
              blank(),
              itemCell3("个性签名", widget.autograph),
              blank(),
              itemCell4("校区", widget.school),
              blank(),
              itemCell5("QQ", widget.QQ),
              blank(),
              itemCell6("微信", widget.wechat),
              blank(),
              itemCell7("手机号", widget.tel),
              blank(),
              // itemCell("收货地址", widget.area),
              // blank(),
              // SaveButton(),
              Container(
                color: Colors.white,
                height: 200,
              ),
            ],
          ),
        )
      );
  }

  Widget modifyTextField(String Content) {
    return Container(
        margin: EdgeInsets.only(right: 10, left: 10),
        child: TextFormField(
            // onSaved: (v) => Data[index] = v!,
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
                  String send="{\"userID\":\""+Account.account+"\","+"\"personimage\":\""+image1+"\","+"\"personlabel\":\""+autograph1+"\","
                      ""+"\"name\":\""+name1+"\","+"\"place\":\""+school1+"\","+"\"QQ\":\""+QQ1+"\","+"\"wechat\":\""+wechat1+"\","
                      ""+"\"tel_num\":\""+tel1+"\","+"\"personimage\":\""+sex1+"\"}";
                  log(jsonEncode(send));
                  Future<Uint8List> back = NetUtils.putJsonBytes(
                      'http://1.117.239.54:8080/user?operation=changeMe',send);
                },
              ),
            ),
          ]
        )
    );
  }


  Widget blank() {
    return Container(
      color: Colors.white,
      height: 20,
    );
  }

  Widget itemCell1(String itemTitle, String Content) {
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
              Container(
                margin: EdgeInsets.only(right: 10, left: 10),
                child: TextFormField(
                    onSaved: (v) => name1= v!,
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
              )
            ]
        )
    );
  }
  Widget itemCell2(String itemTitle, String Content) {
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
              Container(
                margin: EdgeInsets.only(right: 10, left: 10),
                child: TextFormField(
                    onSaved: (v) => sex1= v!,
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
              )
            ]
        )
    );
  }
  Widget itemCell3(String itemTitle, String Content) {
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
              Container(
                margin: EdgeInsets.only(right: 10, left: 10),
                child: TextFormField(
                    onSaved: (v) => autograph1= v!,
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
              )
            ]
        )
    );
  }
  Widget itemCell4(String itemTitle, String Content) {
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
              Container(
                margin: EdgeInsets.only(right: 10, left: 10),
                child: TextFormField(
                    onSaved: (v) => school1= v!,
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
              )
            ]
        )
    );
  }
  Widget itemCell5(String itemTitle, String Content) {
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
              Container(
                margin: EdgeInsets.only(right: 10, left: 10),
                child: TextFormField(
                    onSaved: (v) => QQ1= v!,
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
              )
            ]
        )
    );
  }
  Widget itemCell6(String itemTitle, String Content) {
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
              Container(
                margin: EdgeInsets.only(right: 10, left: 10),
                child: TextFormField(
                    onSaved: (v) => wechat1= v!,
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
              )
            ]
        )
    );
  }
  Widget itemCell7(String itemTitle, String Content) {
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
              Container(
                margin: EdgeInsets.only(right: 10, left: 10),
                child: TextFormField(
                    onSaved: (v) => tel1= v!,
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
              )
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
                          child:Image.network(
                            widget.image,
                            width: 50,
                            fit: BoxFit.cover,
                          ),
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

      // if(result["data"][0]["personlabel"]==null)autograph="无";
      // else autograph=(result["data"][0]["personlabel"]);

      // log(image);
      // Iterable list = result["data"];
      // activeTasks = list.map((model) => TaskModel.fromMap(model)).toList();
      //重新加载页面
      setState(() {
        // print("setstate");
      });
    });
  }
}