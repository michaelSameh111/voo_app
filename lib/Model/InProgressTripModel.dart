class InProgressTripModel {
  int? status;
  DriverInProgressTrip? driverInProgressTrip;
  String? vehicleType;
  String? seats;
  String? plateInfo;
  String? driverName;
  String? phone;
  String? riderName;

  InProgressTripModel(
      {this.status,
        this.driverInProgressTrip,
        this.vehicleType,
        this.seats,
        this.plateInfo,
        this.driverName,
        this.phone,
        this.riderName});

  InProgressTripModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    driverInProgressTrip = json['Driver in progress trip'] != null
        ? new DriverInProgressTrip.fromJson(json['Driver in progress trip'])
        : null;
    vehicleType = json['vehicle_type'];
    seats = json['seats'];
    plateInfo = json['plate_info'];
    driverName = json['driver_name'];
    phone = json['phone'];
    riderName = json['rider_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.driverInProgressTrip != null) {
      data['Driver in progress trip'] = this.driverInProgressTrip!.toJson();
    }
    data['vehicle_type'] = this.vehicleType;
    data['seats'] = this.seats;
    data['plate_info'] = this.plateInfo;
    data['driver_name'] = this.driverName;
    data['phone'] = this.phone;
    data['rider_name'] = this.riderName;
    return data;
  }
}

class DriverInProgressTrip {
  int? id;
  Rider? rider;
  String? pickup;
  String? pickupTitle;
  String? pickupLatitude;
  String? pickupLongitude;
  String? destinationSpecified;
  String? destination;
  String? destinationTitle;
  String? destinationLatitude;
  String? destinationLongitude;
  String? state;
  dynamic estimatedDistance;
  String? paymentMethod;
  int? preferredVehicleType;
  Driver? driver;
  Vehicle? vehicle;
  String? acceptedAt;
  dynamic driverLocation;
  dynamic driverLocationLatitude;
  dynamic driverLocationLongitude;
  dynamic driverToPickupDistance;
  dynamic estimatedFare;
  dynamic estimatedPickupTime;
  dynamic estimatedDropOffTime;
  String? status;
  String? driverArrivalTime;
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

