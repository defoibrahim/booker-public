// To parse this JSON data, do
//
//     final booking = bookingFromMap(jsonString);

import 'dart:convert';

Booking bookingFromMap(String str) => Booking.fromMap(json.decode(str));

String bookingToMap(Booking data) => json.encode(data.toMap());

class Booking {
  Booking({
    this.id,
    this.msisdn,
    this.requestMsisdn,
    this.name,
    this.productCode,
    this.date,
    this.day,
    this.period,
    this.requireProcess,
    this.price,
    this.status,
    this.forAther,
    this.creationDate,
    this.serviceName,
    this.serviceEnName,
    this.serviceId,
    this.productName,
    this.productEnName,
    this.productId,
    this.providerName,
    this.providerId,
  });

  final String? id;
  final String? msisdn;
  final String? requestMsisdn;
  final String? name;
  final String? productCode;
  final DateTime? date;
  final String? day;
  final String? period;
  final String? requireProcess;
  final String? price;
  final String? status;
  final String? forAther;
  final DateTime? creationDate;
  final String? serviceName;
  final String? serviceEnName;
  final String? serviceId;
  final String? productName;
  final String? productEnName;
  final String? productId;
  final String? providerName;
  final String? providerId;

  factory Booking.fromMap(Map<String, dynamic> json) => Booking(
        id: json["id"] == null ? null : json["id"],
        msisdn: json["msisdn"] == null ? null : json["msisdn"],
        requestMsisdn:
            json["request_msisdn"] == null ? null : json["request_msisdn"],
        name: json["name"] == null ? null : json["name"],
        productCode: json["product_code"] == null ? null : json["product_code"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        day: json["day"] == null ? null : json["day"],
        period: json["period"] == null ? null : json["period"],
        requireProcess:
            json["require_process"] == null ? null : json["require_process"],
        price: json["price"] == null ? null : json["price"],
        status: json["status"] == null ? null : json["status"],
        forAther: json["for_ather"] == null ? null : json["for_ather"],
        creationDate: json["creation_date"] == null
            ? null
            : DateTime.parse(json["creation_date"]),
        serviceName: json["service_name"] == null ? null : json["service_name"],
        serviceEnName:
            json["service_en_name"] == null ? null : json["service_en_name"],
        serviceId: json["service_id"] == null ? null : json["service_id"],
        productName: json["product_name"] == null ? null : json["product_name"],
        productEnName:
            json["product_en_name"] == null ? null : json["product_en_name"],
        productId: json["product_id"] == null ? null : json["product_id"],
        providerName:
            json["provider_name"] == null ? null : json["provider_name"],
        providerId: json["provider_id"] == null ? null : json["provider_id"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "msisdn": msisdn == null ? null : msisdn,
        "request_msisdn": requestMsisdn == null ? null : requestMsisdn,
        "name": name == null ? null : name,
        "product_code": productCode == null ? null : productCode,
        "date": date == null ? null : date!.toIso8601String(),
        "day": day == null ? null : day,
        "period": period == null ? null : period,
        "require_process": requireProcess == null ? null : requireProcess,
        "price": price == null ? null : price,
        "status": status == null ? null : status,
        "for_ather": forAther == null ? null : forAther,
        "creation_date":
            creationDate == null ? null : creationDate!.toIso8601String(),
        "service_name": serviceName == null ? null : serviceName,
        "service_en_name": serviceEnName == null ? null : serviceEnName,
        "service_id": serviceId == null ? null : serviceId,
        "product_name": productName == null ? null : productName,
        "product_en_name": productEnName == null ? null : productEnName,
        "product_id": productId == null ? null : productId,
        "provider_name": providerName == null ? null : providerName,
        "provider_id": providerId == null ? null : providerId,
      };
}
