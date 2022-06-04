import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:any_door/my_colors.dart';
import 'package:flutter/services.dart';

import '../../HttpTools.dart';
import '../../account.dart';
import 'LoginPage.dart';
import 'Widget/CodeTimer.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey _formKey = GlobalKey<FormState>();
  late String _account,_name,_password,_verify,_tel,_code;//用户填写
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
            buildTitle(), // 页面标题
            const SizedBox(height: 15),
            SizedBox(//logo
              width: MediaQuery.of(context).size.width, // 屏幕宽度
              child: Image.asset(
                'assets/logo1.png',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 25),
            buildAccountTextField(), // 账号输入
            const SizedBox(height: 15),
            buildNameTextField(),//昵称输入
            const SizedBox(height: 15),
            buildPasswordTextField(context), // 密码输入
            const SizedBox(height: 15),
            buildVerifyPassTextField(context), // 密码验证
            const SizedBox(height: 15),
            buildTelTextField(), // 手机号输入
            const SizedBox(height: 15),
            buildCode(),//验证码
            const SizedBox(height: 25),
            buildRegisterButton(context), // 按钮
            const SizedBox(height: 10),
            buildLoginText(context), // 返回登录
          ],
        ),
      ),
    );
  }


  Widget buildLoginText(context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('已有账号?'),
            GestureDetector(
              child: const Text('点击登录', style: TextStyle(color: MyColors.mPrimaryColor)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const LoginPage(title: 'title',);
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

  //请求发送前的处理
  bool beforeSend(){
    if(_password!=_verify) {//判断两次密码输入是否一致
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const AlertDialog(
            title: Text("提示"),
            content: Text("两次密码输入不一致，请重试"),
          );
        },
      );
      return false;
    }
    if(_code!=Account.code){//判断验证码的正确性
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const AlertDialog(
            title: Text("提示"),
            content: Text("验证码错误，请重试"),
          );
        },
      );
      return false;
    }
    return true;
  }

  //对注册结果的处理
  handingResult(String value) async {
    print(value);
    Map<String, dynamic> result = json.decode(value); //结果的map对象
    if (result["meta"]["status"] == "201") {//注册成功
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("提示"),
            content: const Text("注册成功，请登录"),
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
    else { //注册失败
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const AlertDialog(
            title: Text("提示"),
            content: Text("账号或手机号已存在，请重试"),
          );
        },
      );
    }
  }

  Widget buildRegisterButton(BuildContext context) {
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
              '注  册',
              style: TextStyle(
                  fontSize: 20,
                  color:Colors.white)
          ),
          onPressed: () {
            (_formKey.currentState as FormState).save();
            //TODO 执行注册方法
            if(beforeSend()){//前面的验证成立
              //调用工具与后端交互
              String send="{\"userID\":\""+_account+"\","+"\"username\":\""+_name+"\","+"\"password\":\""+_password+"\","+"\"telNum\":\""+_tel+"\"}";
              Future<String> back=NetUtils.postJson('http://1.117.249.72:8080/user',send);
              back.then((value) => handingResult(value));
            }
          },
        ),
      ),
    );
  }

  Widget buildCode(){
    return IntrinsicHeight(
      child: Row(
      children: [
      Expanded(
      flex: 9,
      child: buildCodeTextField(),
    ),
    const Expanded(
    flex: 5,
    child: SizedBox(
      child:  CodeTimer(),
      height: double.infinity,
    )
    ),
    // const CodeTimer(),
    ],
    ));
  }


  Widget buildCodeTextField() {
    double width = MediaQuery.of(context).size.width;
    return TextFormField(
           decoration: const InputDecoration(
             labelText: 'Code',
             hintText: '请输入验证码',
             /// 边框
             border: OutlineInputBorder(
               borderRadius: BorderRadius.only(
                   topLeft: Radius.circular(50),
                   bottomLeft: Radius.circular(50)
               ),
             ),
             ///设置内容内边距
             contentPadding: EdgeInsets.only(
               top: 0,
               bottom: 0,
             ),
             /// 前缀图标
             prefixIcon: Icon(Icons.verified_user),
           ),
      onSaved: (v) => _code = v!,
          );
  }


  Widget buildTelTextField() {
        return TextFormField(
            onChanged: (value){//实时记录文本框数据
              Account.tel= value;
            },
            decoration: const InputDecoration(
          labelText: 'Tel',
          hintText: '请输入手机号',
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
          prefixIcon: Icon(Icons.phone_iphone),
        ),
        onSaved: (v) => _tel = v!
      );
  }

  Widget buildVerifyPassTextField(BuildContext context) {
    return TextFormField(
        obscureText: _isObscure1, // 是否显示文字
        onSaved: (v) => _verify= v!,
        decoration: InputDecoration(
            labelText: "PasswordAgain",
            hintText: '请再次输入密码',
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

  Widget buildNameTextField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Name',
        hintText: '请输入昵称',
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
        prefixIcon: Icon(Icons.face),
      ),
      onSaved: (v) => _name = v!,
    );
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
          "用户注册",
          textAlign: TextAlign.center,//水平居中
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}






