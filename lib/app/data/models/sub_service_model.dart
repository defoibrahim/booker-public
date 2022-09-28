// To parse this JSON data, do
//
//     final subService = subServiceFromJson(jsonString);

import 'dart:convert';

SubServiceModel subServiceFromJson(String str) =>
    SubServiceModel.fromJson(json.decode(str));

String subServiceToJson(SubServiceModel data) => json.encode(data.toJson());

class SubServiceModel {
  SubServiceModel({
    this.id,
    this.name,
    this.enName,
    this.descrption,
    this.enDescrption,
    this.code,
    this.serviceId,
    this.userId,
    this.price,
    this.totalRserved,
    this.extraConfig,
    this.document,
    this.stapes,
    this.isActive,
    this.location,
    this.requireProcess,
    this.totalRate,
    this.rateAvg,
    this.deleted,
    this.creationDate,
    this.serviceName,
    this.serviceEnName,
    this.locationName,
    this.locationEnName,
    this.serviceType,
    this.providerName,
    this.image,
    this.sameDay
  });

  String? id;
  String? name;
  String? enName;
  String? descrption;
  String? enDescrption;
  String? code;
  String? serviceId;
  String? userId;
  String? price;
  String? totalRserved;
  ExtraConfig? extraConfig;
  String? document;
  String? stapes;
  String? isActive;
  ServiceLocation? location;
  String? requireProcess;
  String? totalRate;
  String? rateAvg;
  String? deleted;
  DateTime? creationDate;
  String? serviceName;
  String? serviceEnName;
  String? locationName;
  String? locationEnName;
  String? serviceType;
  String? providerName;
  String? image;
  String? sameDay;

  SubServiceModel copyWith({
    String? id,
    String? name,
    String? enName,
    String? descrption,
    String? enDescrption,
    String? code,
    String? serviceId,
    String? userId,
    String? price,
    String? totalRserved,
    ExtraConfig? extraConfig,
    String? document,
    String? stapes,
    String? isActive,
    ServiceLocation? location,
    String? requireProcess,
    String? totalRate,
    String? rateAvg,
    String? deleted,
    DateTime? creationDate,
    String? serviceName,
    String? serviceEnName,
    String? locationName,
    String? locationEnName,
    String? serviceType,
    String? providerName,
    String? image,
    String? sameDay,
  }) =>
      SubServiceModel(
        id: id ?? this.id,
        name: name ?? this.name,
        enName: enName ?? this.enName,
        descrption: descrption ?? this.descrption,
        enDescrption: enDescrption ?? this.enDescrption,
        code: code ?? this.code,
        serviceId: serviceId ?? this.serviceId,
        userId: userId ?? this.userId,
        price: price ?? this.price,
        totalRserved: totalRserved ?? this.totalRserved,
        extraConfig: extraConfig ?? this.extraConfig,
        document: document ?? this.document,
        stapes: stapes ?? this.stapes,
        isActive: isActive ?? this.isActive,
        location: location ?? this.location,
        requireProcess: requireProcess ?? this.requireProcess,
        totalRate: totalRate ?? this.totalRate,
        rateAvg: rateAvg ?? this.rateAvg,
        deleted: deleted ?? this.deleted,
        creationDate: creationDate ?? this.creationDate,
        serviceName: serviceName ?? this.serviceName,
        serviceEnName: serviceEnName ?? this.serviceEnName,
        locationName: locationName ?? this.locationName,
        locationEnName: locationEnName ?? this.locationEnName,
        serviceType: serviceType ?? this.serviceType,
        providerName: providerName ?? this.providerName,
        image: image ?? this.image,
        sameDay: sameDay ?? this.sameDay,
      );

  factory SubServiceModel.fromJson(Map<String, dynamic> json) =>
      SubServiceModel(
        id: json["id"],
        name: json["name"],
        enName: json["en_name"],
        descrption: json["description"] == null ? '' : json["description"],
        enDescrption:
            json["en_description"] == null ? '' : json["en_description"],
        code: json["code"],
        serviceId: json["service_id"],
        userId: json["user_id"],
        price: json["price"],
        totalRserved: json["total_rserved"],
        extraConfig: json["extra_config"] == null
            ? null
            : ExtraConfig.fromJson(json["extra_config"]),
        document: json["document"] == null ? '' : json["document"],
        stapes: json["stapes"] == null ? '' : json["stapes"],
        isActive: json["is_active"],
        location: json["location"] == null
            ? null
            : ServiceLocation.fromJson(json["location"]),
        requireProcess: json["require_process"],
        totalRate: json["total_rate"],
        rateAvg: json["rate_avg"],
        deleted: json["deleted"],
        creationDate: DateTime.parse(json["creation_date"]),
        serviceName: json["service_name"],
        serviceEnName: json["service_en_name"],
        locationName: json["location_name"],
        locationEnName: json["location_en_name"],
        serviceType: json["service_type"],
        providerName: json["provider_name"],
        image: json["image"],
        sameDay: json["same_date"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "en_name": enName,
        "descrption": descrption,
        "en_descrption": enDescrption,
        "code": code,
        "service_id": serviceId,
        "user_id": userId,
        "price": price,
        "total_rserved": totalRserved,
        "extra_config": extraConfig!.toJson(),
        "document": document,
        "stapes": stapes,
        "is_active": isActive,
        "location": location!.toJson(),
        "require_process": requireProcess,
        "total_rate": totalRate,
        "rate_avg": rateAvg,
        "deleted": deleted,
        "creation_date": creationDate!.toIso8601String(),
        "service_name": serviceName,
        "service_en_name": serviceEnName,
        "location_name": locationName,
        "location_en_name": locationEnName,
        "service_type": serviceType,
        "provider_name": providerName,
        "image": image,
        "same_date": sameDay,
      };
}

class ExtraConfig {
  ExtraConfig({
    this.scheduling,
  });

