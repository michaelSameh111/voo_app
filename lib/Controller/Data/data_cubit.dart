import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:voo_app/Model/EndTripModel.dart';
import 'package:voo_app/Model/InProgressTripModel.dart';
import 'package:voo_app/Model/TripsHistoryModel.dart';
import 'package:voo_app/Model/VehicleTypeModel.dart';
import '../../Model/LoginDataModel.dart';
import '../Constants.dart';
import '../dio-helper.dart';

part 'data_state.dart';

class DataCubit extends Cubit<DataState> {
  DataCubit() : super(DataInitial());
  static DataCubit get(context) => BlocProvider.of(context);
  static String destinationState = '';
  static bool tripToPickup = false;
  static bool loadingState = false;
  static   int time = 0;
 static String? groupValue;
 static String? feesNumber = 'fees1';
  List<XFile> imageXFileList = [];
  static List imagesFileList = [];
  static List imagesFilesList = [];
  static List<MultipartFile> multiPart = [];
  final ImagePicker imagePicker = ImagePicker();
  static File? claimImage;
  Future<void> selectImages(BuildContext context) async {
    imageXFileList.clear();
    imagesFileList.clear();
    multiPart.clear();
    claimImage = null;
    final List<XFile> selectedImages = await imagePicker.pickMultiImage(imageQuality: 50);

    if (selectedImages.isNotEmpty) {
      imageXFileList.addAll(selectedImages);
      for (var i = 0; i < imageXFileList.length; i++) {
        imagesFilesList.add(File(imageXFileList[i].path));
        imagesFileList.add(File(imageXFileList[i].path).path);
        multiPart.add(await MultipartFile.fromFile(imagesFileList[i],
            filename: '${imagesFileList[i]}'));
      }

      emit(ImagePickerState());
    }
  }
  Future pickImage(ImageSource imageSource) async {
    imageXFileList.clear();
    imagesFileList.clear();
    imagesFilesList.clear();
    multiPart.clear();
    final myFiles = await ImagePicker().pickImage(
        source: imageSource,
        maxHeight: double.maxFinite,
        maxWidth: double.maxFinite);
    if (myFiles != null) {
      claimImage = File(myFiles.path);
      imagesFilesList.add(claimImage);
      imagesFileList.add(claimImage);
      emit(ImagePickerState());
    }
  }

 void changeFeesNumber (String fees){
   feesNumber = fees;
   emit(FeesNumberChangeState());
 }
 void changeGroupValueNumberr (String group){
   groupValue = group;
   emit(GroupValueChangeState());
 }
  void changeTripState (bool trip ){
    tripToPickup = trip;
    emit(TripChangeState());
  }
  void changeTripLoadingState (){
    loadingState = true;
    emit(TripChangeState());
  }
  Future<void> timeChange (int time)async{
    DataCubit.time = time;
    emit(TimeChangeState());
  }
  Future<void> getVehicleTypes() {
    emit(GetVehicleTypesLoadingState());
    return DioHelper.getData(url: 'vehicles', token: token)
        .then((value) {
      vehicleTypesModel = VehicleTypesModel.fromJson(value.data);
      emit(GetVehicleTypesSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetVehicleTypesErrorState());
    });
  }
  static bool inRange = false;

