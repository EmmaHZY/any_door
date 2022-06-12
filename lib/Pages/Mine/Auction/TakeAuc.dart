import 'package:any_door/Pages/Login/Widget/CodeTimer.dart';
import 'package:flutter/material.dart';
import 'package:any_door/my_colors.dart';
import '../../../adapt.dart';

class TakeAucPage extends StatefulWidget {
  const TakeAucPage({Key? key}) : super(key: key);

  @override
  _TakeAucPageState createState() => _TakeAucPageState();
}

class _TakeAucPageState extends State<TakeAucPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //automaticallyImplyLeading: false,//去掉leading位置的返回箭头
          centerTitle: true,
          backgroundColor: MyColors.mTaskColor,
          title: Text(
            "已参与拍卖",
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),

        ),
        body: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              blank(),
              reminder()
            ],
          ),
        )
    );
  }

  Widget reminder(){
    return Center(
      child: Text(
          '该功能正在开发中，敬请期待......'
      ),
    );
  }

  Widget blank() {
    return Container(
      color: Colors.white,
      height: 270,
    );
  }
}