  Scheduling? scheduling;

  ExtraConfig copyWith({
    Scheduling? scheduling,
  }) =>
      ExtraConfig(
        scheduling: scheduling ?? this.scheduling,
      );

  factory ExtraConfig.fromJson(Map<String, dynamic> json) => ExtraConfig(
        scheduling: Scheduling.fromJson(json["scheduling"]),
      );

  Map<String, dynamic> toJson() => {
        "scheduling": scheduling!.toJson(),
      };
}

class ServiceLocation {
  ServiceLocation({
    this.lat,
    this.long,
  });

  String? lat;
  String? long;

  ServiceLocation copyWith({
    String? lat,
    String? long,
  }) =>
      ServiceLocation(
        lat: lat ?? this.lat,
        long: long ?? this.long,
      );

  factory ServiceLocation.fromJson(Map<String, dynamic> json) =>
      ServiceLocation(
        lat: json["lat"] == null ? null : json["lat"],
        long: json["long"] == null ? null : json["long"],
      );

  Map<String, dynamic> toJson() => {
        "lat": lat == null ? null : lat,
        "long": long == null ? null : long,
      };
}

class Scheduling {
  Scheduling({
    this.endTime,
    this.holidays,
    this.workDays,
    this.startTime,
    this.scheduleDate,
  });

  String? endTime;
  List<Holiday>? holidays;
  List<WorkDay>? workDays;
  String? startTime;
  String? scheduleDate;

  Scheduling copyWith({
    String? endTime,
    List<Holiday>? holidays,
    List<WorkDay>? workDays,
    String? startTime,
    String? scheduleDate,
  }) =>
      Scheduling(
        endTime: endTime ?? this.endTime,
        holidays: holidays ?? this.holidays,
        workDays: workDays ?? this.workDays,
        startTime: startTime ?? this.startTime,
        scheduleDate: scheduleDate ?? this.scheduleDate,
      );

  factory Scheduling.fromJson(Map<String, dynamic> json) => Scheduling(
        endTime: json["end_time"],
        holidays: List<Holiday>.from(
            json["holidays"].map((x) => Holiday.fromJson(x))),
        workDays: List<WorkDay>.from(
            json["work_days"].map((x) => WorkDay.fromJson(x))),
        startTime: json["start_time"],
        scheduleDate: json["schedule_date"],
      );

  Map<String, dynamic> toJson() => {
        "end_time": endTime,
        "holidays": List<dynamic>.from(holidays!.map((x) => x.toJson())),
        "work_days": List<dynamic>.from(workDays!.map((x) => x.toJson())),
        "start_time": startTime,
        "schedule_date": scheduleDate,
      };
}

class Holiday {
  Holiday({
    this.day,
  });

  String? day;

  Holiday copyWith({
    String? day,
  }) =>
      Holiday(
        day: day ?? this.day,
      );

  factory Holiday.fromJson(Map<String, dynamic> json) => Holiday(
        day: json["day"],
      );

  Map<String, dynamic> toJson() => {
        "day": day,
      };
}

class WorkDay {
  WorkDay({
    this.day,
    this.periods,
  });

  String? day;
  List<Period>? periods;

  WorkDay copyWith({
    String? day,
    List<Period>? periods,
  }) =>
      WorkDay(
        day: day ?? this.day,
        periods: periods ?? this.periods,
      );

  factory WorkDay.fromJson(Map<String, dynamic> json) => WorkDay(
        day: json["day"],
        periods:
            List<Period>.from(json["periods"].map((x) => Period.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "day": day,
        "periods": List<dynamic>.from(periods!.map((x) => x.toJson())),
      };
}

class Period {
    Period({
        this.id,
        this.name,
        this.enName,
    });

    int? id;
    String? name;
    String? enName;

    Period copyWith({
        int? id,
        String? name,
        String? enName,
    }) => 
        Period(
            id: id ?? this.id,
            name: name ?? this.name,
            enName: enName ?? this.enName,
        );

    factory Period.fromJson(Map<String, dynamic> json) => Period(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        enName: json["en_name"] == null ? null : json["en_name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "en_name": enName == null ? null : enName,
    };
}

