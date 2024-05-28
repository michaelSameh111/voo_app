class TripModel {
  String? preferredVehicleType;
  String? tripId;
  String? pickupLongitude;
  String? pickupLatitude;
  String? destinationLatitude;
  String? shift;
  String? destination;
  String? pickup;
  String? destinationLongitude;
  String? rider;
  String? destinationSpecified;
  String? paymentMethod;

  TripModel({
    this.preferredVehicleType,
    this.tripId,
    this.pickupLongitude,
    this.pickupLatitude,
    this.destinationLatitude,
    this.shift,
    this.destination,
    this.pickup,
    this.destinationLongitude,
    this.rider,
    this.destinationSpecified,
    this.paymentMethod,
  });

  factory TripModel.fromJson(Map<String, dynamic> json) {
    return TripModel(
      preferredVehicleType: json['"preferred_vehicle_type"'],
      pickupLongitude: json['pickup_longitude'],
      tripId: json['trip_id'],
      pickupLatitude: json['pickup_latitude'],
      destinationLatitude: json['destination_latitude'],
      shift: json['shift'],
      destination: json['destination'],
      pickup: json['pickup'],
      destinationLongitude: json['destination_longitude'],
      rider: json['rider'],
      destinationSpecified: json['destination_specified'],
      paymentMethod: json['payment_method'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'preferred_vehicle_type': preferredVehicleType,
      'pickup_longitude': pickupLongitude,
      'pickup_latitude': pickupLatitude,
      'destination_latitude': destinationLatitude,
      'shift': shift,
      'destination': destination,
      'pickup': pickup,
      'destination_longitude': destinationLongitude,
      'rider': rider,
      'destination_specified': destinationSpecified,
      'payment_method': paymentMethod,
    };
  }
}