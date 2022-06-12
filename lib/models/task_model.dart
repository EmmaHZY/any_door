import 'dart:convert';

class TaskModel {
  final int taskID;
  final String publisherID; 
  final String receiverID;
  final String taskTitle; 
  final String deadline; 
  final String taskImage; 
  final String publishTime; 
  final String taskContent; 
  final String tag; 
  final String taskState; 
  //final double taskCoin;
  final String username; 
  final String personImage;
  final int price;

  TaskModel(
      {
        required this.taskID,
        required this.publisherID,
        required this.receiverID,
        required this.taskTitle,
        required this.deadline,
        required this.taskImage,
        required this.publishTime,
        required this.taskContent,
        required this.tag,
        required this.taskState,
        //required this.taskCoin,
        required this.username,
        required this.personImage,
        required this.price
      });

  static List<TaskModel> fromJson(String json) {
    return jsonDecode(json)['list']
        .map((obj) => TaskModel.fromMap(obj))
        .toList();
  }

  static TaskModel fromMap(Map map) {
    return TaskModel(
      taskID: map['taskID'],
      publisherID: map['publisherID'],
      receiverID: map['receiverID'],
      taskTitle: map['taskTitle'],
      deadline: map['deadline'],
      taskImage: map['taskImage'],
      publishTime: map['publishTime'],
      taskContent: map['taskContent'],
      tag: map['tag'],
      taskState: map['taskState'],
      //taskCoin: map['taskCoin'],
      username: map['username'],
      personImage: map['personImage'],
      price: map['price']
    );
  }
}
