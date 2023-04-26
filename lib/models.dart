// To parse this JSON data, do
//
//     final samplePosts = samplePostsFromJson(jsonString);

import 'dart:convert';

SamplePosts samplePostsFromJson(String str) => SamplePosts.fromJson(json.decode(str));

String samplePostsToJson(SamplePosts data) => json.encode(data.toJson());

class SamplePosts {
    SamplePosts({
        required this.response,
        required this.message,
        required this.data,
        required this.error,
    });

    bool response;
    String message;
    List<Datum> data;
    String error;

    factory SamplePosts.fromJson(Map<String, dynamic> json) => SamplePosts(
        response: json["response"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        error: json["error"],
    );

    Map<String, dynamic> toJson() => {
        "response": response,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "error": error,
    };
}

class Datum {
    Datum({
        required this.id,
        required this.category,
        required this.icon,
        required this.status,
        required this.lnBn,
        required this.lnHn,
        required this.createdAt,
        required this.updatedAt,
    });

    int id;
    String category;
    String icon;
    int status;
    String lnBn;
    String lnHn;
    DateTime createdAt;
    DateTime updatedAt;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        category: json["category"],
        icon: json["icon"],
        status: json["status"],
        lnBn: json["ln_bn"],
        lnHn: json["ln_hn"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "category": category,
        "icon": icon,
        "status": status,
        "ln_bn": lnBn,
        "ln_hn": lnHn,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
