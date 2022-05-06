//发送验证码倒计时模块
import 'dart:async';
import 'dart:math';
import 'package:any_door/Pages/Login/RegisterPage.dart';
import 'package:any_door/account.dart';
import 'package:flutter/material.dart';
import '../../../HttpTools.dart';
import '../../../my_colors.dart';

class CodeTimer extends StatefulWidget {
  const CodeTimer({Key? key}) : super(key: key);

  @override
  _CodeTimerState createState() => _CodeTimerState();
}

class _CodeTimerState extends State<CodeTimer> {
  late Timer _timer;
  int judge=0;//辅助判断
  late String _verificationCode;//生成的验证码
  var _countdownTime = 0;//倒计时数值

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: FlatButton(
        disabledColor:MyColors.mPrimaryColor,
        splashColor: MyColors.mThirdLight,
        highlightColor: MyColors.mThirdLight,
        hoverColor: MyColors.mThirdLight,
        color: MyColors.mPrimaryColor,
        padding: const EdgeInsets.only(right: 0),
        child: Text(handleCodeAutoSizeText(),
            style: const TextStyle(
              color: Colors.white,

            )),
        onPressed:_countdownTime==0?btnPress():null,
      ),
      borderRadius: const BorderRadius.only(
          topRight: Radius.circular(50),
          bottomRight: Radius.circular(50)
      ),
    );

  }

  btnPress(){
    if(_countdownTime==0) {
      return () {
        startCountdown();
        randomCode();//先成验证码
        //NetUtils.postFormDataClient(,_verificationCode);//验证码发送
        print(Account.tel);
        print(_verificationCode);
      };
    }
  }

  //倒计时方法
  startCountdown() {
    print("开始");
    //倒计时时间
    _countdownTime = 60;
    print({
      _countdownTime:_countdownTime
    });
    if (judge == 0) {
      print("开启定时器");
      _timer = Timer.periodic(const Duration(seconds: 1), call);
      judge=1;
    }
  }

  //生成验证码的函数
  void randomCode()
  {
    String vessel = '0123456789'; //每一位的数据选择容器
    _verificationCode = '';//初始化结果
    for (int i = 0; i < 6; i++) {
      _verificationCode = _verificationCode + vessel[Random().nextInt(vessel.length)];
    }
    print( _verificationCode);
  }

  //文本控制
  String handleCodeAutoSizeText() {
    if (_countdownTime > 0) {
      return '$_countdownTime'+'s后重新发送';
    } else
      return '获取验证码';
  }

  //倒计时控制
  call (timer) {
    if (_countdownTime < 1) {
      print("定时器取消了");
      _timer.cancel();
      judge=0;
    } else {
    setState(() {
    _countdownTime -= 1;
    });
    }
    print(_countdownTime);
  }

  @override
  void dispose() {
    super.dispose();
    print("销毁啦");
    _timer.cancel();
    judge=0;
  }
}




