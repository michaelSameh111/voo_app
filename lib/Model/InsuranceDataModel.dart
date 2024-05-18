class InsuranceDataModel {
  InsuranceData? insuranceData;

  InsuranceDataModel({this.insuranceData});

  InsuranceDataModel.fromJson(Map<String, dynamic> json) {
    insuranceData = json['insurance_data'] != null
        ? new InsuranceData.fromJson(json['insurance_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.insuranceData != null) {
      data['insurance_data'] = this.insuranceData!.toJson();
    }
    return data;
  }
}

class InsuranceData {
  int? id;
  int? driver;
  String? insuranceNumber;
  String? insuranceExpiry;
  String? insuranceFrontImage;
  String? createdAt;
  String? updatedAt;

  InsuranceData(
      {this.id,
        this.driver,
        this.insuranceNumber,
        this.insuranceExpiry,
        this.insuranceFrontImage,
        this.createdAt,
        this.updatedAt});

  InsuranceData.fromJson(Map<String, dynamic> json) {
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