  void checkStatus (String status){
    emit(CheckStatusState());
    if (status == 'Accepted'){
      emit(AcceptTripCompleteSuccessState());
    } else if (status == 'Arrived pickup'){
      emit(ArrivedAtLocationCompleteSuccessState());
    } else if (status == 'In progress'){emit(StartTripCompleteSuccessState());}
  }
  Future<void> getInProgressTripDetails() {
    emit(GetInProgressTripDetailsLoadingState());
    return DioHelper.getData(url: 'trip/in-progress-trip', token: token)
        .then((value) {
      inProgressTrip = InProgressTripModel.fromJson(value.data);
      emit(GetInProgressTripDetailsSuccessState());
      if(state is GetInProgressTripDetailsSuccessState && inProgressTrip.driverInProgressTrip != null){
        tripModel.pickup = inProgressTrip.driverInProgressTrip!.pickup;
        tripModel.rider = inProgressTrip.driverInProgressTrip!.rider.toString();
        tripModel.destination = inProgressTrip.driverInProgressTrip!.destination;
        tripModel.destinationLatitude = inProgressTrip.driverInProgressTrip!.destinationLatitude;
        tripModel.destinationLongitude = inProgressTrip.driverInProgressTrip!.destinationLongitude;
        tripModel.tripId = inProgressTrip.driverInProgressTrip!.id.toString();
        tripModel.pickupLatitude = inProgressTrip.driverInProgressTrip!.pickupLatitude;
        tripModel.pickupLongitude = inProgressTrip.driverInProgressTrip!.pickupLongitude;
        tripModel.paymentMethod = inProgressTrip.driverInProgressTrip!.paymentMethod;
        tripModel.preferredVehicleType = inProgressTrip.driverInProgressTrip!.preferredVehicleType.toString();
      }
      print(tripModel.tripId);
    }).catchError((error) {
      print(error.toString());
      emit(GetInProgressTripDetailsErrorState());
    });
  }
  Future<void> getDriverLicenseData() {
    emit(GetLicenseDataLoadingState());
    return DioHelper.getData(url: 'driver-license', token: token)
        .then((value) {
     licenseData  = DriverLicense.fromJson(value.data['Driver license'][0]);
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
  Future<void> getDriverVehicleData() {
    emit(GetDriverVehicleDataLoadingState());
    return DioHelper.getData(url: 'driver-vehicles', token: token)
        .then((value) {
     driverVehicle  = DriverVehicle.fromJson(value.data['vehicles'][0]);
      emit(GetDriverVehicleDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetDriverVehicleDataErrorState());
    });
  }
  Future<void> getTripsHistoryData() {
    return DioHelper.getData(url: 'trip/my-trips', token: token)
        .then((value) {
     tripsHisotryModel  = TripsHisotryModel.fromJson(value.data);
      emit(GetTripsHistoryDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetTripsHistoryDataErrorState());
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

  Future<void> acceptLessPriceTrip({
    required String rider,
    required String fees,
    required String feesNumber,
    required String driverLocation,
    required String driverLocationLat,
    required String driverLocationLng,
    required String tax,
    required BuildContext context,
  }) async {
    emit(AcceptLessPriceTripLoadingState());

    try {
      final response = await DioHelper.postData(
        url: 'trip/low-price-trip-to-drivers',
        data: FormData.fromMap({
          'rider': rider,
          'fees': fees,
          'feesNumber' : feesNumber,
          'driver_location': driverLocation,
          'driver_location_latitude': driverLocationLat,
          'driver_location_longitude': driverLocationLng,
          'tax' : tax
        }),
        token: token,
      );

      // Log the response data
      print('Response data: ${response.data}');
      emit(AcceptLessPriceTripSuccessState());
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

      emit(AcceptLessPriceTripErrorState());
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
        String? state,
        String? dropOffLat,
        String? dropOffLng,
        required BuildContext context,
      })async {
    emit(EndTripLoadingState());
    DioHelper.postData(
        url: 'trip/end',
        data: FormData.fromMap({
          'tripId' : tripId,
          'destination_title' : destinationTitle,
          'state' : state,
          'actual_drop_off_latitude' : dropOffLat,
          'actual_drop_off_longitude' : dropOffLng,
        }),
        token: token)
        .then((value)  {
          print(value.data);
          endTripModel = EndTripModel.fromJson(value.data);
          print(endTripModel.driverFees.runtimeType);
          print(endTripModel.driverTotalTrips.runtimeType);
          if(endTripModel.driverTotalTrips != null){ loginData.totalTrips = endTripModel.driverTotalTrips;}
          if(endTripModel.driverFees != null){ loginData.totalEarnings = endTripModel.driverFees;}

         // if(endTripModel != null){
         //   print(endTripModel.total);
         // }

      emit(EndTripSuccessState());
    }).catchError((error,stacktrace) {
      if (error is DioException) {
        if (error.response != null) {
          print('Error response data: ${error.response?.data}');
        } else {
          print('Error response: No response data');
        }
      }
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
        url: 'trip/driver-cancel',
        data: FormData.fromMap({
          'tripId' : tripId,
          'action' : 'driver cancelled',
          'reason' : 'Too Far',
        }),
        token: token)
        .then((value) async {
      emit(CancelTripSuccessState());
    }).catchError((error,stacktrace) {
      print(error);
      print(stacktrace);
      if (error is DioException) {
        if (error.response != null) {
          print('Error response data: ${error.response?.data}');
        } else {
          print('Error response: No response data');
        }
      }
      emit(CancelTripErrorState());
    });
  }

  Future<void> locationUpdate(
      {required int tripId,
        required double latitude,
        required double longitude,
        required double heading,
        required BuildContext context})async {
    DioHelper.postData(
        url: 'driver-location/add',
        data: FormData.fromMap({
          'latitude' : latitude,
          'longitude' :longitude,
          'heading' :heading,
        }),
        token: token,
    id: tripId)
        .then((value) async {
      emit(LocationChangeState());
    }).catchError((error,stacktrace) {
      print(error);
      print(stacktrace);
      if (error is DioException) {
        if (error.response != null) {
          print('Error response data: ${error.response?.data}');
        } else {
          print('Error response: No response data');
        }
      }
      emit(LocationChangeErrorState());
    });
  }
  Future<void> changeDriverStatus(
      {
        required String status,
        required BuildContext context})async {
    emit(ChangeDriverStatusLoadingState());
    DioHelper.postData(
        url:
        'driver-status/update',
        data: {
          'accepting_rides': status,
          // 'driver_location' : location,
          // 'driver_latitude' : lat,
          // 'driver_longitude' : lng,
        },
        token: token)
        .then((value) async {
          print(value.data);
          if(value.data['message'] == 'You are now in your break time'){
            light = false;
            showRichTextDialog(context, 'Break Time', '${value.data['remaning_time']}');
            loginData.acceptingRides = null;
          } else
          if(value.data['message'] == 'You are now online'){
            light = true;
            loginData.acceptingRides = 'on';
          } else
          if(value.data['message'] == 'You are now offline'){
            light = false;
            loginData.acceptingRides = null;
          }
      emit(ChangeDriverStatusSuccessState());
    }).catchError((error) {
      print(error);
      emit(ChangeDriverStatusErrorState(error.toString()));
    });
  }
  Future<void> changeDriversStatus(
      {
        required String status,
        required BuildContext context})async {
    emit(ChangeDriverStatusLoadingState());
    DioHelper.postData(
        url:
        'driver-status/update',
        data: {
          'accepting_rides': status,
        },
        token: token).catchError((error) {
      print(error);
      emit(ChangeDriverStatusErrorState(error.toString()));
    });
  }

  Future<void> complainSubmit(
      {
        required String description,
        required String type,
        int? tripId,
        required BuildContext context})async {
    emit(SubmitClaimLoadingState());
    DioHelper.postData(
        url:
        'claims/add',
        data: FormData.fromMap({     'claim_type': type,
          'description': description,
          'images[]': multiPart.isNotEmpty
              ? multiPart
              : claimImage != null
              ? await MultipartFile.fromFile(claimImage!.path, filename: '${claimImage!.path}')
              : []}),
        token: token,tripId: tripId)
        .then((value) async {
          print(value.data);
          Fluttertoast.showToast(msg: '${value.data['message']}',backgroundColor: Colors.green,fontSize: 14.dp,);
      emit(SubmitClaimSuccessState());
    }).catchError((error) {
      print(error);
      emit(SubmitClaimErrorState(error.toString()));
    });
  }



}
