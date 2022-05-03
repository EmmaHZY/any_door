import 'package:flutter/material.dart';
import 'package:any_door/my_colors.dart';
import 'package:any_door/Pages/Login/LoginPage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, // 不显示右上角的 debug
        title: '任易门',
        theme: ThemeData(
          colorScheme: const ColorScheme.light(//有colorscheme属性修改才生效
              primary: MyColors.mPrimaryColor,//主题颜色
              onPrimary: Colors.black26,//主题字体颜色
              onBackground: Colors.white,
              secondary: Colors.yellowAccent),//辅助色，如页面滑动的波纹，与主题色保持类似
        ),
        // 注册路由表
        routes: {
          "/": (context) => const LoginPage(title: "登录"), // 首页路由
        });
  }
}


