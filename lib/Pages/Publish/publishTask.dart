import 'package:flutter/material.dart';

// 发布任务页面
class PublishTaskPage extends StatefulWidget {
  const PublishTaskPage({Key? key}) : super(key: key);

  @override
  State<PublishTaskPage> createState() => _PublishTaskPageState();
}

class _PublishTaskPageState extends State<PublishTaskPage> {
  late String _account,_name,_password,_verify,_tel,_code;//获取框的内容
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("对话列表"),),
      body: Form(child: Text("nihao"),
        // child: ListView(
        //   padding: const EdgeInsets.symmetric(horizontal: 10),
        //   children: [
        //     const SizedBox(height: kToolbarHeight), // 距离顶部一个工具栏的高度
        //     buildAccountTextField(), // 账号输入
        //     const SizedBox(height: 15),
        //     buildNameTextField(),//昵称输入
        //     const SizedBox(height: 15),
        //     buildPasswordTextField(context), // 密码输入
        //   ],
        // ),
      ),);
  }
}






