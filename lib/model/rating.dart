// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Rating {
  final String userid;
  final double rating;

  Rating({required this.userid, required this.rating});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userid': userid,
      'rating': rating,
    };
  }

  factory Rating.fromMap(Map<String, dynamic> map) {
    return Rating(
      userid: map['userid'] ?? '',
      rating: map['rating']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Rating.fromJson(String source) =>
      Rating.fromMap(json.decode(source) as Map<String, dynamic>);
}
