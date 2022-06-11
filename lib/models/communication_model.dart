import 'dart:convert';

class CommunicationModel {
  final String userID;
  final String friend;
  final String personImage;
  final String userName;
  final String lastMessage;
  final String lastTime;


  CommunicationModel(
      {
        required this.userID,
        required this.friend,
        required this.personImage,
        required this.userName,
        required this.lastMessage,
        required this.lastTime,
      });

  static List<CommunicationModel> fromJson(String json) {
    return jsonDecode(json)['list']
        .map((obj) => CommunicationModel.fromMap(obj))
        .toList();
  }

  static CommunicationModel fromMap(Map map) {
    return CommunicationModel(
      userID: map['userID'],
      friend:map['friend'],
      personImage: map['personImage'],
      userName: map['userName'],
      lastMessage: map['lastMessage'],
      lastTime: map['lastTime'],
    );
  }
}
