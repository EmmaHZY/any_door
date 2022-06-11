import 'package:any_door/Pages/Publish/publishTask.dart';
import 'package:flutter/material.dart';

import '../../adapt.dart';
import '../../my_colors.dart';

class PublishPage extends StatelessWidget {
  const PublishPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        GestureDetector(
          onTap: (() => {
                // 跳转发布任务页面
                print("跳转发布任务页面"),
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => PublishTaskPage()))
              }),
          child: Container(
            child: ButtonContainer(Icons.assignment_turned_in,
                description: "发布任务", color: MyColors.mTaskColorLight),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: (() => {
                // 跳转发布交易页面
                print("跳转发布交易页面"),
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => PublishTaskPage()))
              }),
          child: Container(
            child: ButtonContainer(Icons.gavel,
                description: "发布交易", color: MyColors.mDealColorLight),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

//按钮样式定义
class ButtonContainer extends StatelessWidget {
  double size = 32;
  Color color = Colors.white;
  String description = "tag";
  IconData icon;

  ButtonContainer(this.icon,
      {this.color = Colors.white, this.size = 32, this.description = "tag"});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        color: color,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: size, color: Colors.grey),
            Text(
              description,
              style: const TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
