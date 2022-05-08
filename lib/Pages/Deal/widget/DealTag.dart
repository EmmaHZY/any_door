import 'package:any_door/adapt.dart';
import 'package:any_door/my_colors.dart';
import 'package:flutter/material.dart';

// 交易标签
class DealTag extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: Container(
            child: TagContainer(Icons.local_mall, description: "日用"),
            decoration: BoxDecoration(
                border: Border.all(
                    color: Color.fromRGBO(250, 250, 250, 1),
                    width: Adapt.px(1.55))),
          ),
          flex: 1,
        ),
        Expanded(
          child: Container(
            child: TagContainer(Icons.book, description: "书籍"),
            decoration: BoxDecoration(
                border: Border.all(
                    color: Color.fromRGBO(250, 250, 250, 1),
                    width: Adapt.px(1.55))),
          ),
          flex: 1,
        ),
        Expanded(
          child: Container(
            child: TagContainer(Icons.restaurant, description: "饮食"),
            decoration: BoxDecoration(
                border: Border.all(
                    color: Color.fromRGBO(250, 250, 250, 1),
                    width: Adapt.px(1.55))),
          ),
          flex: 1,
        ),
        Expanded(
          child: Container(
            child: TagContainer(Icons.donut_small, description: "其他"),
            decoration: BoxDecoration(
                border: Border.all(
                    color: Color.fromRGBO(250, 250, 250, 1),
                    width: Adapt.px(1.55))),
          ),
          flex: 1,
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class TagContainer extends StatelessWidget {
  double size = 32;
  Color color = MyColors.mDealColorLight;
  String description = "tag";
  IconData icon;

  TagContainer(this.icon,
      {this.color = MyColors.mDealColorLight,
      this.size = 32,
      this.description = "tag"});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: Adapt.px(186),
      width: Adapt.px(178.25),
      color: this.color,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(this.icon, size: this.size, color: MyColors.mDealColor),
            Text(
              this.description,
              style: const TextStyle(color: MyColors.mDealColor),
            )
          ],
        ),
      ),
    );
  }
}
