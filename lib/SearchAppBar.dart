import 'package:any_door/adapt.dart';
import 'package:flutter/material.dart';

// 搜索栏
class SearchAppBar extends StatefulWidget {
  const SearchAppBar({Key? key, required this.hintLabel}) : super(key: key);

  final String hintLabel;

  @override
  State<StatefulWidget> createState() {
    return SearchAppBarState();
  }
}

class SearchAppBarState extends State<SearchAppBar> {
  late FocusNode _focusNode;

  ///默认不展示控件

  bool _offstage = true;

  ///监听TextField内容变化
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _textEditingController.addListener(() {
      var isVisible = _textEditingController.text.isNotEmpty;
      _updateDelIconVisible(isVisible);
    });
  }

  _updateDelIconVisible(bool isVisible) {
    setState(() {
      _offstage = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: Adapt.px(46.5),
      child: Row(
        children: [
          // 搜索框
          Expanded(
            flex: 1,
            child: Container(
              // 整个搜索框
              height: double.infinity,
              margin: const EdgeInsets.only(left: 16),
              decoration: BoxDecoration(
                  color: const Color(0xFFF5F6FA),
                  borderRadius: BorderRadius.circular(4)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(padding: EdgeInsets.only(left: 8)),
                  // 搜索图标
                  const Icon(
                    Icons.search,
                    size: 16.0,
                    color: Colors.black,
                  ),
                  const Padding(padding: EdgeInsets.only(left: 8)),
                  // 文字输入框
                  Expanded(
                    flex: 1,
                    child: TextField(
                      controller: _textEditingController,
                      autofocus: false,
                      focusNode: _focusNode,
                      style: const TextStyle(fontSize: 14, color: Colors.black),
                      decoration: InputDecoration(
                        hintText: widget.hintLabel,
                        // fillColor: Colors.black,
                        // filled: true,
                        isCollapsed:
                            true, //重点，相当于高度包裹的意思，必须设置为true，不然有默认奇妙的最小高度
                        border: InputBorder.none, //去下划线
                      ),
                      // so strange!!!!👆
                      maxLines: 1,
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(left: 8)),
                  // 隐藏的清除按钮，当有文字时出现
                  Offstage(
                    offstage: _offstage,
                    child: GestureDetector(
                      onTap: () => {_textEditingController.clear()},
                      child: const Icon(
                        Icons.clear,
                        size: 16.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(left: 8)),
                ],
              ),
            ),
          ),
          // 搜索
          GestureDetector(
            onTap: () {
              // 传递数据给后端
            },
            child: Container(
              padding:
                  EdgeInsets.only(left: Adapt.px(24.8), right: Adapt.px(24.8)),
              child: Text("搜索",
                  style: TextStyle(
                    fontSize: Adapt.px(24.8),
                    color: Colors.white,
                  )),
            ),
          ),

          // 取消
          GestureDetector(
            onTap: () {
              _focusNode.unfocus();
            },
            child: Container(
              padding:
                  EdgeInsets.only(left: Adapt.px(24.8), right: Adapt.px(24.8)),
              child: Text("取消",
                  style:
                      TextStyle(fontSize: Adapt.px(24.8), color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.unfocus();
  }
}
