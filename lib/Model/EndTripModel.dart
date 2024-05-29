class EndTripModel {
  int? status;
  String? message;
  String? tripEndTime;
  double? total;
  double? grandTotal;
  double? driverTotal;

  EndTripModel(
      {this.status,
        this.message,
        this.tripEndTime,
        this.total,
        this.grandTotal,
        this.driverTotal});

  EndTripModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    tripEndTime = json['trip_end_time'];
    total = json['total'];
    grandTotal = json['grand_total'];
    driverTotal = json['driver_total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['trip_end_time'] = this.tripEndTime;
    data['total'] = this.total;
    data['grand_total'] = this.grandTotal;
    data['driver_total'] = this.driverTotal;
    return data;
  }
}
