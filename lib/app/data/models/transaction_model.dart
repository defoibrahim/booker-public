// To parse this JSON data, do
//
//     final transaction = transactionFromMap(jsonString);

import 'dart:convert';

Transaction transactionFromMap(String str) =>
    Transaction.fromMap(json.decode(str));

String transactionToMap(Transaction data) => json.encode(data.toMap());

class Transaction {
  Transaction({
    this.id,
    this.msisdn,
    this.chargingType,
    this.price,
    this.success,
    this.creationDate,
  });

  final String? id;
  final String? msisdn;
  final String? chargingType;
  final String? price;
  final String? success;
  final DateTime? creationDate;

  factory Transaction.fromMap(Map<String, dynamic> json) => Transaction(
        id: json["id"] == null ? null : json["id"],
        msisdn: json["msisdn"] == null ? null : json["msisdn"],
        chargingType:
            json["charging_type"] == null ? null : json["charging_type"],
        price: json["price"] == null ? null : json["price"],
        success: json["success"] == null ? null : json["success"],
        creationDate: json["creation_date"] == null
            ? null
            : DateTime.parse(json["creation_date"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "msisdn": msisdn == null ? null : msisdn,
        "charging_type": chargingType == null ? null : chargingType,
        "price": price == null ? null : price,
        "success": success == null ? null : success,
        "creation_date":
            creationDate == null ? null : creationDate!.toIso8601String(),
      };
}
