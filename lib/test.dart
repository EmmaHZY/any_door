import 'package:any_door/adapt.dart';
import 'package:flutter/material.dart';
import '../../res/listData.dart';

class TaskDetailPage extends StatefulWidget {
  final int index;
  TaskDetailPage({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<TaskDetailPage> createState() => _TaskDetailPageState();
}

class _TaskDetailPageState extends State<TaskDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("任务详情")),
        body: Column(
          mainAxisSize: Adapt.screenH(),
          children: [
            Expanded(child: Avatar(index: widget.index)),
            Expanded(child: TaskInfo(index: widget.index)),
          ],
        ));
  }
}

class Avatar extends StatefulWidget {
  final int index;
  Avatar({Key? key, required this.index}) : super(key: key);

  @override
  State<Avatar> createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListTile(
      leading: CircleAvatar(
          backgroundImage: NetworkImage(listData[widget.index]["personImage"])),
      title: Text(listData[widget.index]["userName"]),
      subtitle: Text("发布于" + listData[widget.index]["publishTime"]),
    )
        // child: Text(widget.imageUrl),
        );
  }
}

class TaskInfo extends StatefulWidget {
  final int index;
  TaskInfo({Key? key, required this.index}) : super(key: key);

  @override
  State<TaskInfo> createState() => _TaskInfoState();
}

class _TaskInfoState extends State<TaskInfo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 任务标签和标题
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 任务标签
              Card(
                child: Text("#" + listData[widget.index]["tag"]),
              ),
              // 任务标题
              Expanded(
                child: Text(
                  listData[widget.index]["taskTitle"],
                  style: TextStyle(
                    fontSize: Adapt.px(30.5),
                    fontWeight: FontWeight.bold,
                    
                  ),
                ),
              )
            ],
          ),
          // 任务赏金
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // 金币数
              Container(
                width: Adapt.px(31),
                height: Adapt.px(31),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                ),
                child: Image.asset(
                  "assets/coin.png",
                  fit: BoxFit.cover,
                ),
              ),

              SizedBox(
                width: Adapt.px(21),
              ),
              Text("${listData[widget.index]["taskCoin"]}"),
              SizedBox(
                width: Adapt.px(21),
              ),
            ],
          ),
          SizedBox(
            height: Adapt.px(31),
          ),
          // 任务内容
          Text(
              listData[widget.index]["taskContent"],
              style: TextStyle(
                fontSize: Adapt.px(25.5),
              ),
            ),
          // 任务图片
          AspectRatio(
            aspectRatio: 14 / 9,
            child: Image.network(
              listData[widget.index]["taskImage"],
              fit: BoxFit.cover,
            ),
          ),
          // 截止时间
          Center(
            child: Text(
              "截止时间"+listData[widget.index]["deadline"],
              style: const TextStyle(
                color: Colors.grey
              ),),
          ),

        ],
      ),
    );
  }
}
