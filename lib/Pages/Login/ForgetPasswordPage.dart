import 'package:flutter/material.dart';
import 'package:any_door/my_colors.dart';

import 'LoginPage.dart';
import 'Widget/CodeTimer.dart';

//顶部导航栏实现
class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({Key? key, required this.title}) : super(key: key);
  final String title;


  @override
  ForgetPasswordPageState createState() => ForgetPasswordPageState();
}

class ForgetPasswordPageState extends State<ForgetPasswordPage>
    with SingleTickerProviderStateMixin {

  late TabController tabController;
  var tabs = <Text>[];

  @override
  void initState() {
    super.initState();
    tabs = <Text>[
      const Text('验证手机号'),
      const Text('重置密码'),
    ];

    tabController = TabController(length: tabs.length, vsync: this);
    //.addListener 可以对 TabController 增加监听，每次发生切换，都能够走到方法中
    tabController.addListener(() {
      print(tabController.toString());
      print(tabController.index);
      print(tabController.length);
      print(tabController.previousIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:const Text("找回密码"),
      ),
      body: Column(
        children: <Widget>[
          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: double.infinity,
              minHeight: const Size.fromHeight(kMinInteractiveDimension).height,
            ),
            child: Container(
              color: Colors.white,
              child: TabBar(
                tabs: tabs,
                controller: tabController,
                onTap: (int index) {
                  print('Selected......$index');
                },
                unselectedLabelColor: Colors.grey,
                //设置未选中时的字体颜色
                unselectedLabelStyle: const TextStyle(fontSize: 16),
                //设置未选中时的字体样式
                labelColor: MyColors.mPrimaryColor,
                //设置选中时的字体颜色
                labelStyle: const TextStyle(fontSize: 16),
                //设置选中时的字体样式
                isScrollable: false,
                //isScrollable 默认为false 里面标题平分显示 ；true 可以滚动不平分显示
                indicatorColor: MyColors.mThirdLight,
                //选中下划线的颜色
                indicatorSize: TabBarIndicatorSize.label,
                //选中下划线的长度，label时跟文字内容长度一样，tab时跟一个Tab的长度一样
                indicatorWeight: 4.0, //选中下划线的高度，值越大高度越高，默认为2.0
              ),
            ),
          ),
          Expanded(
              child: TabBarView(
                controller: tabController,
                children: const <Widget>[
                  ResetOnePage(title: "title"),
                  ResetTwoPage(title: "title"),
                ],
              )),
        ],
      ),
    );
  }
}

//页面一
class ResetOnePage extends StatefulWidget {
  const ResetOnePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _ResetOnePageState createState() => _ResetOnePageState();
}

class _ResetOnePageState extends State<ResetOnePage> {
  final GlobalKey _formKey = GlobalKey<FormState>();
  late String _tel,_code;

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
            const SizedBox(height: 60),
            buildTelTextField(), // 手机号输入
            const SizedBox(height: 30),
            buildCode(), // 验证码
            const SizedBox(height: 80),
            buildLoginText(context), // 登录
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
            const Text('想起密码?'),
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

}

//页面二
class ResetTwoPage extends StatefulWidget {
  const ResetTwoPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _ResetTwoPageState createState() => _ResetTwoPageState();
}

class _ResetTwoPageState extends State<ResetTwoPage> {
  final GlobalKey _formKey = GlobalKey<FormState>();
  late String _password,_verify;
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
            const SizedBox(height: 60),
            buildPasswordTextField(context), // 密码输入
            const SizedBox(height: 30),
            buildVerifyPassTextField(context), // 密码验证
            const SizedBox(height: 60),
            buildModifyButton(context), // 按钮
            const SizedBox(height: 40),
            buildLoginText(context), // 登录
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
            const Text('想起密码?'),
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
            //TODO 执行注册方法
            print("修改");
          },
        ),
      ),
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

}










