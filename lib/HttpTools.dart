import 'dart:convert';

import 'package:http/http.dart' as http;

class NetUtils{

  static Future<String> postJson(String url,String json) async{
    if(url==null){
      throw '地址不能为空';
    }
    // print(json);
    http.Response response = await http.post(
        url,// post地址
        headers:{"content-type" : "application/json"},//设置content-type为json
        body: json//json参数
    );
    return response.body;
  }

  static Future<String> getJson(String url) async{
    if(url==null){
      throw '地址不能为空';
    }
    // print(json);
    http.Response response = await http.get(
        url,// get地址
        headers:{"content-type" : "application/x-www-form-urlencoded"},//设置content-type为json
    );
    return response.body;
  }

  static Future<String> putJson(String url,String json) async{
    if(url==null){
      throw '地址不能为空';
    }
    // print(json);
    http.Response response = await http.put(
      url,// 地址
      headers:{"content-type" : "application/json"},//设置content-type为json
      body: json//json参数
    );
    return response.body;
  }



  static postFormDataClient(String tel,String code) async {
    var url = "http://sms-api.luosimao.com/v1/send.json";
    var client = http.MultipartRequest("post", Uri.parse(url));
    client.headers["Authorization"]="Basic YXBpOmtleS1hOGUwMjUyYWM1YTJlMzEwYmJkNGU5Nzc2YjAwZGNjYg==";
    client.fields["mobile"]=tel;
    client.fields["message"]="验证码："+code+"【铁壳测试】";
    client.send().then((http.StreamedResponse response) {
      if (response.statusCode == 200) {
        response.stream.transform(utf8.decoder).join().then((String string) {
          print(string);
        });
      } else {
        print('error');
      }
    }).catchError((error) {
      print('error');
    });
  }

}