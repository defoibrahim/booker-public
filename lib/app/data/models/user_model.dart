class User {
  User({
    this.walletData,
    this.msisdn,
    this.name,
    this.email,
    this.gender,
    this.birthday,
    this.isActive,
    this.operatorId,
    this.operatorName,
    this.subdateUnix,
  });

  final WalletData? walletData;
  final String? msisdn;
  final String? name;
  final String? email;
  final String? gender;
  final String? birthday;
  final int? isActive;
  final int? operatorId;
  final String? operatorName;
  final int? subdateUnix;

  factory User.fromMap(Map<String, dynamic> json) => User(
        walletData: json["wallet_data"] == null
            ? null
            : WalletData.fromMap(json["wallet_data"]),
        msisdn: json["msisdn"] == null ? null : json["msisdn"],
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        gender: json["gender"] == null ? null : json["gender"],
        birthday: json["birthday"],
        isActive: json["is_active"] == null ? null : int.parse(json["is_active"].toString()),
        operatorId: json["operator_id"] == null ? null : json["operator_id"],
        operatorName:
            json["operator_name"] == null ? null : json["operator_name"],
        subdateUnix: json["subdate_unix"] == null ? null : json["subdate_unix"],
      );

  Map<String, dynamic> toMap() => {
        "wallet_data": walletData == null ? null : walletData!.toMap(),
        "msisdn": msisdn == null ? null : msisdn,
        "name": name == null ? null : name,
        "email": email == null ? null : email,
        "gender": gender == null ? null : gender,
        "birthday": birthday,
        "is_active": isActive == null ? null : isActive,
        "operator_id": operatorId == null ? null : operatorId,
        "operator_name": operatorName == null ? null : operatorName,
        "subdate_unix": subdateUnix == null ? null : subdateUnix,
      };
}

class WalletData {
  WalletData({
    this.success,
    this.message,
    this.errorCode,
    this.saved,
    this.walletId,
  });

  final bool? success;
  final String? message;
  final int? errorCode;
  final bool? saved;
  final String? walletId;

  factory WalletData.fromMap(Map<String, dynamic> json) => WalletData(
        success: json["success"] == null ? null : json["success"],
        message: json["message"] == null ? null : json["message"],
        errorCode: json["error_code"] == null ? null : json["error_code"],
        saved: json["saved"] == null ? null : json["saved"],
        walletId: json["wallet_id"] == null ? null : json["wallet_id"],
      );

  Map<String, dynamic> toMap() => {
        "success": success == null ? null : success,
        "message": message == null ? null : message,
        "error_code": errorCode == null ? null : errorCode,
        "saved": saved == null ? null : saved,
        "wallet_id": walletId == null ? null : walletId,
      };
}
