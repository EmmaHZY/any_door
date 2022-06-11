import 'dart:convert';

class DealModel {
  final int dealID;
  final String publisherID; 
  final String receiverID;
  final String dealTitle; 
  final String deadline; 
  final String dealImage; 
  final String publishTime; 
  final String dealContent; 
  final String tag; 
  final String dealState; 
  final String dealCoin; 
  final String username; 
  final String personImage; 

  DealModel(
      {
        required this.dealID,
        required this.publisherID,
        required this.receiverID,
        required this.dealTitle,
        required this.deadline,
        required this.dealImage,
        required this.publishTime,
        required this.dealContent,
        required this.tag,
        required this.dealState,
        required this.dealCoin,
        required this.username,
        required this.personImage,
      });

  static List<DealModel> fromJson(String json) {
    return jsonDecode(json)['list']
        .map((obj) => DealModel.fromMap(obj))
        .toList();
  }

  static DealModel fromMap(Map map) {
    return DealModel(
      dealID: map['dealID'],
      publisherID: map['publisherID'],
      receiverID: map['receiverID'],
      dealTitle: map['dealTitle'],
      deadline: map['deadline'],
      dealImage: map['dealImage'],
      publishTime: map['publishTime'],
      dealContent: map['dealContent'],
      tag: map['tag'],
      dealState: map['dealState'],
      dealCoin: map['dealCoin'],
      username: map['username'],
      personImage: map['personImage'],
    );
  }
}