import 'dart:convert';

class MessageModel {
  final String senderID;
  final String receiverID;
  final String content;

  MessageModel(
      {
        required this.senderID,
        required this.receiverID,
        required this.content,
      });

  static List<MessageModel> fromJson(String json) {
    return jsonDecode(json)['list']
        .map((obj) => MessageModel.fromMap(obj))
        .toList();
  }

  static MessageModel fromMap(Map map) {
    return MessageModel(
      senderID: map['senderID'],
      receiverID:map['receiverID'],
      content: map['content'],
    );
  }
}
