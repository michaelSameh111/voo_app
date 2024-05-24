class DriverDataModel {
  int? status;
  String? message;
  DriverData? driverData;

  DriverDataModel({this.status, this.message, this.driverData});

  DriverDataModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    driverData = json['Driver data'] != null
        ? new DriverData.fromJson(json['Driver data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.driverData != null) {
      data['Driver data'] = this.driverData!.toJson();
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
