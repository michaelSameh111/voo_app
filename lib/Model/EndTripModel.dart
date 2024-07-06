class EndTripModel {
  int? status;
  String? message;
  String? tripEndTime;
  double? total;
  double? grandTotal;
  double? driverTotal;
  int? tripDuration;
  String? pickup;
  String? riderName;
  String? destination;
  dynamic driverTotalTrips;
  dynamic driverFees;

  EndTripModel(
      {this.status,
        this.message,
        this.tripEndTime,
        this.total,
        this.grandTotal,
        this.driverTotal,
        this.tripDuration,
        this.pickup,
        this.riderName,
        this.destination,
        this.driverTotalTrips,
        this.driverFees,
      });

  EndTripModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    riderName = json['rider_name'];
    tripEndTime = json['trip_end_time'];
    total = json['total'];
    grandTotal = json['grand_total'];
    driverTotal = json['driver_total'];
    tripDuration = json['Trip duration'];
    pickup = json['Pickup'];
    destination = json['Destination'];
    driverTotalTrips = json['driver_total_trips'];
    driverFees = json['driver_total_fees'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['trip_end_time'] = this.tripEndTime;
    data['total'] = this.total;
    data['grand_total'] = this.grandTotal;
    data['driver_total'] = this.driverTotal;
    data['Trip duration'] = this.tripDuration;
    data['Pickup'] = this.pickup;
    data['Destination'] = this.destination;
    return data;
  }
}
