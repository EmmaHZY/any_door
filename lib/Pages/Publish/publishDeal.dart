import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:any_door/HttpTools.dart';
import 'package:any_door/account.dart';
import 'package:any_door/my_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// 引入第三方插件
import 'package:date_format/date_format.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:image_picker/image_picker.dart';

// 发布任务页面
class PublishDealPage extends StatefulWidget {
  const PublishDealPage({Key? key}) : super(key: key);

  @override
  State<PublishDealPage> createState() => _PublishDealPageState();
}

class _PublishDealPageState extends State<PublishDealPage> {
  late String _title, _content, _coin; //获取框的内容
  int _part = 1; //记录任务tag的选择
  DateTime _dateTime = DateTime.now(); //时间日期容器

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("交易发布"),
        backgroundColor: MyColors.mDealColor,
      ),
      body: Form(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          children: [
            const SizedBox(height: 15), // 距离顶部一个工具栏的高度
            const Text("请选择交易Tag："),
            buildTagTextField(), // 任务种类选择
            const SizedBox(height: 15),
            buildTitleTextField(), //任务标题输入
            const SizedBox(height: 15),
            buildContentTextField(), // 任务内容输入
            const SizedBox(height: 15),
            buildCoinTextField(), // 任务赏金输入
            const SizedBox(height: 15),
            const Text("请点击选择交易截止时间："),
            const SizedBox(height: 10),
            buildDeadlineTextField(), //截止时间
            const SizedBox(height: 15),
            buildPhoto(), //图片上传函数
            const SizedBox(height: 30),
            buildPublishButton(), //发布按钮
          ],
        ),
      ),
    );
  }

  //任务种类选择
  Widget buildTagTextField() {
    return Row(
      children: [
        Radio(
            value: 1,
            groupValue: _part,
            activeColor: MyColors.mDealColor,
            onChanged: (value) {
              debugPrint(value.toString());
              setState(() {
                _part = 1;
              });
            }),
        const Text("日用"),
        Radio(
            value: 2,
            groupValue: _part,
            activeColor: MyColors.mDealColor,
            onChanged: (value) {
              debugPrint(value.toString());
              setState(() {
                _part = 2;
              });
            }),
        const Text("书籍"),
        Radio(
            value: 3,
            groupValue: _part,
            activeColor: MyColors.mDealColor,
            onChanged: (value) {
              debugPrint(value.toString());
              setState(() {
                _part = 3;
              });
            }),
        const Text("饮食"),
        Radio(
            value: 4,
            groupValue: _part,
            activeColor: MyColors.mDealColor,
            onChanged: (value) {
              debugPrint(value.toString());
              setState(() {
                _part = 4;
              });
            }),
        const Text("其他"),
      ],
    );
  }

  //任务标题输入
  Widget buildTitleTextField() {
    return TextFormField(
      inputFormatters: <TextInputFormatter>[
        LengthLimitingTextInputFormatter(20) //限制长度
      ],
      onChanged: (value) {
        //实时记录文本框数据
        _title = value;
      },
      decoration: const InputDecoration(
        hintText: '请输入交易标题(不超过20字)',

        /// 边框
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),

        ///设置内容内边距
        contentPadding: EdgeInsets.only(
          top: 0,
          bottom: 0,
          left: 10,
          right: 10,
        ),
      ),
    );
  }

  //任务内容输入
  Widget buildContentTextField() {
    return TextFormField(
      maxLines: 6,
      inputFormatters: <TextInputFormatter>[
        LengthLimitingTextInputFormatter(120) //限制长度
      ],
      onChanged: (value) {
        //实时记录文本框数据
        _content = value;
      },
      decoration: const InputDecoration(
        hintText: '请输入交易详情(不超过120字)',

        /// 边框
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),

        ///设置内容内边距
        contentPadding: EdgeInsets.only(
          top: 10,
          bottom: 10,
          left: 10,
          right: 10,
        ),
      ),
    );
  }

  //任务赏金输入
  Widget buildCoinTextField() {
    return TextFormField(
      inputFormatters: <TextInputFormatter>[
        LengthLimitingTextInputFormatter(3), //限制长度，三位数
        FilteringTextInputFormatter.allow(RegExp("[0-9]")), //限制数字输入
      ],
      onChanged: (value) {
        //实时记录文本框数据
        _coin = value;
      },
      decoration: const InputDecoration(
        hintText: '请输入交易金额',

        /// 边框
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),

        ///设置内容内边距
        contentPadding: EdgeInsets.only(
          top: 0,
          bottom: 0,
          left: 10,
          right: 10,
        ),
      ),
    );
  }

  //截止时间选择
  Widget buildDeadlineTextField() {
    return InkWell(
        child: Text(
          formatDate(_dateTime, [yyyy, '年', mm, '月', dd, ' ', HH, ':', nn]),
          style: TextStyle(
              fontSize: 20,
              foreground: Paint()
                ..style = PaintingStyle.fill
                ..strokeWidth = 10
                ..shader = const LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [MyColors.mDealColor, MyColors.mDealColor])
                    .createShader(const Rect.fromLTWH(0, 0, 300, 100))),
        ),
        onTap: _showDatePicker);
  }

  // 时间显示
  void _showDatePicker() {
    DatePicker.showDatePicker(
      context,
      onMonthChangeStartWithFirstDate: true,
      pickerTheme: const DateTimePickerTheme(
          showTitle: true,
          confirm: Text('确认', style: TextStyle(color: Colors.red)),
          cancel: Text('取消', style: TextStyle(color: Colors.cyan))),

      minDateTime: DateTime.parse("1970-01-01"),
      maxDateTime: DateTime.parse("2050-01-01"),

      initialDateTime: _dateTime,

      // 显示日期
      // dateFormat: "yyyy-MMMM-dd",

      // 显示日期与时间
      dateFormat: 'yyyy年M月d日    EEE,H时:m分', // show TimePicker
      pickerMode: DateTimePickerMode.datetime, // show TimePicker

      locale: DateTimePickerLocale.zh_cn,

      onChange: (dateTime, List<int> index) {
        setState(() {
          // 初始及修改保存后的时间
          _dateTime = dateTime;
        });
      },
      onConfirm: (dateTime, List<int> index) {
        setState(() {
          // 初始及修改保存后的时间
          _dateTime = dateTime;
        });
      },
    );
  }

  //图片函数
  File? _image;
  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  Widget Img() {
    // print(_image);
    if (_image == null) {
      return Text('No image selected.');
    } else {
      return Image.file(_image!);
    }
  }

  Widget buildPhoto() {
    return InkWell(
      child: Column(children: [
        Img(),
        ElevatedButton(
          onPressed: getImage,
          child: Icon(Icons.add_a_photo),
          style: ElevatedButton.styleFrom(primary: MyColors.mDealColor),
        )
      ]),
    );
  }

  //确认发布的按钮
  Widget buildPublishButton() {
    return Align(
      child: SizedBox(
        height: 45,
        width: 270,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: MyColors.mDealColor),
          child: const Text('确认发布',
              style: TextStyle(fontSize: 20, color: Colors.white)),
          onPressed: () {
            print('发布发布点我发布');
            // print(_part);
            // print(_title);
            // print(_content);
            // print(_coin);
            // print(_dateTime);
            Future<String> back = NetUtils.postFile(_image!.path);
            back.then((value) => publishDealFinal(value));
          },
        ),
      ),
    );
  }

  publishDealFinal(String value) async {
    print(value);
    String send = "{\"userID\":\"" +
        Account.account +
        "\"," +
        "\"tag\":\"" +
        _part.toString() +
        "\"," +
        "\"tradeImage\":\"" +
        value +
        "\"," +
        "\"tradeTitle\":\"" +
        _title +
        "\"," +
        "\"tradeContent\":\"" +
        _content +
        "\"," +
        "\"tradePrice\":\"" +
        _coin +
        "\"," +
        "\"deadline\":\"" +
        _dateTime.toString() +
        "\"}";
    print(send);
    Future<Uint8List> back = NetUtils.postJsonBytes(
        'http://1.117.239.54:8080/trade?operation=add', send);
    back.then((res) {
      Map<String, dynamic> result = json.decode(utf8.decode(res)); //结果的map对象
      print(result);
      if (result["meta"]["status"] == "201") {
        showCupertinoDialog(
            context: context,
            builder: (BuildContext context) {
              return CupertinoAlertDialog(
                title: const Text("提示"),
                content: const Text("发布交易成功"),
                actions: [
                  FlatButton(
                      onPressed: (() {
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      }),
                      child: const Text("确定"))
                ],
              );
            });
      } else {
        showCupertinoDialog(
            context: context,
            builder: (BuildContext context) {
              return CupertinoAlertDialog(
                title: const Text("提示"),
                content: const Text("发布交易失败，请重试"),
                actions: [
                  FlatButton(
                      onPressed: (() {
                        Navigator.of(context).pop();
                      }),
                      child: const Text("确定"))
                ],
              );
            });
      }
    });
  }
}
