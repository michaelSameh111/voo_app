class VehicleTypesModel {
  int? status;
  List<Vehicles>? vehicles;

  VehicleTypesModel({this.status, this.vehicles});

  VehicleTypesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['Vehicles'] != null) {
      vehicles = <Vehicles>[];
      json['Vehicles'].forEach((v) {
        vehicles!.add(new Vehicles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.vehicles != null) {
      data['Vehicles'] = this.vehicles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Vehicles {
  String? make;
  List<Model>? model;

  Vehicles({this.make, this.model});

  Vehicles.fromJson(Map<String, dynamic> json) {
    make = json['make'];
    if (json['model'] != null) {
      model = <Model>[];
      json['model'].forEach((v) {
        model!.add(new Model.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['make'] = this.make;
    if (this.model != null) {
      data['model'] = this.model!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Model {
  int? id;
  String? model;
  String? minYear;

  Model({this.id, this.model, this.minYear});

  Model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    model = json['model'];
    minYear = json['min_year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['model'] = this.model;
    data['min_year'] = this.minYear;
    return data;
  }
}
