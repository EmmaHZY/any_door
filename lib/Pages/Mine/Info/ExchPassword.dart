import 'dart:convert';
import 'dart:ui';

import 'package:any_door/Pages/Mine/MinePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:any_door/my_colors.dart';
import '../../../HttpTools.dart';
import '../../../account.dart';

class ExchPasswordPage extends StatefulWidget {
  // const ModifyPage({Key? key, String? name, String? title,id}) : super(key: key);
  String userID;
  ExchPasswordPage({Key? key,required this.userID}):super(key:key);
  // const ExchPasswordPage({Key? key}): super(key: key);
  @override
  _ExchPasswordPageState createState() => _ExchPasswordPageState();

}

class _ExchPasswordPageState extends State<ExchPasswordPage> {
  final GlobalKey _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, //防止键盘溢出
      appBar: AppBar(
        //automaticallyImplyLeading: false,//去掉leading位置的返回箭头
        centerTitle: true,
        backgroundColor: MyColors.mTaskColor,
        title: Text(
          "修改密码",
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: ResetPassword(userID: widget.userID),
    );
  }
}


class ResetPassword extends StatefulWidget {
  // const ModifyPage({Key? key, String? name, String? title,id}) : super(key: key);
  String userID;
  ResetPassword({Key? key, required this.userID}):super(key:key);
  // const ExchPasswordPage({Key? key}): super(key: key);
  @override
  _ResetPasswordState createState() => _ResetPasswordState();

}

class _ResetPasswordState extends State<ResetPassword> {
  final GlobalKey _formKey = GlobalKey<FormState>();
  late String _old,_password,_verify;
  bool _isObscure = true;
  bool _isObscure1 = true;
  Color _eyeColor = Colors.grey;
  Color _eyeColor1 = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey, // 设置globalKey，用于后面获取FormState
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          children: [
            const SizedBox(height: kToolbarHeight), // 距离顶部一个工具栏的高度
            confirmPasswordTextField(context),
            const SizedBox(height: 30),
            buildPasswordTextField(context), // 密码输入
            const SizedBox(height: 30),
            buildVerifyPassTextField(context), // 密码验证
            const SizedBox(height: 60),
            buildModifyButton(context), // 按钮
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget buildModifyButton(BuildContext context) {
    return Align(
      child: SizedBox(
        height: 45,
        width: 270,
        child: ElevatedButton(
          style: ButtonStyle(
            // 设置圆角
              shape: MaterialStateProperty.all(const StadiumBorder(
                  side: BorderSide(style: BorderStyle.none)))),
          child: const Text(
              '确认修改',
              style: TextStyle(
                  fontSize: 20,
                  color:Colors.white)
          ),
          onPressed: () {
            (_formKey.currentState as FormState).save();
            //TODO 执行修改方法
            if(_password==_verify) { //密码相等
              String send="{\"userID\":\""+widget.userID+"\","+"\"passwordOld\":\""+_old+"\","+"\"passwordNew\":\""+_password+"\"}";
              print(send);
              Future<String> back=NetUtils.putJson('http://1.117.249.72:8080/user',send);
              back.then((value) => handingResult(value));
            }
            else{
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const AlertDialog(
                    title: Text("提示"),
                    content: Text("两次密码不一致，请重新输入"),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }

  handingResult(String value) async {
    Map<String, dynamic> result = json.decode(value); //结果的map对象
    print(result);
    if (result["meta"]["status"] == "202") {//修改成功
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("提示"),
            content: const Text("密码已修改成功"),
            actions: [
              FlatButton(onPressed: () {
                Navigator.pop(context,true);
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) {
                //       return const MinePage();
                //     },
                //   ),
                // );
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

  Widget buildVerifyPassTextField(BuildContext context) {
    return TextFormField(
        obscureText: _isObscure1, // 是否显示文字
        onSaved: (v) => _verify= v!,
        decoration: InputDecoration(
            labelText: "New Password Again",
            hintText: '请再次新输入密码',
            /// 边框
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                /// 里面的数值尽可能大才是左右半圆形，否则就是普通的圆角形
                Radius.circular(50),
              ),
            ),

            ///设置内容内边距
            contentPadding: const EdgeInsets.only(
              top: 0,
              bottom: 0,
            ),
            /// 前缀图标
            prefixIcon: const Icon(Icons.lock),
            suffixIcon: IconButton(
              icon: Icon(
                Icons.remove_red_eye,
                color: _eyeColor1,
              ),
              onPressed: () {
                // 修改 state 内部变量, 且需要界面内容更新, 需要使用 setState()
                setState(() {
                  _isObscure1 = !_isObscure1;
                  _eyeColor1 = (_isObscure1
                      ? Colors.grey
                      : Theme.of(context).iconTheme.color)!;
                });
              },
            )));
  }

  Widget buildPasswordTextField(BuildContext context) {
    return TextFormField(
        obscureText: _isObscure, // 是否显示文字
        onSaved: (v) => _password = v!,
        decoration: InputDecoration(
            labelText: "New Password",
            hintText: '请输入新密码',
            /// 边框
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                /// 里面的数值尽可能大才是左右半圆形，否则就是普通的圆角形
                Radius.circular(50),
              ),
            ),

            ///设置内容内边距
            contentPadding: const EdgeInsets.only(
              top: 0,
              bottom: 0,
            ),
            /// 前缀图标
            prefixIcon: const Icon(Icons.lock),
            suffixIcon: IconButton(
              icon: Icon(
                Icons.remove_red_eye,
                color: _eyeColor,
              ),
              onPressed: () {
                // 修改 state 内部变量, 且需要界面内容更新, 需要使用 setState()
                setState(() {
                  _isObscure = !_isObscure;
                  _eyeColor = (_isObscure
                      ? Colors.grey
                      : Theme.of(context).iconTheme.color)!;
                });
              },
            )));
  }

  Widget confirmPasswordTextField(BuildContext context) {
    return TextFormField(
        obscureText: _isObscure, // 是否显示文字
        onSaved: (v) => _old = v!,
        decoration: InputDecoration(
            labelText: "Old Password",
            hintText: '请输入原密码',
            /// 边框
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                /// 里面的数值尽可能大才是左右半圆形，否则就是普通的圆角形
                Radius.circular(50),
              ),
            ),

            ///设置内容内边距
            contentPadding: const EdgeInsets.only(
              top: 0,
              bottom: 0,
            ),
            /// 前缀图标
            prefixIcon: const Icon(Icons.lock),
            suffixIcon: IconButton(
              icon: Icon(
                Icons.remove_red_eye,
                color: _eyeColor,
              ),
              onPressed: () {
                // 修改 state 内部变量, 且需要界面内容更新, 需要使用 setState()
                setState(() {
                  _isObscure = !_isObscure;
                  _eyeColor = (_isObscure
                      ? Colors.grey
                      : Theme.of(context).iconTheme.color)!;
                });
              },
            )));
  }

}
