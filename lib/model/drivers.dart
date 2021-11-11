// To parse this JSON data, do
//
//     final need = needFromJson(jsonString);

import 'dart:convert';

Map<String, Need> needFromJson(String str) => Map.from(json.decode(str))
    .map((k, v) => MapEntry<String, Need>(k, Need.fromJson(v)));

String needToJson(Map<String, Need> data) => json.encode(
    Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())));

class Need {
  Need({
    this.id,
    this.lat,
    this.lng,
  });

  String id;
  double lat;
  double lng;

  factory Need.fromJson(Map<String, dynamic> json) => Need(
        id: json["id"],
        lat: (json["lat"] as double),
        lng: (json["lng"] as double),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "lat": lat,
        "lng": lng,
      };
}
