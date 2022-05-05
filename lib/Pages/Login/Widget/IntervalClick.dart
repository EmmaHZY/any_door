import '../../../HttpTools.dart';

var  lastPopTime = DateTime.now();
void intervalClick(int needTime){
  // 防重复提交
  if(lastPopTime == null || DateTime.now().difference(lastPopTime) > Duration(seconds: needTime)){
    print(lastPopTime);
    lastPopTime = DateTime.now();
    print("允许点击");
    //NetUtils.postFormDataClient();
  }else{
    print("请勿重复点击！");
  }
}
