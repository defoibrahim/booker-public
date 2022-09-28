// To parse this JSON data, do
//
//     final service = serviceFromJson(jsonString);

import 'dart:convert';

Service serviceFromJson(String str) => Service.fromJson(json.decode(str));

String serviceToJson(Service data) => json.encode(data.toJson());

class Service {
  Service({
    this.id,
    this.name,
    this.enName,
    this.providerId,
    this.userId,
    this.serviceType,
    this.category,
    this.document,
    this.extraConfig,
    this.serviceStatus,
    this.location,
    this.share,
    this.deleted,
    this.creationDate,
    this.providerName,
    this.categoryName,
    this.categoryEnName,
    this.typeName,
    this.image,
    this.typeEnName,
  });

  String? id;
  String? name;
  String? enName;
  String? providerId;
  String? userId;
  String? serviceType;
  String? category;
  dynamic document;
  dynamic extraConfig;
  String? serviceStatus;
  String? location;
  String? share;
  String? deleted;
  DateTime? creationDate;
  String? providerName;
  String? categoryName;
  String? categoryEnName;
  String? typeName;
  String? image;
  String? typeEnName;

  Service copyWith({
    String? id,
    String? name,
    String? enName,
    String? providerId,
    String? userId,
    String? serviceType,
    String? category,
    dynamic document,
    dynamic extraConfig,
    String? serviceStatus,
    String? location,
    String? share,
    String? deleted,
    DateTime? creationDate,
    String? providerName,
    String? categoryName,
    String? categoryEnName,
    String? typeName,
    String? image,
    String? typeEnName,
  }) =>
      Service(
        id: id ?? this.id,
        name: name ?? this.name,
        enName: enName ?? this.enName,
        providerId: providerId ?? this.providerId,
        userId: userId ?? this.userId,
        serviceType: serviceType ?? this.serviceType,
        category: category ?? this.category,
        document: document ?? this.document,
        extraConfig: extraConfig ?? this.extraConfig,
        serviceStatus: serviceStatus ?? this.serviceStatus,
        location: location ?? this.location,
        share: share ?? this.share,
        deleted: deleted ?? this.deleted,
        creationDate: creationDate ?? this.creationDate,
        providerName: providerName ?? this.providerName,
        categoryName: categoryName ?? this.categoryName,
        categoryEnName: categoryEnName ?? this.categoryEnName,
        typeName: typeName ?? this.typeName,
        image: image ?? this.image,
        typeEnName: typeEnName ?? this.typeEnName,
      );

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json["id"],
        name: json["name"],
        enName: json["en_name"],
        providerId: json["provider_id"],
        userId: json["user_id"],
        serviceType: json["service_type"],
        category: json["category"],
        document: json["document"],
        extraConfig: json["extra_config"],
        serviceStatus: json["service_status"],
        location: json["location"],
        share: json["share"],
        deleted: json["deleted"],
        creationDate: DateTime.parse(json["creation_date"]),
        providerName: json["provider_name"],
        categoryName: json["category_name"],
        categoryEnName: json["category_en_name"],
        typeName: json["type_name"],
        image: json["image"],
        typeEnName: json["type_en_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "en_name": enName,
        "provider_id": providerId,
        "user_id": userId,
        "service_type": serviceType,
        "category": category,
        "document": document,
        "extra_config": extraConfig,
        "service_status": serviceStatus,
        "location": location,
        "share": share,
        "deleted": deleted,
        "creation_date": creationDate!.toIso8601String(),
        "provider_name": providerName,
        "category_name": categoryName,
        "category_en_name": categoryEnName,
        "type_name": typeName,
        "image": image,
        "type_en_name": typeEnName,
      };
}
