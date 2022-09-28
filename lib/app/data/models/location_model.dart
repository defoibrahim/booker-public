// To parse this JSON data, do
//
//     final location = locationFromJson(jsonString);

import 'dart:convert';

Location locationFromJson(String str) => Location.fromJson(json.decode(str));

String locationToJson(Location data) => json.encode(data.toJson());

class Location {
    Location({
        this.id,
        this.code,
        this.name,
        this.enName,
        this.description,
    });

    String? id;
    String? code;
    String? name;
    String? enName;
    dynamic description;

    Location copyWith({
        String? id,
        String? code,
        String? name,
        String? enName,
        dynamic description,
    }) => 
        Location(
            id: id ?? this.id,
            code: code ?? this.code,
            name: name ?? this.name,
            enName: enName ?? this.enName,
            description: description ?? this.description,
        );

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        id: json["id"],
        code: json["code"],
        name: json["name"],
        enName: json["en_name"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "name": name,
        "en_name": enName,
        "description": description,
    };
}
