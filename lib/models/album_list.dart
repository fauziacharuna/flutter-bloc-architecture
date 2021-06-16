import 'dart:convert';

List<Album> albumFromJson(String str) =>
    List<Album>.from(json.decode(str).map((x) => Album.fromJson(x)));
String albumToJson(List<Album> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Album {
  Album({required this.id, required this.title, required this.userId});

  late int id;
  late String title;
  late int userId;

  factory Album.fromJson(Map<String, dynamic> json) =>
      Album(id: json["id"], title: json["title"], userId: json["userId"]);

  Map<String, dynamic> toJson() => {"userId": userId, "id": id, "title": title};
}
