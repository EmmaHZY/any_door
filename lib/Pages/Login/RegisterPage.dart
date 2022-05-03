import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:any_door/my_colors.dart';

import 'LoginPage.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey _formKey = GlobalKey<FormState>();
  late String _account,_name,_password,_verify,_tel,_code;
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
            buildCodeTextField(), // 验证码输入
            const SizedBox(height: 25),
            buildRegisterButton(context), // 按钮
            const SizedBox(height: 10),
            buildLoginText(context), // 注册
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
            print("注册");
          },
        ),
      ),
    );
  }

//  发送请求
  // _getIPAddress() async {
  //   var url = 'http://1.117.249.72:8080/user?userID='+_account+'&password='+_password;
  //   print(url);
  //   var httpClient = HttpClient();
  //
  //   String result;
  //   try {
  //     var request = await httpClient.getUrl(Uri.parse(url));
  //     var response = await request.close();
  //     if (response.statusCode == HttpStatus.OK) {
  //       var json = await response.transform(utf8.decoder).join();
  //       var data = jsonDecode(json);
  //       result = data['meta']['msg'];
  //     } else {
  //       result =
  //       'Error getting IP address:\nHttp status ${response.statusCode}';
  //     }
  //   } catch (exception) {
  //     result = 'Failed getting IP address';
  //   }
  //
  //   // If the widget was removed from the tree while the message was in flight,
  //   // we want to discard the reply rather than calling setState to update our
  //   // non-existent appearance.
  //   if (!mounted) return;
  //   print(result);
  // }

  // Widget buildCodeTextField() {
  //   return TextFormField(
  //     decoration: const InputDecoration(
  //       labelText: 'Code',
  //       hintText: '请输入验证码',
  //       /// 边框
  //       border: OutlineInputBorder(
  //         borderRadius: BorderRadius.all(
  //           /// 里面的数值尽可能大才是左右半圆形，否则就是普通的圆角形
  //           Radius.circular(50),
  //         ),
  //       ),
  //
  //       ///设置内容内边距
  //       contentPadding: EdgeInsets.only(
  //         top: 0,
  //         bottom: 0,
  //       ),
  //       /// 前缀图标
  //       prefixIcon: Icon(Icons.verified_user),
  //     ),
  //     onSaved: (v) => _code = v!,
  //   );
  // }

  Widget buildCodeTextField() {
    double width = MediaQuery.of(context).size.width;

    return Container(
        height: 48,
        decoration: UnderlineTabIndicator(
            borderSide:
            BorderSide(width: 0.5, color: Color.fromRGBO(237, 237, 237, 1)),
            insets: EdgeInsets.zero),
        child: Stack(
          children: <Widget>[
            Positioned(
              left: 15,
              right: 120,
              top: 20,
              height: 20,
              child: TextField(
                controller: _phoneCodeEditController,
                focusNode: _phoneCodeFocusNode,
                decoration: InputDecoration(
                  hintText: "请输入验证码",
                ),
                inputFormatters: <TextInputFormatter>[
                  WhitelistingTextInputFormatter.digitsOnly, //只输入数字
                  LengthLimitingTextInputFormatter(6) //限制长度
                ],
              ),
            ),
            Positioned(
              // right: width-15,
              left: width - 115,
              top: 10,
              // bottom: 10,
              child: Container(
                  width: 100,
                  height: 28,
                  decoration: new BoxDecoration(
                    border: new Border.all(
                        color: _isAvailableGetVCode
                            ? Color(0xFF47CCA0)
                            : Color(0xFFCCCCCC),
                        width: 0.5),
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  ),
                  child: FlatButton(
                    // disabledColor: Color(0xFFCCCCCC),
                    onPressed: _seconds == widget.countdown
                        ? () {
                      if (checkPhoneNumber()) {
                        _startTimer();
                        print('1111');
                        gettestPhoneCode().then((data) {
                        });
                      } else {
                        ToastUtils.showText(context, msg: '请输入正确的手机号码');
                      }
                    }
                        : null,
                    child: Text(
                      '获取验证码',
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 12,
                        color: _isAvailableGetVCode
                            ? Color(0xFF47CCA0)
                            : Color(0xFFCCCCCC),
                      ),
                    ),
                  )),
            ),
          ],
        ));
  }




  Widget buildTelTextField() {
    return TextFormField(
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
      onSaved: (v) => _tel = v!,
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



