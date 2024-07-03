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
  String? acceptedAt;
  String? date;
  String? time;
  String? from;
  String? to;
  String? total;
  String? carType;
  String? status;
  String? pickup;
  dynamic dropoff;
  String? duration;
  dynamic distance;
  String? grandTotal;
  String? driverTotal;
  String? tolls;
  String? tips;
  String? invoice;
  String? driverName;
  String? driverPhoto;
  String? riderName;
  String? riderPhoto;

  DriverCompletedTrips(
      {this.id,
        this.acceptedAt,
        this.date,
        this.time,
        this.from,
        this.to,
        this.total,
        this.carType,
        this.status,
        this.pickup,
        this.dropoff,
        this.duration,
        this.distance,
        this.grandTotal,
        this.driverTotal,
        this.tolls,
        this.tips,
        this.invoice,
        this.driverName,
        this.driverPhoto,
        this.riderName,
        this.riderPhoto});

  DriverCompletedTrips.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    acceptedAt = json['accepted_at'];
    date = json['date'];
    time = json['time'];
    from = json['from'];
    to = json['to'];
    total = json['total'];
    carType = json['car_type'];
    status = json['status'];
    pickup = json['pickup'];
    dropoff = json['dropoff'];
    duration = json['duration'];
    distance = json['distance'];
    grandTotal = json['grand_total'];
    driverTotal = json['driver_total'];
    tolls = json['tolls'];
    tips = json['tips'];
    invoice = json['invoice'];
    driverName = json['driver_name'];
    driverPhoto = json['driver_photo'];
    riderName = json['rider_name'];
    riderPhoto = json['rider_photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['accepted_at'] = this.acceptedAt;
    data['date'] = this.date;
    data['time'] = this.time;
    data['from'] = this.from;
    data['to'] = this.to;
    data['total'] = this.total;
    data['car_type'] = this.carType;
    data['status'] = this.status;
    data['pickup'] = this.pickup;
    data['dropoff'] = this.dropoff;
    data['duration'] = this.duration;
    data['distance'] = this.distance;
    data['grand_total'] = this.grandTotal;
    data['driver_total'] = this.driverTotal;
    data['tolls'] = this.tolls;
    data['tips'] = this.tips;
    data['invoice'] = this.invoice;
    data['driver_name'] = this.driverName;
    data['driver_photo'] = this.driverPhoto;
    data['rider_name'] = this.riderName;
    data['rider_photo'] = this.riderPhoto;
    return data;
  }
}

class DriverCancelledTrips {
  int? id;
  String? date;
  String? time;
  String? acceptedAt;
  String? from;
  String? to;
  String? total;
  String? carType;
  String? status;
  String? pickup;
  dynamic dropoff;
  String? duration;
  dynamic distance;
  String? grandTotal;
  String? driverTotal;
  String? tolls;
  String? tips;
  String? invoice;
  String? driverName;
  String? driverPhoto;
  String? riderName;
  String? riderPhoto;
  String? canceledBy;
  dynamic cancellationReason;

  DriverCancelledTrips(
      {this.id,
        this.date,
        this.time,
        this.acceptedAt,
        this.from,
        this.to,
        this.total,
        this.carType,
        this.status,
        this.pickup,
        this.dropoff,
        this.duration,
        this.distance,
        this.grandTotal,
        this.driverTotal,
        this.tolls,
        this.tips,
        this.invoice,
        this.driverName,
        this.driverPhoto,
        this.riderName,
        this.riderPhoto,
        this.canceledBy,
        this.cancellationReason});

  DriverCancelledTrips.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    time = json['time'];
    acceptedAt = json['accepted_at'];
    from = json['from'];
    to = json['to'];
    total = json['total'];
    carType = json['car_type'];
    status = json['status'];
    pickup = json['pickup'];
    dropoff = json['dropoff'];
    duration = json['duration'];
    distance = json['distance'];
    grandTotal = json['grand_total'];
    driverTotal = json['driver_total'];
    tolls = json['tolls'];
    tips = json['tips'];
    invoice = json['invoice'];
    driverName = json['driver_name'];
    driverPhoto = json['driver_photo'];
    riderName = json['rider_name'];
    riderPhoto = json['rider_photo'];
    canceledBy = json['canceled_by'];
    cancellationReason = json['cancellation_reason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['time'] = this.time;
    data['accepted_at'] = this.acceptedAt;
    data['from'] = this.from;
    data['to'] = this.to;
    data['total'] = this.total;
    data['car_type'] = this.carType;
    data['status'] = this.status;
    data['pickup'] = this.pickup;
    data['dropoff'] = this.dropoff;
    data['duration'] = this.duration;
    data['distance'] = this.distance;
    data['grand_total'] = this.grandTotal;
    data['driver_total'] = this.driverTotal;
    data['tolls'] = this.tolls;
    data['tips'] = this.tips;
    data['invoice'] = this.invoice;
    data['driver_name'] = this.driverName;
    data['driver_photo'] = this.driverPhoto;
    data['rider_name'] = this.riderName;
    data['rider_photo'] = this.riderPhoto;
    data['canceled_by'] = this.canceledBy;
    data['cancellation_reason'] = this.cancellationReason;
    return data;
  }
}
