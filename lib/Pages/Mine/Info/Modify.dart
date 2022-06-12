import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:any_door/my_colors.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:image_picker/image_picker.dart';
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
  late String name1,autograph1,QQ1,wechat1,tel1,school1,image1=widget.image,sex1;
  final GlobalKey _formKey = GlobalKey<FormState>();
  TextEditingController emailController = new TextEditingController();
  TextEditingController emailController1 = new TextEditingController();
  TextEditingController emailController2 = new TextEditingController();
  TextEditingController emailController3 = new TextEditingController();
  TextEditingController emailController4 = new TextEditingController();
  TextEditingController emailController5 = new TextEditingController();
  TextEditingController emailController6 = new TextEditingController();
  TextEditingController emailController7 = new TextEditingController();
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
              buildPublishButton(), //修改按钮
              // SaveButton(),
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
              Container(
                child: Row(
                  children: [
                    HeadImage(),
                    Spacer(),
                    buildPhoto(),
                    Container(
                      width: 10,
                    )
                  ],
                ),
              ),
              // HeadImage(),
              // buildPhoto(), //图片上传函数
              Container(
                  margin: EdgeInsets.only(right: 10, left: 10),
                  color: Colors.grey,
                  height: 1), //分割线
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
                  // (_formKey.currentState as FormState).save();
                  Map<String,dynamic> result;
                  // //TODO 执行登录方法
                  // //调用工具类与后端交互
                  // Future<String> back=NetUtils.getJson('http://1.117.249.72:8080/user?userID='+_account+'&password='+_password);
                  // back.then((value) => handingResult(value));
                  log(emailController1.text);
                  log(emailController2.text);
                  log(emailController3.text);
                  log(emailController4.text);
                  log(emailController5.text);
                  log(emailController6.text);
                  log(emailController7.text);
                  // String send="{\"userID\":\""+Account.account+"\","+"\"personimage\":\""+image1+"\","+"\"personlabel\":\""+autograph1+"\","
                  //     ""+"\"name\":\""+name1+"\","+"\"place\":\""+school1+"\","+"\"QQ\":\""+QQ1+"\","+"\"wechat\":\""+wechat1+"\","
                  //     ""+"\"tel_num\":\""+tel1+"\","+"\"personimage\":\""+sex1+"\"}";
                  // log(jsonEncode(send));
                  // Future<Uint8List> back = NetUtils.putJsonBytes(
                  //     'http://1.117.239.54:8080/user?operation=changeMe',send);
                  // back.then((value) => handingResult(value));
                },
              ),
            ),
          ]
        )
    );
  }

  handingResult(String value) async {
    Map<String, dynamic> result = json.decode(value); //结果的map对象
    if (result["meta"]["status"] == "202") {//修改成功
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("提示"),
            content: const Text("修改成功"),
            actions: [
              FlatButton(onPressed: () {
                Navigator.pop(context,true);
              }, child: const Text("确定")),
            ],
          );
        },
      );
    }
    else { //修改失败
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const AlertDialog(
            title: Text("提示"),
            content: Text("修改失败，请重试"),
          );
        },
      );
    }
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
                  child:TextField(
                    controller: emailController1,//指定controller
                    obscureText: false,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: Content,
                      hintStyle: TextStyle(color: Colors.grey),),
                  )
              ),
              Container(
                  margin: EdgeInsets.only(right: 10, left: 10),
                  color: Colors.grey,
                  height: 1), //分割线
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
                  child:TextField(
                    controller: emailController2,//指定controller
                    obscureText: false,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: Content,
                      hintStyle: TextStyle(color: Colors.grey),),
                  )
              ),
              Container(
                  margin: EdgeInsets.only(right: 10, left: 10),
                  color: Colors.grey,
                  height: 1), //分割线
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
                  child:TextField(
                    controller: emailController3,//指定controller
                    obscureText: false,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: Content,
                      hintStyle: TextStyle(color: Colors.grey),),
                  )
              ),
              Container(
                  margin: EdgeInsets.only(right: 10, left: 10),
                  color: Colors.grey,
                  height: 1), //分割线
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
                  child:TextField(
                    controller: emailController4,//指定controller
                    obscureText: false,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: Content,
                      hintStyle: TextStyle(color: Colors.grey),),
                  )
              ),
              Container(
                  margin: EdgeInsets.only(right: 10, left: 10),
                  color: Colors.grey,
                  height: 1),
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
                  child:TextField(
                    controller: emailController5,//指定controller
                    obscureText: false,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: Content,
                      hintStyle: TextStyle(color: Colors.grey),),
                  )
              ),
              Container(
                  margin: EdgeInsets.only(right: 10, left: 10),
                  color: Colors.grey,
                  height: 1),
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
                  child:TextField(
                    controller: emailController6,//指定controller
                    obscureText: false,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: Content,
                      hintStyle: TextStyle(color: Colors.grey),),
                  )
              ),
              Container(
                  margin: EdgeInsets.only(right: 10, left: 10),
                  color: Colors.grey,
                  height: 1),
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
                  child:TextField(
                    controller: emailController7,//指定controller
                    obscureText: false,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: Content,
                      hintStyle: TextStyle(color: Colors.grey),),
                  )
              ),
              Container(
                  margin: EdgeInsets.only(right: 10, left: 10),
                  color: Colors.grey,
                  height: 1),
            ]
        )
    );
  }

  //图片函数
  File? _image;
  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  Widget Img() {
    // print(_image);
    if (_image == null) {
      return Text('上传头像  ');
    } else {
      return Image.file(_image!,width: 60);
    }
  }



  Widget buildPhoto() {
    return InkWell(
      child: Row(children: [
        Img(),
        Container(
          width: 5,
        ),
        ElevatedButton(onPressed: getImage, child: Icon(Icons.add_a_photo))
      ]),
    );
  }

  //确认修改的按钮
  Widget buildPublishButton() {
    return Align(
      child: SizedBox(
        height: 45,
        width: 270,
        child: ElevatedButton(
          child: const Text('确认修改',
              style: TextStyle(fontSize: 20, color: Colors.white)),
          onPressed: () {
            // print(_part);
            if(_image!=null) {
              Future<String> back = NetUtils.postFile(_image!.path);
              back.then((value) => publishTaskFinal(value));
            }
            else {
              publishTaskFinal(image1);
             // log(image1);
            }
          },
        ),
      ),
    );
  }

  publishTaskFinal(String value) async {
    // log(value);
    String send = "{\"userID\":\"" +
        Account.account +
        "\"," +
        "\"personlabel\":\"" +
        emailController3.text.toString() +
        "\"," +
        "\"personimage\":\"" +
        value +
        "\"," +
        "\"name\":\"" +
        emailController1.text.toString() +
        "\"," +
        "\"Place\":\"" +
        emailController4.text.toString() +
        "\"," +
        "\"QQ\":\"" +
        emailController5.text.toString() +
        "\"," +
        "\"weChat\":\"" +
        emailController6.text.toString() +
        "\"," +
        "\"tel_num\":\"" +
        emailController7.text.toString() +
        "\"," +
        "\"sex\":\"" +
        emailController2.text.toString() +
        "\"}";
    // print(send);

    Future<Uint8List> back = NetUtils.putJsonBytes(
        'http://1.117.239.54:8080/user?operation=changeMe', send);

    back.then((res) {
      Map<String, dynamic> result = json.decode(utf8.decode(res)); //结果的map对象

      if (result["meta"]["status"] == "202") {
        showCupertinoDialog(
            context: context,
            builder: (BuildContext context) {
              return CupertinoAlertDialog(
                title: const Text("提示"),
                content: const Text("修改资料成功"),
                actions: [
                  FlatButton(
                      onPressed: (() {
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      }),
                      child: const Text("确定"))
                ],
              );
            });
      } else {
        showCupertinoDialog(
            context: context,
            builder: (BuildContext context) {
              return CupertinoAlertDialog(
                title: const Text("提示"),
                content: const Text("修改资料失败，请重试"),
                actions: [
                  FlatButton(
                      onPressed: (() {
                        Navigator.of(context).pop();
                      }),
                      child: const Text("确定"))
                ],
              );
            });
      }
    });
  }

  Widget HeadImage() {
    return Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
                height: 50,
                margin: EdgeInsets.only(right: 10, left: 10,bottom: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      const Text("头像  ",
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
                            image1,
                            width: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      // Spacer(),

                      // IconButton(onPressed: () { },
                      //   icon: Icon(
                      //     Icons.upload_outlined,
                      //     color: Colors.grey,
                      //   ),),
                    ]
                )
            ),
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
    if(emailController1.text=='')emailController1.text=widget.name;
    if(emailController2.text=='')emailController2.text=widget.sex;
    if(emailController3.text=='')emailController3.text=widget.autograph;
    if(emailController4.text=='')emailController4.text=widget.school;
    if(emailController5.text=='')emailController5.text=widget.QQ;
    if(emailController6.text=='')emailController6.text=widget.wechat;
    if(emailController7.text=='')emailController7.text=widget.tel;
    //log("!!111:getdata-------");
    // 执行查看全部任务方法
    // Future<Uint8List> back = NetUtils.getJsonBytes(
    //     'http://1.117.239.54:8080/user?operation=getMe&index='+Account.account);
    //     Future<Uint8List> back = NetUtils.getJsonBytes(
    // 'http://1.117.239.54:8080/task?operation=getAll&index=&key=');
    // back.then((value) {
    //   // print("!!!1111:handlingResult---------");
    //   Map<String, dynamic> result = json.decode(utf8.decode(value)); //结果的map对象
    //   // log(result);
    //   // log(jsonEncode(result));
    //   //重新加载页面
    //   setState(() {
    //     // print("setstate");
    //   });
    // });
  }
}