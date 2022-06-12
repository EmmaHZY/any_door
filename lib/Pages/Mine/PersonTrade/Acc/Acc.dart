import 'package:flutter/material.dart';
import 'package:any_door/my_colors.dart';
import '../../../../adapt.dart';
import 'AccList.dart';

class AccPage extends StatefulWidget {
  const AccPage({Key? key}) : super(key: key);

  @override
  _AccPageState createState() => _AccPageState();
}

class _AccPageState extends State<AccPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: false,//去掉leading位置的返回箭头
        centerTitle: true,
        backgroundColor: MyColors.mTaskColor,
        title: Text(
          "已参与交易",
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),

      ),
      body: const GiftHome(),
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

            // 任务列表
            Container(
              height: 650,
              // Adapt.screenH() -
              // 2 * Adapt.px(62) -
              // Adapt.px(186) -
              // 2 * Adapt.padTopH() -
              // 90 -
              // 3 * Adapt.padBotH(),
              child: AccList(),
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