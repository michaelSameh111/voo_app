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
  String? status;
  dynamic driverData;
  DriverVehicle? driverVehicle;
  DriverLicense? driverLicense;
  DriverInsurance? driverInsurance;

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
        this.driverVehicle,
        this.driverLicense,
        this.driverInsurance});

  LoginDataModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    expiresIn = json['expires_in'];
    tokenType = json['token_type'];
    userId = json['user_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phone = json['phone'];
    role = json['role'];
    gender = json['gender'];
    dateOfBirth = json['date_of_birth'];
    backgroundCheckStatus = json['background_check_status'];
    serviceRadius = json['service_radius'];
    serviceRadiusLocation = json['service_radius_location'];
    serviceRadiusLatitude = json['service_radius_latitude'];
    serviceRadiusLongitude = json['service_radius_longitude'];
    image = json['image'];
    status = json['status'];
    driverData = json['driver_data'];
    driverVehicle = json['driver_vehicle'] != null
        ? new DriverVehicle.fromJson(json['driver_vehicle'])
        : null;
    driverLicense = json['driver_license'] != null
        ? new DriverLicense.fromJson(json['driver_license'])
        : null;
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
    data['driver_data'] = this.driverData;
    if (this.driverVehicle != null) {
      data['driver_vehicle'] = this.driverVehicle!.toJson();
    }
    if (this.driverLicense != null) {
      data['driver_license'] = this.driverLicense!.toJson();
    }
    if (this.driverInsurance != null) {
      data['driver_insurance'] = this.driverInsurance!.toJson();
    }
    return data;
  }
}

class DriverVehicle {
  int? id;
  int? driver;
  int? vehicleType;
  String? plateInfo;
  String? make;
  String? model;
  String? year;
  String? seats;
  String? doors;
  String? wheelchairAccess;
  String? kidsSeat;
  String? rc;
  String? rcExpiry;
  String? primaryCar;
  String? createdAt;
  String? updatedAt;

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
        this.rc,
        this.rcExpiry,
        this.primaryCar,
        this.createdAt,
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
    rc = json['rc'];
    rcExpiry = json['rc_expiry'];
    primaryCar = json['primary_car'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
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
    data['rc'] = this.rc;
    data['rc_expiry'] = this.rcExpiry;
    data['primary_car'] = this.primaryCar;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class DriverLicense {
  int? id;
  int? driver;
  String? licenseNumber;
  String? licenseExpiry;
  String? licenseFrontImage;
  String? licenseBackImage;
  String? createdAt;
  String? updatedAt;

  DriverLicense(
      {this.id,
        this.driver,
        this.licenseNumber,
        this.licenseExpiry,
        this.licenseFrontImage,
        this.licenseBackImage,
        this.createdAt,
        this.updatedAt});

  DriverLicense.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    driver = json['driver'];
    licenseNumber = json['license_number'];
    licenseExpiry = json['license_expiry'];
    licenseFrontImage = json['license_front_image'];
    licenseBackImage = json['license_back_image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['driver'] = this.driver;
    data['license_number'] = this.licenseNumber;
    data['license_expiry'] = this.licenseExpiry;
    data['license_front_image'] = this.licenseFrontImage;
    data['license_back_image'] = this.licenseBackImage;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
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
