import 'package:any_door/Pages/Deal/DealDetailPage.dart';
import 'package:any_door/adapt.dart';
import 'package:any_door/my_colors.dart';
import 'package:any_door/res/dealListData.dart';
import 'package:flutter/material.dart';

// 交易列表
class DealList extends StatelessWidget {
  const DealList({Key? key}) : super(key: key);

  Widget _getListData(context, index) {
    // List ImageList = [
    //   "assets/run1.png",
    //   "assets/study.png",
    //   "assets/entertain1.png",
    //   "assets/else.png",
    // ];
    return GestureDetector(
      onTap: (() => {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DealDetailPage(
                      index: index,
                    )))
          }),
      child: Card(
        color: MyColors.mDealColorLight,
        child: Column(children: <Widget>[
          // 交易图片
          // Expanded(
          //   flex: 4,
          //   child: 
          // ),
          AspectRatio(
              aspectRatio: 14 / 9,
              child: Image.network(
                listData[index]["dealImage"],
                fit: BoxFit.cover,
              ),
            ),
          // 交易标题
          // Expanded(
          //   child: 
          // ),
          Text(
              listData[index]["dealTitle"],
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: Adapt.px(25), fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          // 交易价格
          Expanded(
            child: Container(
              margin: EdgeInsets.fromLTRB(Adapt.px(15.5), 0, 0, 0),
              child: Row(
                children: [
                  Text(
                    "￥",
                    style: TextStyle(
                      fontSize: Adapt.px(25),
                      color: MyColors.mDealColor,
                    ),
                  ),
                  SizedBox(
                    width: Adapt.px(5.5),
                  ),
                  Text("${listData[index]["dealPrice"]}",
                      style: TextStyle(
                        fontSize: Adapt.px(31),
                        fontWeight: FontWeight.bold,
                        color: MyColors.mDealColor,
                      )),
                ],
              ),
            ),
          ),
          // 头像
          // 用户名
          Expanded(
            child: Container(
              margin: EdgeInsets.fromLTRB(Adapt.px(15.5), 0, 0, 0),
              height: Adapt.px(36.5),
              child: Row(
                children: [
                  Container(
                    width: Adapt.px(41),
                    height: Adapt.px(41),
                    // width: 20,
                    // height: 20,
                    child: CircleAvatar(
                        backgroundImage:
                            NetworkImage(listData[index]["personImage"])),
                  ),
                  SizedBox(
                    width: Adapt.px(18),
                  ),
                  Text(
                    listData[index]["userName"],
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: Adapt.px(19)),
                  ),
                ],
              ),
            ),
          ),
          // Expanded(child: child),

          // SizedBox(height: Adapt.px(15.5)),
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
        crossAxisCount: 2,
      ),
      itemCount: listData.length,
      itemBuilder: _getListData,
    );
  }
}
