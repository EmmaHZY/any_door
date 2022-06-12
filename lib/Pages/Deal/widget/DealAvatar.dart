import 'package:any_door/Pages/Mine/Other/OtherPage.dart';
import 'package:any_door/models/deal_model.dart';
import 'package:any_door/res/dealListData.dart';
import 'package:flutter/material.dart';

// 头像+用户名+发布时间

class DealAvatar extends StatefulWidget {
  final DealModel activeDeal;
  DealAvatar({Key? key, required this.activeDeal}) : super(key: key);

  @override
  State<DealAvatar> createState() => _DealAvatarState();
}

class _DealAvatarState extends State<DealAvatar> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() => {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    OtherPage(userID: widget.activeDeal.publisherID)))
          }),
      child: Container(
          child: ListTile(
        leading: CircleAvatar(
            backgroundImage: NetworkImage(widget.activeDeal.personImage)),
        title: Text(
          widget.activeDeal.publisherID + "   " + widget.activeDeal.userName,
        ),
        subtitle: Text("发布于" + widget.activeDeal.publishTime),
      )
          // child: Text(widget.imageUrl),
          ),
    );
  }
}
