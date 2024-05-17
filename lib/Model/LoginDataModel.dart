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
  dynamic image;
  String? status;

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
        this.status});

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
    return data;
  }
}
