class City {
  City({
    this.id,
    this.code,
    this.name,
    this.enName,
    this.description,
  });

  final String? id;
  final String? code;
  final String? name;
  final String? enName;
  final String? description;

  factory City.fromMap(Map<String, dynamic> json) => City(
        id: json["id"] == null ? null : json["id"],
        code: json["code"] == null ? null : json["code"],
        name: json["name"] == null ? null : json["name"],
        enName: json["en_name"],
        description: json["description"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "code": code == null ? null : code,
        "name": name == null ? null : name,
        "en_name": enName,
        "description": description,
      };
}
