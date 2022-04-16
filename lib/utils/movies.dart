// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    required this.items,
  });

  List<Item> items;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    required this.id,
    required this.rank,
    required this.title,
    required this.fullTitle,
    required this.year,
    required this.image,
    required this.crew,
    required this.imDbRating,
    required this.imDbRatingCount,
  });

  String id;
  String rank;
  String title;
  String fullTitle;
  String year;
  String image;
  String crew;
  String imDbRating;
  String imDbRatingCount;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        rank: json["rank"],
        title: json["title"],
        fullTitle: json["fullTitle"],
        year: json["year"],
        image: json["image"],
        crew: json["crew"],
        imDbRating: json["imDbRating"],
        imDbRatingCount: json["imDbRatingCount"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "rank": rank,
        "title": title,
        "fullTitle": fullTitle,
        "year": year,
        "image": image,
        "crew": crew,
        "imDbRating": imDbRating,
        "imDbRatingCount": imDbRatingCount,
      };
}
