class TripsHisotryModel {
  int? status;
  List<DriverCompletedTrips>? driverCompletedTrips;
  List<DriverCancelledTrips>? driverCancelledTrips;

  TripsHisotryModel(
      {this.status, this.driverCompletedTrips, this.driverCancelledTrips});

  TripsHisotryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['Driver completed trips'] != null) {
      driverCompletedTrips = <DriverCompletedTrips>[];
      json['Driver completed trips'].forEach((v) {
        driverCompletedTrips!.add(new DriverCompletedTrips.fromJson(v));
      });
    }
    if (json['Driver cancelled trips'] != null) {
      driverCancelledTrips = <DriverCancelledTrips>[];
      json['Driver cancelled trips'].forEach((v) {
        driverCancelledTrips!.add(new DriverCancelledTrips.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.driverCompletedTrips != null) {
      data['Driver completed trips'] =
          this.driverCompletedTrips!.map((v) => v.toJson()).toList();
    }
    if (this.driverCancelledTrips != null) {
      data['Driver cancelled trips'] =
          this.driverCancelledTrips!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DriverCompletedTrips {
  int? id;
  String? date;
  String? time;
  String? from;
  String? to;
  String? total;
  dynamic carType;
  String? status;

  DriverCompletedTrips(
      {this.id,
        this.date,
        this.time,
        this.from,
        this.to,
        this.total,
        this.carType,
        this.status});

  DriverCompletedTrips.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    time = json['time'];
    from = json['from'];
    to = json['to'];
    total = json['total'];
    carType = json['car_type'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['time'] = this.time;
    data['from'] = this.from;
    data['to'] = this.to;
    data['total'] = this.total;
    data['car_type'] = this.carType;
    data['status'] = this.status;
    return data;
  }
}

class DriverCancelledTrips {
  int? id;
  int? rider;
  String? pickup;
  String? pickupTitle;
  String? pickupLatitude;
  String? pickupLongitude;
  String? destinationSpecified;
  String? destination;
  String? destinationTitle;
  String? destinationLatitude;
  String? destinationLongitude;
  dynamic state;
  dynamic estimatedDistance;
  String? paymentMethod;
  dynamic preferredVehicleType;
  int? driver;
  int? vehicle;
  String? acceptedAt;
  String? driverLocation;
  String? driverLocationLatitude;
  String? driverLocationLongitude;
  dynamic driverToPickupDistance;
  dynamic estimatedFare;
  dynamic estimatedPickupTime;
  dynamic estimatedDropOffTime;
  String? status;
  dynamic driverArrivalTime;
  dynamic actualPickupLocation;
  dynamic actualPickupLatitude;
  dynamic actualPickupLongitude;
  dynamic tripStartTime;
  dynamic waitTime;
  dynamic tripEndTime;
  dynamic tripDuration;
  dynamic actualDistance;
  dynamic actualFare;
  dynamic actualDropOffTime;
  dynamic actualDropOffLocation;
  dynamic actualDropOffTitle;
  dynamic actualDropOffLatitude;
  dynamic actualDropOffLongitude;
  dynamic tax;
  dynamic surcharges;
  dynamic total;
  dynamic grandTotal;
  dynamic driverTotal;
  dynamic tolls;
  dynamic tips;
  String? shift;
  dynamic surge;
  dynamic invoice;
  dynamic cancelledBy;
  dynamic cancellationReason;
  String? createdAt;
  String? updatedAt;

  DriverCancelledTrips(
      {this.id,
        this.rider,
        this.pickup,
        this.pickupTitle,
        this.pickupLatitude,
        this.pickupLongitude,
        this.destinationSpecified,
        this.destination,
        this.destinationTitle,
        this.destinationLatitude,
        this.destinationLongitude,
        this.state,
        this.estimatedDistance,
        this.paymentMethod,
        this.preferredVehicleType,
        this.driver,
        this.vehicle,
        this.acceptedAt,
        this.driverLocation,
        this.driverLocationLatitude,
        this.driverLocationLongitude,
        this.driverToPickupDistance,
        this.estimatedFare,
        this.estimatedPickupTime,
        this.estimatedDropOffTime,
        this.status,
        this.driverArrivalTime,
        this.actualPickupLocation,
        this.actualPickupLatitude,
        this.actualPickupLongitude,
        this.tripStartTime,
        this.waitTime,
        this.tripEndTime,
        this.tripDuration,
        this.actualDistance,
        this.actualFare,
        this.actualDropOffTime,
        this.actualDropOffLocation,
        this.actualDropOffTitle,
        this.actualDropOffLatitude,
        this.actualDropOffLongitude,
        this.tax,
        this.surcharges,
        this.total,
        this.grandTotal,
        this.driverTotal,
        this.tolls,
        this.tips,
        this.shift,
        this.surge,
        this.invoice,
        this.cancelledBy,
        this.cancellationReason,
        this.createdAt,
        this.updatedAt});

  DriverCancelledTrips.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rider = json['rider'];
    pickup = json['pickup'];
    pickupTitle = json['pickup_title'];
    pickupLatitude = json['pickup_latitude'];
    pickupLongitude = json['pickup_longitude'];
    destinationSpecified = json['destination_specified'];
    destination = json['destination'];
    destinationTitle = json['destination_title'];
    destinationLatitude = json['destination_latitude'];
    destinationLongitude = json['destination_longitude'];
    state = json['state'];
    estimatedDistance = json['estimated_distance'];
    paymentMethod = json['payment_method'];
    preferredVehicleType = json['preferred_vehicle_type'];
    driver = json['driver'];
    vehicle = json['vehicle'];
    acceptedAt = json['accepted_at'];
    driverLocation = json['driver_location'];
    driverLocationLatitude = json['driver_location_latitude'];
    driverLocationLongitude = json['driver_location_longitude'];
    driverToPickupDistance = json['driver_to_pickup_distance'];
    estimatedFare = json['estimated_fare'];
    estimatedPickupTime = json['estimated_pickup_time'];
    estimatedDropOffTime = json['estimated_drop_off_time'];
    status = json['status'];
    driverArrivalTime = json['driver_arrival_time'];
    actualPickupLocation = json['actual_pickup_location'];
    actualPickupLatitude = json['actual_pickup_latitude'];
    actualPickupLongitude = json['actual_pickup_longitude'];
    tripStartTime = json['trip_start_time'];
    waitTime = json['wait_time'];
    tripEndTime = json['trip_end_time'];
    tripDuration = json['trip_duration'];
    actualDistance = json['actual_distance'];
    actualFare = json['actual_fare'];
    actualDropOffTime = json['actual_drop_off_time'];
    actualDropOffLocation = json['actual_drop_off_location'];
    actualDropOffTitle = json['actual_drop_off_title'];
    actualDropOffLatitude = json['actual_drop_off_latitude'];
    actualDropOffLongitude = json['actual_drop_off_longitude'];
    tax = json['tax'];
    surcharges = json['surcharges'];
    total = json['total'];
    grandTotal = json['grand_total'];
    driverTotal = json['driver_total'];
    tolls = json['tolls'];
    tips = json['tips'];
    shift = json['shift'];
    surge = json['surge'];
    invoice = json['invoice'];
    cancelledBy = json['cancelled_by'];
    cancellationReason = json['cancellation_reason'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['rider'] = this.rider;
    data['pickup'] = this.pickup;
    data['pickup_title'] = this.pickupTitle;
    data['pickup_latitude'] = this.pickupLatitude;
    data['pickup_longitude'] = this.pickupLongitude;
    data['destination_specified'] = this.destinationSpecified;
    data['destination'] = this.destination;
    data['destination_title'] = this.destinationTitle;
    data['destination_latitude'] = this.destinationLatitude;
    data['destination_longitude'] = this.destinationLongitude;
    data['state'] = this.state;
    data['estimated_distance'] = this.estimatedDistance;
    data['payment_method'] = this.paymentMethod;
    data['preferred_vehicle_type'] = this.preferredVehicleType;
    data['driver'] = this.driver;
    data['vehicle'] = this.vehicle;
    data['accepted_at'] = this.acceptedAt;
    data['driver_location'] = this.driverLocation;
    data['driver_location_latitude'] = this.driverLocationLatitude;
    data['driver_location_longitude'] = this.driverLocationLongitude;
    data['driver_to_pickup_distance'] = this.driverToPickupDistance;
    data['estimated_fare'] = this.estimatedFare;
    data['estimated_pickup_time'] = this.estimatedPickupTime;
    data['estimated_drop_off_time'] = this.estimatedDropOffTime;
    data['status'] = this.status;
    data['driver_arrival_time'] = this.driverArrivalTime;
    data['actual_pickup_location'] = this.actualPickupLocation;
    data['actual_pickup_latitude'] = this.actualPickupLatitude;
    data['actual_pickup_longitude'] = this.actualPickupLongitude;
    data['trip_start_time'] = this.tripStartTime;
    data['wait_time'] = this.waitTime;
    data['trip_end_time'] = this.tripEndTime;
    data['trip_duration'] = this.tripDuration;
    data['actual_distance'] = this.actualDistance;
    data['actual_fare'] = this.actualFare;
    data['actual_drop_off_time'] = this.actualDropOffTime;
    data['actual_drop_off_location'] = this.actualDropOffLocation;
    data['actual_drop_off_title'] = this.actualDropOffTitle;
    data['actual_drop_off_latitude'] = this.actualDropOffLatitude;
    data['actual_drop_off_longitude'] = this.actualDropOffLongitude;
    data['tax'] = this.tax;
    data['surcharges'] = this.surcharges;
    data['total'] = this.total;
    data['grand_total'] = this.grandTotal;
    data['driver_total'] = this.driverTotal;
    data['tolls'] = this.tolls;
    data['tips'] = this.tips;
    data['shift'] = this.shift;
    data['surge'] = this.surge;
    data['invoice'] = this.invoice;
    data['cancelled_by'] = this.cancelledBy;
    data['cancellation_reason'] = this.cancellationReason;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
