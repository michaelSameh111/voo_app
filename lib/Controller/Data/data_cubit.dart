import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:voo_app/Model/DriverDataModel.dart';
import 'package:voo_app/Model/InsuranceDataModel.dart';
import 'package:voo_app/Model/LicenseDataModel.dart';
import 'package:voo_app/Model/VehicleTypeModel.dart';

import '../Constants.dart';
import '../dio-helper.dart';

part 'data_state.dart';

class DataCubit extends Cubit<DataState> {
  DataCubit() : super(DataInitial());
  static DataCubit get(context) => BlocProvider.of(context);
  Future<void> getVehicleTypes() {
    emit(GetVehicleTypesLoadingState());
    return DioHelper.getData(url: 'vehicle-types', token: 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL2F1dGgvbG9naW4iLCJpYXQiOjE3MTYxMDIyNjYsImV4cCI6MTcxNjcwNzA2NiwibmJmIjoxNzE2MTAyMjY2LCJqdGkiOiJGUGhNeDF4eEdUS2NoaGJIIiwic3ViIjoiMyIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.eSEB-JWdmjDYKLnLangtT9G1ROtzxfiWXqBGFE_mjs8')
        .then((value) {
      vehicleTypesModel = VehicleTypesModel.fromJson(value.data);
      emit(GetVehicleTypesSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetVehicleTypesErrorState());
    });
  }
  Future<LicenseDataModel> getDriverLicenseData(LicenseDataModel licenseDataModel) {
    emit(GetLicenseDataLoadingState());
    return DioHelper.getData(url: 'driver-license', token: token)
        .then((value) {
     licenseDataModel  = LicenseDataModel.fromJson(value.data);
     print(licenseDataModel.driverLicense!.licenseNumber);
      emit(GetLicenseDataSuccessState());
      return licenseDataModel;
    }).catchError((error) {
      print(error.toString());
      emit(GetLicenseDataErrorState());
    });
  }
  Future<InsuranceDataModel> getDriverInsuranceData(InsuranceDataModel insuranceDataModel) {
    emit(GetInsuranceDataLoadingState());
    return DioHelper.getData(url: 'driver-insurance/edit', token: token)
        .then((value) {
     insuranceDataModel  = InsuranceDataModel.fromJson(value.data);
     print(insuranceDataModel.insuranceData!.insuranceNumber);
      emit(GetInsuranceDataSuccessState());
      return insuranceDataModel;
    }).catchError((error) {
      print(error.toString());
      emit(GetInsuranceDataErrorState());
    });
  }
  Future<DriverDataModel> getDriverData(DriverDataModel driverDataModel) {
    emit(GetDriverDataLoadingState());
    return DioHelper.getData(url: 'driver-data', token: token)
        .then((value) {
     driverDataModel  = DriverDataModel.fromJson(value.data);
     print(driverDataModel.driverData!.country);
      emit(GetDriverDataSuccessState());
      return driverDataModel;
    }).catchError((error) {
      print(error.toString());
      emit(GetDriverDataErrorState());
    });
  }
}
