import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:geocoding/geocoding.dart';
import 'package:voo_app/main.dart';

import '../Model/TripRequestModel.dart';
import 'Constants.dart';
import 'Data/data_cubit.dart';

Future<int?> getEstimatedTime({
  required double driverLat,
  required double driverLng,
  required double riderLat,
  required double riderLng,
  required String apiKey,
}) async {
  final origin = '$driverLat,$driverLng';
  final destination = '$riderLat,$riderLng';
  const url = 'https://maps.googleapis.com/maps/api/directions/json';

  final dio = Dio();
  DataCubit.time = 0;
  try {
    final response = await dio.get(url, queryParameters: {
      'origin': origin,
      'destination': destination,
      'key': apiKey,
    });

    if (response.statusCode == 200) {
      final jsonResponse = response.data;
      if (jsonResponse != null && jsonResponse['status'] == 'OK') {
        final routes = jsonResponse['routes'];
        if (routes != null && routes.isNotEmpty) {
          final legs = routes[0]['legs'];
          if (legs != null && legs.isNotEmpty) {
            final duration = legs[0]['duration']['value'];
            if(duration != null){
              DataCubit.get(navigatorKey.currentState).timeChange(Duration(seconds: duration).inMinutes);
            }
            return Duration(seconds: duration).inMinutes;
          } else {
            print('Error: No legs found in the route');
          }
        } else {
          print('Error: No routes found');
        }
      } else {
        print('Error: ${jsonResponse['status']}');
      }
    } else {
      print('Failed to load directions with status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  }

  return null;
}

Future<String?> getAddressFromLatLng(double lat, double lng) async {
  try {
    final List<Placemark> placemarks =
    await placemarkFromCoordinates(lat, lng);
    if (placemarks.isNotEmpty) {
      final Placemark firstPlacemark = placemarks[0];
      final address =
          '${firstPlacemark.street}, ${firstPlacemark.locality}, ${firstPlacemark.administrativeArea}';
      if (firstPlacemark.administrativeArea != null) {
        DataCubit.destinationState = firstPlacemark.administrativeArea!;
      }
      print(DataCubit.destinationState);
      return address;
    }
  } catch (e) {
    print('Error getting address: $e');
    return null;
  }
  return null;
}
void acceptDeclineShowModalSheet(
    BuildContext context, String? pickUp, String? destination) {
  showModalBottomSheet(
    isDismissible: false,
    barrierColor: Colors.transparent,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(23), topRight: Radius.circular((23))),
    ),
    context: context,
    builder: (context) => Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 2.h),
          child: Row(
            children: [
              Text(
                'Ride Request',
                style: TextStyle(
                  fontSize: 18.dp,
                ),
              ),
              const Spacer(),
              Text(
                '${DataCubit.time} mins away',
                style: TextStyle(color: Color(0xff808080)),
              )
            ],
          ),
        ),
        const Divider(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0.w, vertical: 3.h),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 7.0.w,
                    backgroundColor: const Color(0xffECECEC),
                    child: Icon(
                      Icons.person,
                      size: 11.w,
                      color: const Color(0xffA2A2A2),
                    ),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${tripModel.rider}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.dp),
                      ),
                      Text(
                        '${tripModel.paymentMethod}',
                        style: TextStyle(
                            color: const Color(0xff808080), fontSize: 13.dp),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 4.h,
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/images/from_to_image.png',
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$pickUp',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 13.dp),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Stack(
                          children: [
                            Positioned(
                                right: -50,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                      BorderRadius.circular(10.dp),
                                      boxShadow: [
                                        BoxShadow(
                                            color:
                                            Colors.grey.withOpacity(0.4),
                                            spreadRadius: 10,
                                            blurRadius: 10,
                                            offset: const Offset(0, 7))
                                      ]),
                                  child: Padding(
                                    padding: EdgeInsets.all(6.dp),
                                    child: const Text(
                                      '10 mins trip',
                                      style:
                                      TextStyle(color: Color(0xff808080)),
                                    ),
                                  ),
                                )),
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(left: 50.w),
                              width: 80.w,
                              height: 0.2.h,
                              decoration:
                              const BoxDecoration(color: Colors.black
                                //0xffE2E2E2
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          '$destination',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 13.dp),
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 40.w,
                    height: 5.5.h,
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Color(0xffFF6A03))),
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                         DataCubit.get(context).changeTripState(false);
                        },
                        child: const Text(
                          'Decline',
                          style: TextStyle(color: Color(0xffFF6A03)),
                        )),
                  ),
                  SizedBox(
                    width: 7.w,
                  ),
                  SizedBox(
                    width: 40.w,
                    height: 5.5.h,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xffFF6A03)),
                        onPressed: () {
                          DataCubit.get(context).acceptTrip(
                              tripId: int.parse(tripModel.tripId!),
                              driverLocation:
                              'https://maps.google.com/?q=${sourcePosition!.latitude},${sourcePosition!.longitude}',
                              driverLocationLat:
                              sourcePosition!.latitude.toString(),
                              driverLocationLng:
                              sourcePosition!.longitude.toString(),
                              context: context);
                        },
                        child: DataCubit.loadingState == true
                            ? Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                            : const Text(
                          'Accept',
                          style: TextStyle(color: Colors.white),
                        )),
                  )
                ],
              )
            ],
          ),
        )
      ],
    ),
  );
}

