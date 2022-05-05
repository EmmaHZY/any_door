//发送验证码倒计时模块
import 'dart:async';
import 'package:flutter/material.dart';


class CodeTimer extends StatefulWidget {
  const CodeTimer({Key? key}) : super(key: key);

  @override
  _CodeTimerState createState() => _CodeTimerState();
}

class _CodeTimerState extends State<CodeTimer> {
  late Timer _timer;

  //倒计时数值
  var _countdownTime = 0;
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      disabledColor:HspColor.btn_disabledColor,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      color: HspColor.btn_oringe,
      padding: EdgeInsets.only(right: 0),
      child: Text(handleCodeAutoSizeText(),
          style: TextStyle(
            color: Colors.white,
          )),
      onPressed:_countdownTime==0?btnPress():null,
    );
  }

  btnPress(){
    if(_countdownTime==0) {
      return () {
        startCountdown();
      };
    }
  }

  String handleCodeAutoSizeText() {
    if (_countdownTime > 0) {
      return '$_countdownTime'+'s后重新发送';
    } else
      return '获取验证码';
  }

  call (timer) {
    if (_countdownTime < 1) {
      print("定时器取消了");
      _timer.cancel();
      _timer=null;/原博主的代码少了这个
    } else {
    setState(() {
    _countdownTime -= 1;
    });
    }
    print(_countdownTime);
  }

  //倒计时方法
  startCountdown() {
    print("我竟来了");
    //倒计时时间
    _countdownTime = 60;
    print({
      _countdownTime:_countdownTime,
      _timer:_timer == null
    });
    print(_timer);
    if (_timer == null) {/所以第一次循环是_timer是null,再次点击时_timer == null为false
    print("开启定时器");
    _timer = Timer.periodic(Duration(seconds: 1), call);
    //原因是_timer被赋值了，所以在清除定时器后我手动赋值null
  }


  }

  @override
  void dispose() {
    super.dispose();
    if (_timer != null) {
      print("销毁啦");
      _timer.cancel();
    }
  }
}

