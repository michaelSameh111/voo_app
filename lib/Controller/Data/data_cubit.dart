import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
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
    return DioHelper.getData(url: 'vehicle-types', token: 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL2F1dGgvbG9naW4iLCJpYXQiOjE3MTY1NTc5MjcsImV4cCI6MTcxNzE2MjcyNywibmJmIjoxNzE2NTU3OTI3LCJqdGkiOiI0dzQzcWpGdk1CSzM2WWVKIiwic3ViIjoiMyIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.JFl9vyahRtBfB9chV41jHJkfEa2ZLplqVd9IjSfHMlE')
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
    return DioHelper.getData(url: 'driver-license', token: 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL2F1dGgvbG9naW4iLCJpYXQiOjE3MTY1NTc5MjcsImV4cCI6MTcxNzE2MjcyNywibmJmIjoxNzE2NTU3OTI3LCJqdGkiOiI0dzQzcWpGdk1CSzM2WWVKIiwic3ViIjoiMyIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.JFl9vyahRtBfB9chV41jHJkfEa2ZLplqVd9IjSfHMlE')
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
    return DioHelper.getData(url: 'driver-insurance/edit', token: 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL2F1dGgvbG9naW4iLCJpYXQiOjE3MTY1NTc5MjcsImV4cCI6MTcxNzE2MjcyNywibmJmIjoxNzE2NTU3OTI3LCJqdGkiOiI0dzQzcWpGdk1CSzM2WWVKIiwic3ViIjoiMyIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.JFl9vyahRtBfB9chV41jHJkfEa2ZLplqVd9IjSfHMlE')
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
    return DioHelper.getData(url: 'driver-data', token: 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL2F1dGgvbG9naW4iLCJpYXQiOjE3MTY1NTc5MjcsImV4cCI6MTcxNzE2MjcyNywibmJmIjoxNzE2NTU3OTI3LCJqdGkiOiI0dzQzcWpGdk1CSzM2WWVKIiwic3ViIjoiMyIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.JFl9vyahRtBfB9chV41jHJkfEa2ZLplqVd9IjSfHMlE')
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
  Future<void> acceptTrip({
    required int tripId,
    required String driverLocation,
    required String driverLocationLat,
    required String driverLocationLng,
    required BuildContext context,
  }) async {
    emit(AcceptTripLoadingState());

    try {
      final response = await DioHelper.postData(
        url: 'trip/accept',
        data: FormData.fromMap({
          'tripId': tripId,
          'driver_location': driverLocation,
          'driver_location_latitude': driverLocationLat,
          'driver_location_longitude': driverLocationLng,
        }),
        token: token,
      );

      // Log the response data
      print('Response data: ${response.data}');
      emit(AcceptTripSuccessState());
    } catch (error, stacktrace) {
      // Log the error and stack trace
      print('Error: $error');
      print('Stacktrace: $stacktrace');

      // If the error has a response, log the response data as well
      if (error is DioError) {
        if (error.response != null) {
          print('Error response data: ${error.response?.data}');
        } else {
          print('Error response: No response data');
        }
      }

      emit(AcceptTripErrorState());
    }
  }

  Future<void> arrivedAtLocation(
      {required int tripId,
        required BuildContext context})async {
    emit(ArrivedAtLocationLoadingState());
    DioHelper.postData(
        url: 'trip/arrived',
        data: FormData.fromMap({
          'tripId' : tripId,
        }),
        token: token)
        .then((value) async {
      emit(ArrivedAtLocationSuccessState());
    }).catchError((error,stacktrace) {
      print(error);
      print(stacktrace);
      emit(ArrivedAtLocationErrorState());
    });
  }

  Future<void> startTrip(
      {required int tripId,
        required String driverLocation,
        required String driverLocationLat,
        required String driverLocationLng,
        required BuildContext context})async {
    emit(StartTripLoadingState());
    DioHelper.postData(
        url: 'trip/start',
        data: FormData.fromMap({
          'tripId' : tripId,
          'driver_location' : driverLocation,
          'driver_location_latitude' : driverLocationLat,
          'driver_location_longitude' : driverLocationLng,
        }),
        token: token)
        .then((value) async {
      emit(StartTripSuccessState());
    }).catchError((error,stacktrace) {
      print(error);
      print(stacktrace);
      emit(StartTripErrorState());
    });
  }

  Future<void> endTrip(
      {required int tripId,
        required BuildContext context})async {
    emit(EndTripLoadingState());
    DioHelper.postData(
        url: 'trip/end',
        data: FormData.fromMap({
          'tripId' : tripId,
        }),
        token: token)
        .then((value) async {
      emit(EndTripSuccessState());
    }).catchError((error,stacktrace) {
      print(error);
      print(stacktrace);
      emit(EndTripErrorState());
    });
  }

  Future<void> cancelTrip(
      {required int tripId,
        required BuildContext context})async {
    emit(CancelTripLoadingState());
    DioHelper.postData(
        url: 'trip/rider-cancel',
        data: FormData.fromMap({
          'tripId' : tripId,
        }),
        token: token)
        .then((value) async {
      emit(CancelTripSuccessState());
    }).catchError((error,stacktrace) {
      print(error);
      print(stacktrace);
      emit(CancelTripErrorState());
    });
  }

}