void acceptDeclineLessPriceShowModalSheet(
    BuildContext context, TripRequest tripRequest) {
declineBottomSheet = true;
  showModalBottomSheet(
    isDismissible: false,
    isScrollControlled: true,
    barrierColor: Colors.transparent,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(23), topRight: Radius.circular((23))),
    ),
    context: context,
    builder: (context) => StatefulBuilder(
        builder: (context,states) {
          return BlocConsumer<DataCubit, DataState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 2.h),
                    child: Row(
                      children: [
                        Text(
                          'Ride Request',
                          style: TextStyle(
                            fontSize: 18.dp,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          DataCubit.time == 0 ? '' :
                          '${DataCubit.time} mins away',
                          style: TextStyle(color: Color(0xff808080)),
                        )
                      ],
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: 5.0.w, vertical: 3.h),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 7.0.w,
                              backgroundColor: const Color(0xffECECEC),
                              child: Icon(
                                Icons.person,
                                size: 11.w,
                                color: const Color(0xffA2A2A2),
                              ),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${tripRequest.rider}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.dp),
                                ),
                                Text(
                                  'Credit Card',
                                  style: TextStyle(
                                      color: const Color(0xff808080),
                                      fontSize: 13.dp),
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/from_to_image.png',
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${tripRequest.pickup}',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13.dp),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Stack(
                                    children: [
                                      Positioned(
                                          right: -50,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                BorderRadius.circular(10.dp),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.4),
                                                      spreadRadius: 10,
                                                      blurRadius: 10,
                                                      offset: const Offset(0, 7))
                                                ]),
                                            child: Padding(
                                              padding: EdgeInsets.all(6.dp),
                                              child: Text(
                                                DataCubit.time != 0
                                                    ? '${DataCubit.time} mins trip'
                                                    : '',
                                                style: TextStyle(
                                                    color: Color(0xff808080)),
                                              ),
                                            ),
                                          )),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        padding: EdgeInsets.only(left: 50.w),
                                        width: 80.w,
                                        height: 0.2.h,
                                        decoration: const BoxDecoration(
                                            color: Colors.black
                                          //0xffE2E2E2
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Text(
                                    '${tripRequest.destination}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13.dp),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        RadioListTile(
                            dense: true,
                            contentPadding: EdgeInsets.zero,
                            title: Text('${tripRequest.fees1}'),
                            activeColor: Color(0xffFF6A03),
                            value: tripRequest.fees1,
                            groupValue: DataCubit.groupValue,
                            onChanged: (value) {
                              DataCubit.get(context).changeGroupValueNumberr(value!);
                              DataCubit.get(context).changeFeesNumber('fees1');
                            }),
                        RadioListTile(
                          dense: true,
                          contentPadding: EdgeInsets.zero,
                          title: Text('${tripRequest.fees2}'),
                          activeColor: Color(0xffFF6A03),
                          value: tripRequest.fees2,
                          groupValue: DataCubit.groupValue,
                          onChanged: (value) {
                            DataCubit.get(context).changeGroupValueNumberr(value!);
                            DataCubit.get(context).changeFeesNumber('fees2');
                          },
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 40.w,
                              height: 5.5.h,
                              child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                      side: const BorderSide(
                                          color: Color(0xffFF6A03))),
                                  onPressed: () {
                                    Navigator.pop(context);
                                      DataCubit.tripToPickup = false;
                                  },
                                  child: const Text(
                                    'Decline',
                                    style: TextStyle(color: Color(0xffFF6A03)),
                                  )),
                            ),
                            SizedBox(
                              width: 7.w,
                            ),
                            SizedBox(
                              width: 40.w,
                              height: 5.5.h,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xffFF6A03)),
                                  onPressed: () async{
                                    await DataCubit.get(context).acceptLessPriceTrip(
                                        fees: DataCubit.groupValue!,
                                        feesNumber: DataCubit.feesNumber!,
                                        rider: tripRequest.riderId,
                                        driverLocation:
                                        'https://maps.google.com/?q=${sourcePosition!.latitude},${sourcePosition!.longitude}',
                                        driverLocationLat:
                                        sourcePosition!.latitude.toString(),
                                        driverLocationLng:
                                        sourcePosition!.longitude.toString(),
                                        context: context);
                                    Navigator.pop(context);
                                  },
                                  child: state is AcceptLessPriceTripLoadingState
                                      ? Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  )
                                      : const Text(
                                    'Accept',
                                    style: TextStyle(color: Colors.white),
                                  )),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              );
            },
          );
        }
    ),
  ).whenComplete((){
      declineBottomSheet = false;
  });
}