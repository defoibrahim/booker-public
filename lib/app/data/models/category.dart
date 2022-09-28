// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));

String categoryToJson(Category data) => json.encode(data.toJson());

class Category {
    Category({
        this.id,
        this.name,
        this.enName,
        this.image,
    });

    String? id;
    String? name;
    String? enName;
    String? image;

    Category copyWith({
        String? id,
        String? name,
        String? enName,
        String? image,
    }) => 
        Category(
            id: id ?? this.id,
            name: name ?? this.name,
            enName: enName ?? this.enName,
            image: image ?? this.image,
        );

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        enName: json["en_name"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "en_name": enName,
        "image": image,
    };
}
