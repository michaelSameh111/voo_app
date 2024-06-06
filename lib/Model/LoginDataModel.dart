

class LoginDataModel {
  String? accessToken;
  int? expiresIn;
  String? tokenType;
  String? userId;
  String? firstName;
  String? lastName;
  String? phone;
  String? role;
  String? gender;
  String? dateOfBirth;
  dynamic backgroundCheckStatus;
  dynamic serviceRadius;
  dynamic serviceRadiusLocation;
  dynamic serviceRadiusLatitude;
  dynamic serviceRadiusLongitude;
  String? image;
  String? acceptingRides;
  dynamic status;
  DriverData? driverData;
  DriverVehicle? driverVehicle;
  List<DriverLicense>? driverLicense;
  DriverInsurance? driverInsurance;
  int? totalTrips;
  String? totalEarnings;

  LoginDataModel(
      {this.accessToken,
        this.expiresIn,
        this.tokenType,
        this.userId,
        this.firstName,
        this.lastName,
        this.phone,
        this.role,
        this.gender,
        this.dateOfBirth,
        this.backgroundCheckStatus,
        this.serviceRadius,
        this.serviceRadiusLocation,
        this.serviceRadiusLatitude,
        this.serviceRadiusLongitude,
        this.image,
        this.status,
        this.driverData,
        this.acceptingRides,
        this.driverVehicle,
        this.driverLicense,
        this.driverInsurance,this.totalEarnings,this.totalTrips});

  LoginDataModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    expiresIn = json['expires_in'];
    tokenType = json['token_type'];
    userId = json['user_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phone = json['phone'];
    role = json['role'];
    acceptingRides = json['accepting_rides'];
    gender = json['gender'];
    dateOfBirth = json['date_of_birth'];
    backgroundCheckStatus = json['background_check_status'];
    serviceRadius = json['service_radius'];
    serviceRadiusLocation = json['service_radius_location'];
    serviceRadiusLatitude = json['service_radius_latitude'];
    serviceRadiusLongitude = json['service_radius_longitude'];
    image = json['image'];
    status = json['status'];
    totalTrips = json['total_trips'];
    totalEarnings = json['total_earning'];
    driverData = json['driver_data'] != null
        ? new DriverData.fromJson(json['driver_data'])
        : null;
    driverVehicle = json['driver_vehicle'] != null
        ? new DriverVehicle.fromJson(json['driver_vehicle'])
        : null;
    if (json['driver_license'] != null) {
      driverLicense = <DriverLicense>[];
      json['driver_license'].forEach((v) {
        driverLicense!.add(new DriverLicense.fromJson(v));
      });
    }
    driverInsurance = json['driver_insurance'] != null
        ? new DriverInsurance.fromJson(json['driver_insurance'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['expires_in'] = this.expiresIn;
    data['token_type'] = this.tokenType;
    data['user_id'] = this.userId;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['phone'] = this.phone;
    data['role'] = this.role;
    data['gender'] = this.gender;
    data['date_of_birth'] = this.dateOfBirth;
    data['background_check_status'] = this.backgroundCheckStatus;
    data['service_radius'] = this.serviceRadius;
    data['service_radius_location'] = this.serviceRadiusLocation;
    data['service_radius_latitude'] = this.serviceRadiusLatitude;
    data['service_radius_longitude'] = this.serviceRadiusLongitude;
    data['image'] = this.image;
    data['status'] = this.status;
    if (this.driverData != null) {
      data['driver_data'] = this.driverData!.toJson();
    }
    if (this.driverVehicle != null) {
      data['driver_vehicle'] = this.driverVehicle!.toJson();
    }
    if (this.driverLicense != null) {
      data['driver_license'] =
          this.driverLicense!.map((v) => v.toJson()).toList();
    }
    if (this.driverInsurance != null) {
      data['driver_insurance'] = this.driverInsurance!.toJson();
    }
    return data;
  }
}

class DriverData {
  int? id;
  int? driver;
  String? securityCode;
  String? socialSecurityNumber;
  String? country;
  String? city;
  String? state;
  String? address;
  String? postalCode;
  String? language;
  String? backgroundCheckStatus;
  String? createdAt;
  String? updatedAt;

  DriverData(
      {this.id,
        this.driver,
        this.securityCode,
        this.socialSecurityNumber,
        this.country,
        this.city,
        this.state,
        this.address,
        this.postalCode,
        this.language,
        this.backgroundCheckStatus,
        this.createdAt,
        this.updatedAt});

  DriverData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    driver = json['driver'];
    securityCode = json['security_code'];
    socialSecurityNumber = json['social_security_number'];
    country = json['country'];
    city = json['city'];
    state = json['state'];
    address = json['address'];
    postalCode = json['postal_code'];
    language = json['language'];
    backgroundCheckStatus = json['background_check_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['driver'] = this.driver;
    data['security_code'] = this.securityCode;
    data['social_security_number'] = this.socialSecurityNumber;
    data['country'] = this.country;
    data['city'] = this.city;
    data['state'] = this.state;
    data['address'] = this.address;
    data['postal_code'] = this.postalCode;
    data['language'] = this.language;
    data['background_check_status'] = this.backgroundCheckStatus;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class DriverVehicle {
  int? id;
  int? driver;
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
  String? rcImagePath;

  DriverVehicle(
      {this.id,
        this.driver,
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
        this.rcImagePath,
        this.updatedAt});

  DriverVehicle.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    driver = json['driver'];
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
    rcImagePath = json['rc_image_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['driver'] = this.driver;
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

class DriverLicense {
  String? licenseNumber;
  String? licenseExpiry;
  String? licenseFrontImage;
  String? licenseBackImage;

  DriverLicense(
      {this.licenseNumber,
        this.licenseExpiry,
        this.licenseFrontImage,
        this.licenseBackImage});

  DriverLicense.fromJson(Map<String, dynamic> json) {
    licenseNumber = json['license_number'];
    licenseExpiry = json['license_expiry'];
    licenseFrontImage = json['license_front_image'];
    licenseBackImage = json['license_back_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['license_number'] = this.licenseNumber;
    data['license_expiry'] = this.licenseExpiry;
    data['license_front_image'] = this.licenseFrontImage;
    data['license_back_image'] = this.licenseBackImage;
    return data;
  }
}

class DriverInsurance {
  int? id;
  int? driver;
  String? insuranceNumber;
  String? insuranceExpiry;
  String? insuranceFrontImage;
  String? createdAt;
  String? updatedAt;

  DriverInsurance(
      {this.id,
        this.driver,
        this.insuranceNumber,
        this.insuranceExpiry,
        this.insuranceFrontImage,
        this.createdAt,
        this.updatedAt});

  DriverInsurance.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    driver = json['driver'];
    insuranceNumber = json['insurance_number'];
    insuranceExpiry = json['insurance_expiry'];
    insuranceFrontImage = json['insurance_front_image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['driver'] = this.driver;
    data['insurance_number'] = this.insuranceNumber;
    data['insurance_expiry'] = this.insuranceExpiry;
    data['insurance_front_image'] = this.insuranceFrontImage;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
