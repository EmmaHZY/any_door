import 'package:http/http.dart' as http;

class NetUtils{

  static Future<String> postJson(String url,String json) async{
    if(url==null){
      throw '地址不能为空';
    }
    // print(json);
    http.Response response = await http.post(
        url,// post地址
        headers:{"content-type" : "application/x-www-form-urlencoded"},//设置content-type为json
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

  static Future<String> postCode(String json) async{
    String url='http://sms-api.luosimao.com/v1/send.json';
    print(json);
    http.Response response = await http.post(
        url,// 地址
        headers:{"content-type" : "multipart/form-data",
                 "authorization" : "Basic YXBpOmtleS1hOGUwMjUyYWM1YTJlMzEwYmJkNGU5Nzc2YjAwZGNjYg=="},//设置content-type为json
        body: json//json参数
    );
    return response.body;
  }

}