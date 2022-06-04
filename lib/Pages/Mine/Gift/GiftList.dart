import 'GiftDetail.dart';
import 'package:any_door/adapt.dart';
import 'package:any_door/my_colors.dart';
import 'package:any_door/res/GiftData.dart';
import 'package:flutter/material.dart';

// 礼品列表
class GiftList extends StatelessWidget {
  const GiftList({Key? key}) : super(key: key);

  Widget _getListData(context, index) {
    List tagImageList = [
      "assets/cup.png",
      "assets/pen.png",
      "assets/bracelet.png",
      "assets/headset.png",
      "assets/else.png",
    ];
    return GestureDetector(
      onTap: (() => {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => GiftDetailPage(
              index: index,
            )))
      }),
      child: Card(
        color: Colors.white,
        child: Column(children: <Widget>[
          // 礼品标签图片
          Expanded(
            flex: 4,
            child: AspectRatio(
              aspectRatio: 14 / 14,
              child: Image.asset(
                tagImageList[
                GiftData[index]["tag"] - 1], //这里应该是tag对应的图片，而不是任务图片
                fit: BoxFit.cover,
              ),
            ),
          ),
          // 礼品标签
          Expanded(
            child: Text(
              GiftData[index]["name"],
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: Adapt.px(25)),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          // 库存+价格
          Expanded(
            child: Container(
              margin: EdgeInsets.all(Adapt.px(15.5)),
              height: Adapt.px(36.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // 库存
                  Row(
                    children: [
                      // 库存
                      Text("库存：",style: TextStyle(fontSize: Adapt.px(19))),
                      Text(
                        GiftData[index]["stock"],
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: Adapt.px(19)),
                      ),
                    ],
                  ),
                  // 价格
                  Row(
                    children: [
                      // 价格
                      Container(
                        width: Adapt.px(31),
                        height: Adapt.px(31),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        ),
                        // width: 20,
                        // height: 20,
                        // child: Image.asset(
                        //   "assets/coin.png",
                        //   fit: BoxFit.cover,
                        // ),
                      ),
                      SizedBox(
                        width: Adapt.px(15.5),
                      ),
                      Text("￥ "+"${GiftData[index]["price"]}",style: TextStyle(fontSize: Adapt.px(19))),
                    ],
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
      itemCount: GiftData.length,
      itemBuilder: _getListData,
    );
  }
}
