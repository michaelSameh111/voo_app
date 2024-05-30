import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voo_app/Model/EndTripModel.dart';
import 'package:voo_app/Model/VehicleTypeModel.dart';

import '../../Model/LoginDataModel.dart';
import '../Constants.dart';
import '../dio-helper.dart';

part 'data_state.dart';

class DataCubit extends Cubit<DataState> {
  DataCubit() : super(DataInitial());
  static DataCubit get(context) => BlocProvider.of(context);
  Future<void> getVehicleTypes() {
    emit(GetVehicleTypesLoadingState());
    return DioHelper.getData(url: 'vehicle-types', token: token)
        .then((value) {
      vehicleTypesModel = VehicleTypesModel.fromJson(value.data);
      emit(GetVehicleTypesSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetVehicleTypesErrorState());
    });
  }
  Future<void> getDriverLicenseData() {
    emit(GetLicenseDataLoadingState());
    return DioHelper.getData(url: 'driver-license', token: token)
        .then((value) {
     licenseData  = DriverLicense.fromJson(value.data['Driver license']);
      emit(GetLicenseDataSuccessState());
      return licenseData;
    }).catchError((error) {
      print(error.toString());
      emit(GetLicenseDataErrorState());
    });
  }
  Future<void> getDriverInsuranceData() {
    emit(GetInsuranceDataLoadingState());
    return DioHelper.getData(url: 'driver-insurance/edit', token: token)
        .then((value) {
     insuranceData  = DriverInsurance.fromJson(value.data['insurance_data']);
      emit(GetInsuranceDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetInsuranceDataErrorState());
    });
  }
  Future<void> getDriverData() {
    emit(GetDriverDataLoadingState());
    return DioHelper.getData(url: 'driver-data', token: token)
        .then((value) {
     driverData  = DriverData.fromJson(value.data['Driver data']);
      emit(GetDriverDataSuccessState());
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
      if (error is DioException) {
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
         String? pickUpTitle,
        required BuildContext context})async {
    emit(StartTripLoadingState());
    DioHelper.postData(
        url: 'trip/start',
        data: FormData.fromMap({
          'tripId' : tripId,
          'driver_location' : driverLocation,
          'driver_location_latitude' : driverLocationLat,
          'driver_location_longitude' : driverLocationLng,
          'pickup_title' : pickUpTitle,
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
        String? destinationTitle,
        required BuildContext context,
      })async {
    emit(EndTripLoadingState());
    DioHelper.postData(
        url: 'trip/end',
        data: FormData.fromMap({
          'tripId' : tripId,
          'destination_title' : destinationTitle,
        }),
        token: token)
        .then((value)  {
          endTripModel = EndTripModel.fromJson(value.data);
         // if(endTripModel != null){
         //   print(endTripModel.total);
         // }

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
