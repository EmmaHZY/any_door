import 'package:any_door/adapt.dart';
import 'package:any_door/my_colors.dart';
import 'package:flutter/material.dart';

// 任务标签
class TaskTag extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: Container(
            child: TagContainer(Icons.directions_run, description: "跑腿"),
            decoration: BoxDecoration(
                border: Border.all(
                    color: Color.fromRGBO(250, 250, 250, 1),
                    width: Adapt.px(1.55))),
          ),
          flex: 1,
        ),
        Expanded(
          child: Container(
            child: TagContainer(Icons.local_library, description: "学习"),
            decoration: BoxDecoration(
                border: Border.all(
                    color: Color.fromRGBO(250, 250, 250, 1),
                    width: Adapt.px(1.55))),
          ),
          flex: 1,
        ),
        Expanded(
          child: Container(
            child: TagContainer(Icons.supervisor_account, description: "娱乐"),
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
  Color color = MyColors.mTaskColorLight;
  String description = "tag";
  IconData icon;

  TagContainer(this.icon,
      {this.color = MyColors.mTaskColorLight,
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
            Icon(this.icon, size: this.size, color: MyColors.mTaskColor),
            Text(
              this.description,
              style: const TextStyle(color: MyColors.mTaskColor),
            )
          ],
        ),
      ),
    );
  }
}
