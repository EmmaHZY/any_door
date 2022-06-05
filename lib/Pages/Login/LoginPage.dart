import 'dart:io';
import 'dart:convert';

import 'package:any_door/Pages/Home/BottomTabBar.dart';
import 'package:flutter/material.dart';
import 'package:any_door/my_colors.dart';
import 'package:im_flutter_sdk/im_flutter_sdk.dart';

import '../../HttpTools.dart';
import '../../account.dart';
import 'ForgetPasswordPage.dart';
import 'RegisterPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey _formKey = GlobalKey<FormState>();
  late String _account, _password;
  bool _isObscure = true;
  Color _eyeColor = Colors.grey;

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
            buildTitle(), // 页面标题
            const SizedBox(height: 25),
            SizedBox(//logo
              width: MediaQuery.of(context).size.width, // 屏幕宽度
              child: Image.asset(
                'assets/logo.png',
                fit: BoxFit.cover,
              ),
            ),//logo
            const SizedBox(height: 60),
            buildAccountTextField(), // 账号输入
            const SizedBox(height: 30),
            buildPasswordTextField(context), // 密码输入
            buildForgetPasswordText(context), // 忘记密码
            const SizedBox(height: 60),
            buildLoginButton(context), // 登录按钮
            const SizedBox(height: 40),
            buildRegisterText(context), // 跳转注册
          ],
        ),
      ),
    );
  }

  Widget buildRegisterText(context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('没有账号?'),
            GestureDetector(
              child: const Text('点击注册', style: TextStyle(color: MyColors.mPrimaryColor)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const RegisterPage(title: 'title',);
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  //对登录结果的处理
  handingResult(String value) async {
    Map<String, dynamic> result = json.decode(value); //结果的map对象
    if (result["meta"]["status"] == "200") //登录成功
        {//初始化聊天的第三方平台客户端
      EMOptions options = EMOptions(appKey: "1127220429113032#test");
      EMClient.getInstance.init(options);
      try {
        await EMClient.getInstance.login(_account, _password);
      } on EMError catch (e) {
        debugPrint("error code: ${e.code}, desc: ${e.description}");
      }
      Account.account = _account; //账号赋值，用于传参
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const BottomTabBar(title: 'title',);
          },
        ),
      ).then((data)=>null);
    }
    else { //弹窗提示登录失败
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("提示"),
            content: const Text("账号或密码错误，请重试"),
            actions: [
              FlatButton(onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const LoginPage(title: 'title',);
                    },
                  ),
                );
              }, child: const Text("确定")),
            ],
          );
        },
      );
    }
  }


  Widget buildLoginButton(BuildContext context) {
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
              '登  录',
              style: TextStyle(
                  fontSize: 20,
                  color:Colors.white)
          ),
          onPressed: () {
            (_formKey.currentState as FormState).save();
            //TODO 执行登录方法
            //调用工具类与后端交互
            Future<String> back=NetUtils.getJson('http://1.117.249.72:8080/user?userID='+_account+'&password='+_password);
            back.then((value) => handingResult(value));
          },
        ),
      ),
    );
  }


  Widget buildForgetPasswordText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Align(
        alignment: Alignment.centerRight,
        child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const ForgetPasswordPage(title: 'title',);
                },
              ),
            );
          },
          child: const Text("忘记密码？",
              style: TextStyle(fontSize: 14, color: Colors.grey)),
        ),
      ),
    );
  }

  Widget buildPasswordTextField(BuildContext context) {
    return TextFormField(
        obscureText: _isObscure, // 是否显示文字
        onSaved: (v) => _password = v!,
        decoration: InputDecoration(
            labelText: "Password",
            hintText: '请输入密码',
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

  Widget buildAccountTextField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Account',
        hintText: '请输入账号',
        /// 边框
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            /// 里面的数值尽可能大才是左右半圆形，否则就是普通的圆角形
            Radius.circular(50),
          ),
        ),

        ///设置内容内边距
        contentPadding: EdgeInsets.only(
          top: 0,
          bottom: 0,
        ),
        /// 前缀图标
        prefixIcon: Icon(Icons.account_circle),
      ),
      onSaved: (v) => _account = v!,
    );
  }


  Widget buildTitle() {
    return const Padding(
        padding: EdgeInsets.all(1),
        child: Center(//控件居中
          child: Text(
            "用户登录",
            textAlign: TextAlign.center,//水平居中
            style: TextStyle(fontSize: 16),
          ),
        ),
    );
  }
}

