import 'package:flutter/material.dart';

class PublishPage extends StatelessWidget {
  const PublishPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Text("你好")
    );
  }

  // void showBottomSheet() {
  //   //用于在底部打开弹框的效果
  //   showModalBottomSheet(
  //       builder: (BuildContext context) {
  //         //构建弹框中的内容
  //         return buildBottomSheetWidget(context);
  //       },
  //       backgroundColor: Colors.transparent,//重要
  //       context: context);
  // }
  //
  // Widget buildBottomSheetWidget(BuildContext context) {
  //   return Container(
  //       height: 500,
  //       decoration: const BoxDecoration(
  //           color: Colors.white,
  //           borderRadius: BorderRadius.only(
  //               topLeft: Radius.circular(25.0),
  //               topRight: Radius.circular(25.0))),
  //       child: Column(
  //         children: [
  //           Text(
  //             "邀请好友",
  //             style: TextStyle(
  //               color: Color(0xFF36393D),
  //               fontSize: 46.w,
  //             ),
  //           ),
  //           Container(
  //             height: 100,
  //             child: ListView.builder(
  //               scrollDirection: Axis.horizontal,
  //               itemBuilder: (BuildContext context, int index) {
  //                 return InkWell(
  //                   child: Container(
  //                     child: new Column(
  //                       children: <Widget>[
  //                         new Padding(
  //                           padding: EdgeInsets.fromLTRB(0.0, 6.0, 0.0, 6.0),
  //                           child: Image.asset(
  //                             urlItems[index],
  //                             width: 48,
  //                           ),
  //                         ),
  //                         new Text(nameItems[index])
  //                       ],
  //                     ),
  //                   ),
  //                   onTap: () {
  //                     switch (nameItems[index]) {
  //                       case '微信':
  //                         print("微信");
  //                         break;
  //                       case '朋友圈':
  //                         print("朋友圈");
  //                         break;
  //                       case 'QQ':
  //                         print("QQ");
  //                         break;
  //                       case 'QQ空间':
  //                         print("QQ空间");
  //                         break;
  //                       case '微博':
  //                         print("微博");
  //                         break;
  //                     }
  //                   },
  //                 );
  //               },
  //               itemCount: nameItems.length,
  //             ),
  //           ),
  //         ],
  //       ));
  // }
}