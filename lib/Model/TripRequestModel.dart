class TripRequest {
  final String pickupLongitude;
  final String destinationLatitude;
  final String shift;
  final String? destination;
  final String fees1;
  String? tax ;
  final String? pickup;
  final String fees2;
  final String destinationLongitude;
  final String message;
  final String rider;
  final String preferredVehicleType;
  final String pickupLatitude;
  final String destinationSpecified;
  final String riderId;

  TripRequest({
    required this.pickupLongitude,
    required this.destinationLatitude,
    required this.shift,
    required this.destination,
    required this.fees1,
    required this.pickup,
    required this.fees2,
    required this.destinationLongitude,
    required this.message,
    required this.rider,
    required this.preferredVehicleType,
    required this.pickupLatitude,
    required this.destinationSpecified,
    required this.riderId,
    this.tax
  });

  factory TripRequest.fromJson(Map<String, dynamic> json) {
    return TripRequest(
      pickupLongitude: json['pickup_longitude'],
      riderId: json['rider_id'],
      destinationLatitude: json['destination_latitude'],
      shift: json['shift'],
      destination: json['destination'],
      fees1: json['fees1'],
      pickup: json['pickup'],
      fees2: json['fees2'],
      tax: json['tax'],
      destinationLongitude: json['destination_longitude'],
      message: json['message'],
      rider: json['rider'],
      preferredVehicleType: json['preferred_vehicle_type'],
      pickupLatitude: json['pickup_latitude'],
      destinationSpecified: json['destination_specified'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pickup_longitude': pickupLongitude,
      'destination_latitude': destinationLatitude,
      'shift': shift,
      'destination': destination,
      'fees1': fees1,
      'pickup': pickup,
      'fees2': fees2,
      'destination_longitude': destinationLongitude,
      'message': message,
      'rider': rider,
      'preferred_vehicle_type': preferredVehicleType,
      'pickup_latitude': pickupLatitude,
      'destination_specified': destinationSpecified,
    };
  }
}
