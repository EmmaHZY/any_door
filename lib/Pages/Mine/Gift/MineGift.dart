import 'package:flutter/material.dart';
import 'package:any_door/my_colors.dart';
import '../../../adapt.dart';
import 'GiftList.dart';

class MineGiftPage extends StatefulWidget {
  const MineGiftPage({Key? key}) : super(key: key);

  @override
  _MineGiftPageState createState() => _MineGiftPageState();
}

class _MineGiftPageState extends State<MineGiftPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //automaticallyImplyLeading: false,//去掉leading位置的返回箭头
          centerTitle: true,
          backgroundColor: MyColors.mTaskColor,
          title: Text(
            "礼品专区",
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),

        ),
        body: const GiftHome(),
    );
  }


  Widget itemCell(String itemTitle, String Content) {
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
                      Text(itemTitle,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          // fontWeight: FontWeight.w400)
                        ),),

                      SizedBox(width: 15,),

                      Text(Content,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          // fontWeight: FontWeight.w400)
                        ),),
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
      height: 20,
    );
  }
}

class GiftHome extends StatelessWidget {
  const GiftHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: <Widget>[

            SizedBox(
              height: Adapt.px(30),
              child: Container(
                color: Colors.white,
                child: Container(
                  margin: EdgeInsets.fromLTRB(Adapt.px(31), 0, 20, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "  ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 94, 92, 92),
                        ),
                      ),
                      // Text(
                      //   "更多",
                      //   style: TextStyle(
                      //     fontWeight: FontWeight.bold,
                      //     color: Color.fromARGB(255, 94, 92, 92),
                      //   ),
                      // ),
                      GestureDetector(
                        onTap: () {
                          // 跳到全部礼品
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                              left: Adapt.px(24.8), right: Adapt.px(24.8)),
                          child: const Text("  ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 94, 92, 92),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                alignment: Alignment.center,
              ),
            ),

            // 礼品列表
            Container(
              height: 600,
                  // Adapt.screenH() -
                  // 2 * Adapt.px(62) -
                  // Adapt.px(186) -
                  // 2 * Adapt.padTopH() -
                  // 90 -
                  // 3 * Adapt.padBotH(),
              child: GiftList(),
            ),
            // TaskList(),
            // Container(
            //   child: Text("${listData[1]["tag"]}"),
            // )
          ],
        ),
      ],
    );
  }
}