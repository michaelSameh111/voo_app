class LicenseDataModel {
  License? license;
  int? status;
  String? message;

  LicenseDataModel({this.license, this.status, this.message});

  LicenseDataModel.fromJson(Map<String, dynamic> json) {
    license =
    json['license'] != null ? new License.fromJson(json['license']) : null;
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.license != null) {
      data['license'] = this.license!.toJson();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}

class License {
  int? id;
  int? driver;
  String? licenseNumber;
  String? licenseExpiry;
  String? licenseFrontImage;
  String? licenseBackImage;
  String? createdAt;
  String? updatedAt;

  License(
      {this.id,
        this.driver,
        this.licenseNumber,
        this.licenseExpiry,
        this.licenseFrontImage,
        this.licenseBackImage,
        this.createdAt,
        this.updatedAt});

  License.fromJson(Map<String, dynamic> json) {
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
