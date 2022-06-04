import 'package:flutter/material.dart';
import 'package:any_door/my_colors.dart';
import '../../adapt.dart';
import 'Info/Modify.dart';

class MineWalletPage extends StatefulWidget {
  const MineWalletPage({Key? key}) : super(key: key);

  @override
  _MineWalletPageState createState() => _MineWalletPageState();
}

class _MineWalletPageState extends State<MineWalletPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //automaticallyImplyLeading: false,//去掉leading位置的返回箭头
          centerTitle: true,
          backgroundColor: MyColors.mTaskColor,
          title: Text(
            "我的钱包",
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),

        body: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              blank(),
              itemMoney(),
              blank(),
              Container(
                  margin: EdgeInsets.only(right: 10, left: 10),
                  color: Colors.grey,
                  height: 1), //分割线
              blank(),
              itemCredit(),
              blank(),
              Container(
                  margin: EdgeInsets.only(right: 10, left: 10),
                  color: Colors.grey,
                  height: 1),
              Expanded(
                  child: Container(
                    color: Colors.white,
                  )
              )
            ],
          ),
        )
    );
  }



  Widget itemMoney() {
    return Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
                height: 70,
                margin: EdgeInsets.only(right: 10, left: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(Icons.payment_outlined,
                          color: Color.fromRGBO(254, 180, 12, 100),
                          size: 50,),
                      Text('金币',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 20,
                          // fontWeight: FontWeight.w400)
                        ),),

                      Spacer(),

                      Text('￥'+'130',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25, // fontWeight: FontWeight.w400)
                        ),),

                      SizedBox(width: 25,),
                    ]
                )
            )
          ],
        )
    );
  }

  Widget itemCredit() {
    return Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
                height: 50,
                margin: EdgeInsets.only(right: 10, left: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(Icons.credit_score_outlined,
                          color: Color.fromRGBO(254, 180, 12, 100),
                          size: 50,),
                      Text('信誉分',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 20,
                          // fontWeight: FontWeight.w400)
                        ),),

                      Spacer(),

                      Text('100',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          // fontWeight: FontWeight.w400)
                        ),),
                      SizedBox(width: 25,),
                    ]
                )
            )
          ],
        )
    );
  }

  Widget blank() {
    return Container(
      color: Colors.white,
      height: 10,
    );
  }
}
