class OrderResponse {
  OrderResponse({
    this.id,
    this.name,
    // this.customerId,
    this.state,
    this.lat,
    this.lng,
    this.dateOrder,
    this.datePickup,
    this.dateDelivery,
    this.dateLaundryReceived,
    this.dateCustomerReceived,
    this.dateOrderComplete,
    this.amountService,
    this.note,
  });

  int? id;
  String? name;
  //? List<dynamic> customerId;
  String? state;

  String? lat;
  String? lng;
  DateTime? dateOrder;
  DateTime? datePickup;
  DateTime? dateDelivery;
  DateTime? dateLaundryReceived;
  DateTime? dateCustomerReceived;
  DateTime? dateOrderComplete;
  double? amountService;
  String? note;

  factory OrderResponse.fromJson(Map<String, dynamic> json) => OrderResponse(
        id: json["id"] == false ? null : json["id"] as int,
        name: json["name"] == false ? null : json["name"],
        /*  customerId: json["customer_id"] == false
            ? null
            : List<dynamic>.from(json["customer_id"].map((x) => x)), */
        state: json["state"] == false ? null : json["state"],
        lat: json["lat"] == false ? null : json["lat"],
        lng: json["lng"] == false ? null : json["lng"],
        dateOrder: json["date_order"] == false
            ? null
            : DateTime.parse(json["date_order"]),
        datePickup: json["date_pickup"] == false
            ? null
            : DateTime.parse(json["date_pickup"]),
        dateDelivery: json["date_delivery"] == false
            ? null
            : DateTime.parse(json["date_delivery"]),
        dateLaundryReceived: json["date_laundry_received"] == false
            ? null
            : DateTime.parse(json["date_laundry_received"]),
        dateCustomerReceived: json["date_customer_received"] == false
            ? null
            : DateTime.parse(json["date_customer_received"]),
        dateOrderComplete: json["date_order_complete"] == false
            ? null
            : DateTime.parse(json["date_order_complete"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "state": state,
        "lat": lat,
        "lng": lng,
        "date_order": dateOrder == null ? null : dateOrder!.toIso8601String(),
        "date_pickup": datePickup,
        "date_delivery": dateDelivery,
        "date_laundry_received": dateLaundryReceived,
        "date_customer_received": dateCustomerReceived,
        "date_order_complete": dateOrderComplete,
        "amount_service": amountService,
        "note": note,
      };
}
