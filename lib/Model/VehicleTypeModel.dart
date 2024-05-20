class VehicleTypesModel {
  int? status;
  List<VehicleTypes>? vehicleTypes;

  VehicleTypesModel({this.status, this.vehicleTypes});

  VehicleTypesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['Vehicle types'] != null) {
      vehicleTypes = <VehicleTypes>[];
      json['Vehicle types'].forEach((v) {
        vehicleTypes!.add(new VehicleTypes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.vehicleTypes != null) {
      data['Vehicle types'] =
          this.vehicleTypes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class VehicleTypes {
  int? id;
  String? title;
  String? description;
  String? image;
  String? baseFare;
  String? bookingFees;
  String? costPerMinute;
  String? costPerMile;
  String? waitingMinutes;
  String? costPerWaitingMinute;
  String? surcharges;
  String? dayLow;
  String? dayMedium;
  String? dayHigh;
  String? nightLow;
  String? nightMedium;
  String? nightHigh;
  String? overnightLow;
  String? overnightMedium;
  String? overnightHigh;
  String? cancellationCharges;
  String? otherChargesPerMinute;
  String? otherChargesPerMile;
  String? driverPercentage;
  String? driverOtherCharges;
  String? insurancePerMile;
  String? createdAt;
  String? updatedAt;

  VehicleTypes(
      {this.id,
        this.title,
        this.description,
        this.image,
        this.baseFare,
        this.bookingFees,
        this.costPerMinute,
        this.costPerMile,
        this.waitingMinutes,
        this.costPerWaitingMinute,
        this.surcharges,
        this.dayLow,
        this.dayMedium,
        this.dayHigh,
        this.nightLow,
        this.nightMedium,
        this.nightHigh,
        this.overnightLow,
        this.overnightMedium,
        this.overnightHigh,
        this.cancellationCharges,
        this.otherChargesPerMinute,
        this.otherChargesPerMile,
        this.driverPercentage,
        this.driverOtherCharges,
        this.insurancePerMile,
        this.createdAt,
        this.updatedAt});

  VehicleTypes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    baseFare = json['base_fare'];
    bookingFees = json['booking_fees'];
    costPerMinute = json['cost_per_minute'];
    costPerMile = json['cost_per_mile'];
    waitingMinutes = json['waiting_minutes'];
    costPerWaitingMinute = json['cost_per_waiting_minute'];
    surcharges = json['surcharges'];
    dayLow = json['day_low'];
    dayMedium = json['day_medium'];
    dayHigh = json['day_high'];
    nightLow = json['night_low'];
    nightMedium = json['night_medium'];
    nightHigh = json['night_high'];
    overnightLow = json['overnight_low'];
    overnightMedium = json['overnight_medium'];
    overnightHigh = json['overnight_high'];
    cancellationCharges = json['cancellation_charges'];
    otherChargesPerMinute = json['other_charges_per_minute'];
    otherChargesPerMile = json['other_charges_per_mile'];
    driverPercentage = json['driver_percentage'];
    driverOtherCharges = json['driver_other_charges'];
    insurancePerMile = json['insurance_per_mile'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['image'] = this.image;
    data['base_fare'] = this.baseFare;
    data['booking_fees'] = this.bookingFees;
    data['cost_per_minute'] = this.costPerMinute;
    data['cost_per_mile'] = this.costPerMile;
    data['waiting_minutes'] = this.waitingMinutes;
    data['cost_per_waiting_minute'] = this.costPerWaitingMinute;
    data['surcharges'] = this.surcharges;
    data['day_low'] = this.dayLow;
    data['day_medium'] = this.dayMedium;
    data['day_high'] = this.dayHigh;
    data['night_low'] = this.nightLow;
    data['night_medium'] = this.nightMedium;
    data['night_high'] = this.nightHigh;
    data['overnight_low'] = this.overnightLow;
    data['overnight_medium'] = this.overnightMedium;
    data['overnight_high'] = this.overnightHigh;
    data['cancellation_charges'] = this.cancellationCharges;
    data['other_charges_per_minute'] = this.otherChargesPerMinute;
    data['other_charges_per_mile'] = this.otherChargesPerMile;
    data['driver_percentage'] = this.driverPercentage;
    data['driver_other_charges'] = this.driverOtherCharges;
    data['insurance_per_mile'] = this.insurancePerMile;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
