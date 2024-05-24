class LicenseDataModel {
  int? status;
  String? message;
  DriverLicense? driverLicense;
  String? licenseFrontImage;
  String? licenseBackImage;

  LicenseDataModel(
      {this.status,
        this.message,
        this.driverLicense,
        this.licenseFrontImage,
        this.licenseBackImage});

  LicenseDataModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    driverLicense = json['Driver license'] != null
        ? new DriverLicense.fromJson(json['Driver license'])
        : null;
    licenseFrontImage = json['License front image'];
    licenseBackImage = json['License back image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.driverLicense != null) {
      data['Driver license'] = this.driverLicense!.toJson();
    }
    data['License front image'] = this.licenseFrontImage;
    data['License back image'] = this.licenseBackImage;
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