  DriverInProgressTrip(
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

  DriverInProgressTrip.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rider = json['rider'] != null ? new Rider.fromJson(json['rider']) : null;
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
    driver =
    json['driver'] != null ? new Driver.fromJson(json['driver']) : null;
    vehicle =
    json['vehicle'] != null ? new Vehicle.fromJson(json['vehicle']) : null;
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
    if (this.rider != null) {
      data['rider'] = this.rider!.toJson();
    }
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
    if (this.driver != null) {
      data['driver'] = this.driver!.toJson();
    }
    if (this.vehicle != null) {
      data['vehicle'] = this.vehicle!.toJson();
    }
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

class Rider {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  dynamic emailVerifiedAt;
  dynamic verificationCode;
  dynamic verificationCodeCreatedAt;
  String? phone;
  String? gender;
  String? dateOfBirth;
  String? role;
  dynamic rate;
  String? wallet;
  String? points;
  String? bonusEarned;
  dynamic serviceRadius;
  dynamic serviceRadiusLocation;
  dynamic serviceRadiusLatitude;
  dynamic serviceRadiusLongitude;
  String? image;
  dynamic status;
  dynamic acceptingRides;
  dynamic driverStatus;
  dynamic driverLocation;
  dynamic driverLatitude;
  dynamic driverLongitude;
  String? fcmToken;
  dynamic stripeId;
  String? createdAt;
  String? updatedAt;

  Rider(
      {this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.emailVerifiedAt,
        this.verificationCode,
        this.verificationCodeCreatedAt,
        this.phone,
        this.gender,
        this.dateOfBirth,
        this.role,
        this.rate,
        this.wallet,
        this.points,
        this.bonusEarned,
        this.serviceRadius,
        this.serviceRadiusLocation,
        this.serviceRadiusLatitude,
        this.serviceRadiusLongitude,
        this.image,
        this.status,
        this.acceptingRides,
        this.driverStatus,
        this.driverLocation,
        this.driverLatitude,
        this.driverLongitude,
        this.fcmToken,
        this.stripeId,
        this.createdAt,
        this.updatedAt});

  Rider.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    verificationCode = json['verification_code'];
    verificationCodeCreatedAt = json['verification_code_created_at'];
    phone = json['phone'];
    gender = json['gender'];
    dateOfBirth = json['date_of_birth'];
    role = json['role'];
    rate = json['rate'];
    wallet = json['wallet'];
    points = json['points'];
    bonusEarned = json['bonus_earned'];
    serviceRadius = json['service_radius'];
    serviceRadiusLocation = json['service_radius_location'];
    serviceRadiusLatitude = json['service_radius_latitude'];
    serviceRadiusLongitude = json['service_radius_longitude'];
    image = json['image'];
    status = json['status'];
    acceptingRides = json['accepting_rides'];
    driverStatus = json['driver_status'];
    driverLocation = json['driver_location'];
    driverLatitude = json['driver_latitude'];
    driverLongitude = json['driver_longitude'];
    fcmToken = json['fcm_token'];
    stripeId = json['stripe_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['verification_code'] = this.verificationCode;
    data['verification_code_created_at'] = this.verificationCodeCreatedAt;
    data['phone'] = this.phone;
    data['gender'] = this.gender;
    data['date_of_birth'] = this.dateOfBirth;
    data['role'] = this.role;
    data['rate'] = this.rate;
    data['wallet'] = this.wallet;
    data['points'] = this.points;
    data['bonus_earned'] = this.bonusEarned;
    data['service_radius'] = this.serviceRadius;
    data['service_radius_location'] = this.serviceRadiusLocation;
    data['service_radius_latitude'] = this.serviceRadiusLatitude;
    data['service_radius_longitude'] = this.serviceRadiusLongitude;
    data['image'] = this.image;
    data['status'] = this.status;
    data['accepting_rides'] = this.acceptingRides;
    data['driver_status'] = this.driverStatus;
    data['driver_location'] = this.driverLocation;
    data['driver_latitude'] = this.driverLatitude;
    data['driver_longitude'] = this.driverLongitude;
    data['fcm_token'] = this.fcmToken;
    data['stripe_id'] = this.stripeId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Driver {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  dynamic emailVerifiedAt;
  dynamic verificationCode;
  dynamic verificationCodeCreatedAt;
  String? phone;
  String? gender;
  String? dateOfBirth;
  String? role;
  dynamic rate;
  String? wallet;
  String? points;
  String? bonusEarned;
  dynamic serviceRadius;
  dynamic serviceRadiusLocation;
  dynamic serviceRadiusLatitude;
  dynamic serviceRadiusLongitude;
  dynamic image;
  String? status;
  String? acceptingRides;
  String? driverStatus;
  dynamic driverLocation;
  dynamic driverLatitude;
  dynamic driverLongitude;
  String? fcmToken;
  dynamic stripeId;
  String? createdAt;
  String? updatedAt;

  Driver(
      {this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.emailVerifiedAt,
        this.verificationCode,
        this.verificationCodeCreatedAt,
        this.phone,
        this.gender,
        this.dateOfBirth,
        this.role,
        this.rate,
        this.wallet,
        this.points,
        this.bonusEarned,
        this.serviceRadius,
        this.serviceRadiusLocation,
        this.serviceRadiusLatitude,
        this.serviceRadiusLongitude,
        this.image,
        this.status,
        this.acceptingRides,
        this.driverStatus,
        this.driverLocation,
        this.driverLatitude,
        this.driverLongitude,
        this.fcmToken,
        this.stripeId,
        this.createdAt,
        this.updatedAt});

  Driver.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    verificationCode = json['verification_code'];
    verificationCodeCreatedAt = json['verification_code_created_at'];
    phone = json['phone'];
    gender = json['gender'];
    dateOfBirth = json['date_of_birth'];
    role = json['role'];
    rate = json['rate'];
    wallet = json['wallet'];
    points = json['points'];
    bonusEarned = json['bonus_earned'];
    serviceRadius = json['service_radius'];
    serviceRadiusLocation = json['service_radius_location'];
    serviceRadiusLatitude = json['service_radius_latitude'];
    serviceRadiusLongitude = json['service_radius_longitude'];
    image = json['image'];
    status = json['status'];
    acceptingRides = json['accepting_rides'];
    driverStatus = json['driver_status'];
    driverLocation = json['driver_location'];
    driverLatitude = json['driver_latitude'];
    driverLongitude = json['driver_longitude'];
    fcmToken = json['fcm_token'];
    stripeId = json['stripe_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['verification_code'] = this.verificationCode;
    data['verification_code_created_at'] = this.verificationCodeCreatedAt;
    data['phone'] = this.phone;
    data['gender'] = this.gender;
    data['date_of_birth'] = this.dateOfBirth;
    data['role'] = this.role;
    data['rate'] = this.rate;
    data['wallet'] = this.wallet;
    data['points'] = this.points;
    data['bonus_earned'] = this.bonusEarned;
    data['service_radius'] = this.serviceRadius;
    data['service_radius_location'] = this.serviceRadiusLocation;
    data['service_radius_latitude'] = this.serviceRadiusLatitude;
    data['service_radius_longitude'] = this.serviceRadiusLongitude;
    data['image'] = this.image;
    data['status'] = this.status;
    data['accepting_rides'] = this.acceptingRides;
    data['driver_status'] = this.driverStatus;
    data['driver_location'] = this.driverLocation;
    data['driver_latitude'] = this.driverLatitude;
    data['driver_longitude'] = this.driverLongitude;
    data['fcm_token'] = this.fcmToken;
    data['stripe_id'] = this.stripeId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Vehicle {
  int? id;
  int? driver;
  int? vehicle;
  String? vehicleType;
  String? plateInfo;
  String? make;
  String? model;
  String? year;
  String? seats;
  String? doors;
  String? wheelchairAccess;
  String? kidsSeat;
  String? color;
  String? rc;
  String? rcImage;
  String? rcExpiry;
  String? primaryCar;
  String? createdAt;
  String? updatedAt;

  Vehicle(
      {this.id,
        this.driver,
        this.vehicle,
        this.vehicleType,
        this.plateInfo,
        this.make,
        this.model,
        this.year,
        this.seats,
        this.doors,
        this.wheelchairAccess,
        this.kidsSeat,
        this.color,
        this.rc,
        this.rcImage,
        this.rcExpiry,
        this.primaryCar,
        this.createdAt,
        this.updatedAt});

  Vehicle.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    driver = json['driver'];
    vehicle = json['vehicle'];
    vehicleType = json['vehicle_type'];
    plateInfo = json['plate_info'];
    make = json['make'];
    model = json['model'];
    year = json['year'];
    seats = json['seats'];
    doors = json['doors'];
    wheelchairAccess = json['wheelchair_access'];
    kidsSeat = json['kids_seat'];
    color = json['color'];
    rc = json['rc'];
    rcImage = json['rc_image'];
    rcExpiry = json['rc_expiry'];
    primaryCar = json['primary_car'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['driver'] = this.driver;
    data['vehicle'] = this.vehicle;
    data['vehicle_type'] = this.vehicleType;
    data['plate_info'] = this.plateInfo;
    data['make'] = this.make;
    data['model'] = this.model;
    data['year'] = this.year;
    data['seats'] = this.seats;
    data['doors'] = this.doors;
    data['wheelchair_access'] = this.wheelchairAccess;
    data['kids_seat'] = this.kidsSeat;
    data['color'] = this.color;
    data['rc'] = this.rc;
    data['rc_image'] = this.rcImage;
    data['rc_expiry'] = this.rcExpiry;
    data['primary_car'] = this.primaryCar;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
