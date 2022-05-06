import 'package:any_door/Pages/Message/CommunicationPage.dart';
import 'package:flutter/material.dart';

import '../../my_colors.dart';


class MessagePage extends StatelessWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
     child: ClipRRect(
      child: FlatButton(
        disabledColor:MyColors.mPrimaryColor,
        splashColor: MyColors.mThirdLight,
        highlightColor: MyColors.mThirdLight,
        hoverColor: MyColors.mThirdLight,
        color: MyColors.mPrimaryColor,
        padding: const EdgeInsets.only(right: 0),
        child: Text("去聊天"),
        onPressed:(){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const CommunicationPage(title: 'title',);
              },
            ),
          );
        },
      ),
      borderRadius: const BorderRadius.only(
          topRight: Radius.circular(50),
          bottomRight: Radius.circular(50)
      ),
    )
    );
  }
}