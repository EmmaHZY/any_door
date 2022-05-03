import 'package:flutter/material.dart';
import 'package:any_door/my_colors.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("找回密码"),
      ),
    );
  }
}
