import 'dart:convert';

class GiftModel {
  final int giftID;
  final String downTime;
  final String giftIntroduction;
  final int giftPrice;
  final int storage;
  final String giftName;
  final String giftImage;

  GiftModel(
      {
        required this.giftImage,
        required this.giftID,
        required this.giftIntroduction,
        required this.storage,
        required this.downTime,
        required this.giftPrice,
        required this.giftName,
      });

  static List<GiftModel> fromJson(String json) {
    return jsonDecode(json)['list']
        .map((obj) => GiftModel.fromMap(obj))
        .toList();
  }

  static GiftModel fromMap(Map map) {
    return GiftModel(
      giftName: map['giftName'],
      giftImage: map['giftImage'],
      giftPrice: map['giftPrice'],
      storage: map['storage'],
      giftIntroduction: map['giftIntroduction'],
      downTime: map['downTime'],
      giftID: map['giftID'],
    );
  }
}
