import 'dart:async';
import 'dart:math' as math;
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_autocomplete_text_field/model/prediction.dart';
import 'package:voo_app/Controller/Data/data_cubit.dart';
import 'package:voo_app/Model/TripRequestModel.dart';
import 'package:voo_app/view/pages/DataCheck.dart';
import 'package:voo_app/view/pages/collect_cash_screen.dart';
import 'package:voo_app/view/widgets/CountDownDialog.dart';
import 'package:voo_app/view/widgets/main_elevated_button.dart';

import '../../../Controller/Constants.dart';
import '../../../Model/TripModel.dart';
final double rangeInFeet = 50;
double _degreeToRadian(double degree) {
  return degree * math.pi / 180;
}
double _calculateDistance(double lat1, double lon1, double lat2, double lon2) {
  const double R = 6371000; // Earth radius in meters
  final double dLat = _degreeToRadian(lat2 - lat1);
  final double dLon = _degreeToRadian(lon2 - lon1);
  final double a = math.sin(dLat / 2) * math.sin(dLat / 2) +
      math.cos(_degreeToRadian(lat1)) * math.cos(_degreeToRadian(lat2)) *
          math.sin(dLon / 2) * math.sin(dLon / 2);
  final double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
  final double distance = R * c; // Distance in meters
  return distance * 3.28084; // Convert to feet
}
void _checkProximity(BuildContext context) async{
  if(inProgressTrip.driverInProgressTrip == null){await DataCubit.get(context).getInProgressTripDetails();}
  double distance = _calculateDistance(
    sourcePosition!.latitude,
    sourcePosition!.longitude,
    double.parse(inProgressTrip.driverInProgressTrip!.pickupLatitude!),
    double.parse(inProgressTrip.driverInProgressTrip!.pickupLongitude!),
  );
  if (distance <= rangeInFeet) {
    DataCubit.inRange = true;
    print('Within range');

  } else {
    DataCubit.inRange = false;
  }
}
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool locationEnabled = false;
  bool drivingState = false;

  double cameraZoom = 17;
  int time = 0;
  String? destinationLocation = '';
  bool loadingState = false;
  String? groupValue;

  final sdkChannel = MethodChannel(FAIRMATIC_CHANNEL);
  late Timer timer;
  int seconds = 30;
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

    try {
      final response = await dio.get(url, queryParameters: {
        'origin': origin,
        'destination': destination,
        'key': apiKey,
      });

      if (response.statusCode == 200) {
        final jsonResponse = response.data;
        if (jsonResponse['status'] == 'OK') {
          final legs = jsonResponse['routes'][0]['legs'];
          if (legs.isNotEmpty) {
            final duration = legs[0]['duration']['value'];
            return Duration(seconds: duration).inMinutes;
          }
        } else {
          print('Error: ${jsonResponse['status']}');
        }
      } else {
        print('Failed to load directions');
      }
    } catch (e) {
      print('Error: $e');
    }

    return null;
  }

  final Set<Marker> _markers = {};
  Stream<Position>? locationStream;
  Completer<GoogleMapController> googleMapController = Completer();
  StreamSubscription<Position>? _positionStreamSubscription;
  Position? _previousPosition;
  GoogleMapController? controller;

  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;
  void addCustomMarker() {
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration(size: Size(1, 1)), 'assets/images/car.png')
        .then((icon) {
      setState(() {
        markerIcon = icon;
      });
    });
  }

  Future<void> _addMarker(Prediction prediction) async {
    final marker = Marker(
      markerId: MarkerId(prediction.placeId!),
      position:
          LatLng(double.parse(prediction.lat!), double.parse(prediction.lng!)),
      infoWindow: InfoWindow(
        title: prediction.description,
      ),
    );
    setState(() {
      _markers.add(marker);
    });
  }

  Future handle(BuildContext context) async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print(message.data);
      TripModel? newTrip;
      TripRequest? tripRequest;
      if (message.data['message'] == 'Send Request Trip less Price') {
        tripRequest = TripRequest.fromJson(message.data);
        acceptDeclineLessPriceShowModalSheet(context, tripRequest);
      }
    else  if (message.data['message'] == 'Send Rider Cancel Trip') {
        Fluttertoast.showToast(
            msg: 'Rider Canceled Trip',
            fontSize: 16.dp,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            gravity: ToastGravity.TOP);
        polyLineCoordinates.clear();
        setState(() {
          tripToPickup = false;
          tripToDestination = false;
          _markers
              .removeWhere((marker) => marker.markerId == MarkerId('destination'));
        });
        cancelRequest();
        stopListeningToLocationChanges();
      }

      else if (message.data['message'] == 'Rider Accept Offer') {
        tripModel = TripModel.fromJson(message.data);
        locationStream = Geolocator.getPositionStream(
            locationSettings: const LocationSettings(
              accuracy: LocationAccuracy.high,
            ));
        acceptRequest(tripModel.tripId);
        setState(() {
          drivingState = true;
          tripToPickup = true;
          setState(() {
            loadingState = false;
            _markers.add(Marker(
                markerId: const MarkerId('destination'),
                icon: BitmapDescriptor.defaultMarker,
                position: LatLng(double.parse(tripModel.pickupLatitude!),
                    double.parse(tripModel.pickupLongitude!))));
            getPolyPoint(double.parse(tripModel.pickupLatitude!),
                double.parse(tripModel.pickupLongitude!));
          });
        });
        startListeningToLocationChanges();
      } else if (message.data['message'] == 'Send Request Trip') {
        try {
          newTrip = TripModel.fromJson(message.data);
        } catch (error) {
          print("Error parsing trip data: $error");
        }
        if (newTrip != null) {
          tripModel = newTrip;
          trip ??= newTrip;
        }
        print(message.notification?.body);
        print('Got a message whilst in the foreground!');
        print('Message data: ${message.data}');
        if (tripModel.pickupLongitude == null ||
            tripModel.pickupLatitude == null) {
        } else {
          getEstimatedTime(
                  driverLat: sourcePosition!.latitude,
                  driverLng: sourcePosition!.longitude,
                  riderLat: double.parse(tripModel.pickupLatitude!),
                  riderLng: double.parse(tripModel.pickupLongitude!),
                  apiKey: googleMapApiKey)
              .then((value) async {
            // if(value != null){ time = value;}
            final x = await getAddressFromLatLng(
                double.parse(tripModel.pickupLatitude!),
                double.parse(tripModel.pickupLongitude!));
            final y;
            if (tripModel.destinationLatitude != null) {
              y = await getAddressFromLatLng(
                  double.parse(tripModel.destinationLatitude!),
                  double.parse(tripModel.destinationLongitude!));
            } else {
              y = 'Not Specified';
            }

            showDialog(
              context: context,
              builder: (BuildContext context) {
                return CountdownDialog(
                  onTimerFinish: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                );
              },
            );
            acceptDeclineShowModalSheet(context, x, y);
          });
        }
      }
      // coming = true;
      // }
    });
  }

  void arrivedToPickupShowModalSheet(BuildContext context) {
    showModalBottomSheet(
      isDismissible: false,
      isScrollControlled: true,
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
                  'Customer location',
                  style: TextStyle(
                    fontSize: 18.dp,
                  ),
                ),
                const Spacer(),
                Text(
                  '${time} mins away',
                  style: TextStyle(color: Color(0xff808080)),
                )
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0.w, vertical: 3.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(inProgressTrip.riderName == null && tripModel.rider != null ? tripModel.rider! :
                              '${inProgressTrip.riderName}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15.dp),
                            ),
                            Text(
                              '${tripModel.paymentMethod}',
                              style: TextStyle(
                                  color: const Color(0xff808080),
                                  fontSize: 13.dp),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 30.w,
                        ),
                        InkWell(
                          onTap: () {
                            makePhoneCall('0123456789');
                          },
                          child: Container(
                            padding: EdgeInsets.all(5.dp),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.dp),
                                color: const Color(0xffD9D9D9)),
                            child: Icon(Icons.phone,
                                color: Colors.red, size: 22.dp),
                          ),
                        ),
                        // SizedBox(
                        //   width: 3.w,
                        // ),
                        // InkWell(
                        //   onTap: () {},
                        //   child: Container(
                        //     padding: EdgeInsets.all(5.dp),
                        //     decoration: BoxDecoration(
                        //         borderRadius: BorderRadius.circular(30.dp),
                        //         color: const Color(0xffD9D9D9)),
                        //     child: Icon(Icons.message,
                        //         color: Colors.red, size: 22.dp),
                        //   ),
                        // ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 4.h,
                ),
                MainElevatedButtonTwo(
                    onPressed: () async {
                      String? pickupLocation = await getAddressFromLatLng(
                          sourcePosition!.latitude, sourcePosition!.longitude);
                      DataCubit.get(context).startTrip(
                          pickUpTitle: pickupLocation,
                          tripId: int.parse(tripModel.tripId!),
                          driverLocation:
                              'https://maps.google.com/?q=${sourcePosition!.latitude},${sourcePosition!.longitude}',
                          driverLocationLat:
                              sourcePosition!.latitude.toString(),
                          driverLocationLng:
                              sourcePosition!.longitude.toString(),
                          context: context);
                    },
                    text: 'Start trip',
                    backgroundColor: const Color(0xffFF6A03)),
                TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Confirmation'),
                            content: Text('Are you sure you want to cancel?'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context), // No button action
                                child: Text('No'),
                              ),
                              TextButton(
                                onPressed: () {
                                  DataCubit.get(context).cancelTrip(
                                      tripId: int.parse(tripModel.tripId!),
                                      context: context);
                                  Navigator.pop(context);
                                  setState(() {
                                    tripToPickup = false;
                                  });
                                }, // Yes button action
                                child: Text(
                                  'Yes',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text(
                      'Cancel trip',
                      style: TextStyle(
                          color: const Color(0xff646363), fontSize: 15.dp),
                    ))
              ],
            ),
          )
        ],
      ),
    );
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
                  '$time mins away',
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
                            setState(() {
                              tripToPickup = false;
                            });
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
                          child: loadingState == true
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
    showModalBottomSheet(
      isDismissible: false,
      barrierColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(23), topRight: Radius.circular((23))),
      ),
      context: context,
      builder: (context) => BlocConsumer<DataCubit, DataState>(
        listener: (context, state) {},
        builder: (context, state) {
          return StatefulBuilder(builder: (context, state) {
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
                        '$time mins away',
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
                                              time != 0
                                                  ? '${time} mins trip'
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
                          groupValue: groupValue,
                          onChanged: (value) {
                            groupValue = value!;
                            state(() {});
                          }),
                      RadioListTile(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        title: Text('${tripRequest.fees2}'),
                        activeColor: Color(0xffFF6A03),
                        value: tripRequest.fees2,
                        groupValue: groupValue,
                        onChanged: (value) {
                          groupValue = value!;
                          state(() {});
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
                                  setState(() {
                                    tripToPickup = false;
                                  });
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
                                      fees: groupValue!,
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
          });
        },
      ),
    );
  }

  void getPolyPoint(double lat, double lng) async {
    polyLineCoordinates.clear();
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        googleMapApiKey,
        PointLatLng(sourcePosition!.latitude, sourcePosition!.longitude),
        PointLatLng(lat, lng));
    print(result.points);
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) =>
          polyLineCoordinates.add(LatLng(point.latitude, point.longitude)));
      setState(() {});
    } else {
      print('Nothing');
    }
  }

  void startListeningToLocationChanges() {
    _positionStreamSubscription = locationStream!.listen((Position position) {
      if (_previousPosition != null &&
          (_previousPosition!.latitude != position.latitude ||
              _previousPosition!.longitude != position.longitude)) {
        _previousPosition = position;
        setState(() {
          sourcePosition = position;
          final updatedMarker = Marker(
            markerId: MarkerId('source'),
            rotation: position.heading,
            icon: markerIcon,
            position: LatLng(position.latitude, position.longitude),
          );
          _markers
              .removeWhere((marker) => marker.markerId == MarkerId('source'));
          _markers.add(updatedMarker);

          if (drivingState) {
            controller!.animateCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(
                    target: LatLng(position.latitude, position.longitude),
                    zoom: cameraZoom),
              ),
            );
          }
          _checkProximity(context);
        });
      } else {
        _previousPosition = position;
      }
    });
  }

  void stopListeningToLocationChanges() {
    _positionStreamSubscription?.cancel();
    _positionStreamSubscription = null;
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

  @override
  void dispose() {
    stopListeningToLocationChanges();
    super.dispose();
  }

  @override
  void initState() {
    Timer(
      Duration(seconds: 1),()async{
      final locationPermission = await Geolocator.checkPermission();
        if( locationPermission == LocationPermission.always || locationPermission == LocationPermission.whileInUse){ checkLocationEnabled().whenComplete(() async {
          controller = await googleMapController.future;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (inProgressTrip.driverInProgressTrip != null &&
                inProgressTrip.driverInProgressTrip!.status != null &&
                inProgressTrip.driverInProgressTrip!.status!.isNotEmpty) {
              DataCubit.get(context)
                  .checkStatus(inProgressTrip.driverInProgressTrip!.status!);
            }
          });
          addCustomMarker();
          Timer(
            Duration(seconds: 1),
                () {
              setState(() {
                _markers.add(Marker(
                    markerId: const MarkerId('source'),
                    icon: markerIcon,
                    position: LatLng(
                        sourcePosition!.latitude, sourcePosition!.longitude)));
              });
            },
          );
          if (controller != null && sourcePosition != null) {
            controller!.animateCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(
                  target:
                  LatLng(sourcePosition!.latitude, sourcePosition!.longitude),
                  zoom: 20,
                ),
              ),
            );
          }
          if (!locationEnabled) {
          } else {
            locationStream = Geolocator.getPositionStream(
                locationSettings: LocationSettings(
                    accuracy: LocationAccuracy.high,
                    distanceFilter: drivingState == true ? 50 : 0));
            startListeningToLocationChanges();
          }
        });}
        else {
         showDisclosureDialog();
        }
    }
    );
    // checkLocationEnabled().whenComplete(() async {
    //   controller = await googleMapController.future;
    //   WidgetsBinding.instance.addPostFrameCallback((_) {
    //     if (inProgressTrip.driverInProgressTrip != null &&
    //         inProgressTrip.driverInProgressTrip!.status != null &&
    //         inProgressTrip.driverInProgressTrip!.status!.isNotEmpty) {
    //       DataCubit.get(context)
    //           .checkStatus(inProgressTrip.driverInProgressTrip!.status!);
    //     }
    //   });
    //   addCustomMarker();
    //   Timer(
    //     Duration(seconds: 1),
    //     () {
    //       setState(() {
    //         _markers.add(Marker(
    //             markerId: const MarkerId('source'),
    //             icon: markerIcon,
    //             position: LatLng(
    //                 sourcePosition!.latitude, sourcePosition!.longitude)));
    //       });
    //     },
    //   );
    //   if (controller != null && sourcePosition != null) {
    //     controller!.animateCamera(
    //       CameraUpdate.newCameraPosition(
    //         CameraPosition(
    //           target:
    //               LatLng(sourcePosition!.latitude, sourcePosition!.longitude),
    //           zoom: 20,
    //         ),
    //       ),
    //     );
    //   }
    //   if (!locationEnabled) {
    //   } else {
    //     locationStream = Geolocator.getPositionStream(
    //         locationSettings: LocationSettings(
    //             accuracy: LocationAccuracy.high,
    //             distanceFilter: drivingState == true ? 50 : 0));
    //     startListeningToLocationChanges();
    //   }
    // });
    handle(context);
    // addCustomMarker();
    //
    // _markers.add(Marker(
    //     markerId: const MarkerId('destination'),
    //     icon: BitmapDescriptor.defaultMarkerWithHue(
    //         BitmapDescriptor.hueGreen),
    //     position: destinationPosition!),);

    super.initState();
  }
  void showDisclosureDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Location Permission Needed'),
          content: Text(
              'This app needs access to your location while using the app to provide its core functionality. Please grant the location permission.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                checkLocationEnabled().whenComplete(() async {
                  controller = await googleMapController.future;
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (inProgressTrip.driverInProgressTrip != null &&
                        inProgressTrip.driverInProgressTrip!.status != null &&
                        inProgressTrip.driverInProgressTrip!.status!.isNotEmpty) {
                      DataCubit.get(context)
                          .checkStatus(inProgressTrip.driverInProgressTrip!.status!);
                    }
                  });
                  addCustomMarker();
                  Timer(
                    Duration(seconds: 1),
                        () {
                      setState(() {
                        _markers.add(Marker(
                            markerId: const MarkerId('source'),
                            icon: markerIcon,
                            position: LatLng(
                                sourcePosition!.latitude, sourcePosition!.longitude)));
                      });
                    },
                  );
                  if (controller != null && sourcePosition != null) {
                    controller!.animateCamera(
                      CameraUpdate.newCameraPosition(
                        CameraPosition(
                          target:
                          LatLng(sourcePosition!.latitude, sourcePosition!.longitude),
                          zoom: 20,
                        ),
                      ),
                    );
                  }
                  if (!locationEnabled) {
                  } else {
                    locationStream = Geolocator.getPositionStream(
                        locationSettings: LocationSettings(
                            accuracy: LocationAccuracy.high,
                            distanceFilter: drivingState == true ? 50 : 0));
                    startListeningToLocationChanges();
                  }
                });
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
  Future<void> checkLocationEnabled() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (serviceEnabled != true) {
      await Geolocator.requestPermission();
    }
    setState(() {
      locationEnabled = serviceEnabled;
    });
    final locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.denied) {
      await Geolocator.requestPermission();
    }
    sourcePosition = await Geolocator.getCurrentPosition();
  }


  @override
  Widget build(BuildContext context) {
    bool? light;
    loginData.acceptingRides == null ? light = false : light = true;
    bool showDialogBool = false;
    return BlocConsumer<DataCubit, DataState>(
      listener: (context, state) async {
        if (state is EndTripSuccessState) {
          await DataCubit.get(context).getInProgressTripDetails();
          setState(() {
            tripToDestination = false;
          });
          polyLineCoordinates.clear();
          endTrip();
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CollectCashScreen(
                        destinationLocation: destinationLocation,
                    riderName: endTripModel.riderName,
                      )));
          print(endTripModel.total);
        }
        if (state is StartTripSuccessState) {
          Navigator.pop(context);
          locationStream = Geolocator.getPositionStream(
              locationSettings: const LocationSettings(
            accuracy: LocationAccuracy.high,
          ));
          setState(() {
            drivingState = true;
            tripToPickup = false;
            tripToDestination = true;
            setState(() {
              loadingState = false;
              _markers.add(Marker(
                  markerId: const MarkerId('destination'),
                  icon: BitmapDescriptor.defaultMarker,
                  position: LatLng(double.parse(tripModel.destinationLatitude!),
                      double.parse(tripModel.destinationLongitude!))));
              getPolyPoint(double.parse(tripModel.destinationLatitude!),
                  double.parse(tripModel.destinationLongitude!));
            });
          });
          startTrip(tripModel.tripId);
          startListeningToLocationChanges();
        }
        if (state is StartTripCompleteSuccessState) {
          locationStream = Geolocator.getPositionStream(
              locationSettings: const LocationSettings(
            accuracy: LocationAccuracy.high,
          ));
          setState(() {
            drivingState = true;
            tripToPickup = false;
            tripToDestination = true;
            setState(() {
              loadingState = false;
              _markers.add(Marker(
                  markerId: const MarkerId('destination'),
                  icon: BitmapDescriptor.defaultMarker,
                  position: LatLng(
                      double.parse(inProgressTrip
                          .driverInProgressTrip!.destinationLatitude!),
                      double.parse(inProgressTrip
                          .driverInProgressTrip!.destinationLongitude!))));
              getPolyPoint(
                  double.parse(inProgressTrip
                      .driverInProgressTrip!.destinationLatitude!),
                  double.parse(inProgressTrip
                      .driverInProgressTrip!.destinationLongitude!));
            });
          });
          startListeningToLocationChanges();
        }
        if (state is ArrivedAtLocationSuccessState) {
          await DataCubit.get(context).getInProgressTripDetails();
          Fluttertoast.showToast(
              msg: 'Rider Notified That You\'ve arrived',
              fontSize: 16.dp,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              gravity: ToastGravity.TOP);
          getEstimatedTime(
                  driverLat: sourcePosition!.latitude,
                  driverLng: sourcePosition!.longitude,
                  riderLat: double.parse(tripModel.pickupLatitude!),
                  riderLng: double.parse(tripModel.pickupLongitude!),
                  apiKey: googleMapApiKey)
              .then((value) async {
            time = value!;
          });
          arrivedToPickupShowModalSheet(context);
        }
        if (state is ArrivedAtLocationCompleteSuccessState) {
          Fluttertoast.showToast(
              msg: 'Rider Notified That You\'ve arrived',
              fontSize: 16.dp,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              gravity: ToastGravity.TOP);
          getEstimatedTime(
                  driverLat: sourcePosition!.latitude,
                  driverLng: sourcePosition!.longitude,
                  riderLat: double.parse(
                      inProgressTrip.driverInProgressTrip!.pickupLatitude!),
                  riderLng: double.parse(
                      inProgressTrip.driverInProgressTrip!.pickupLongitude!),
                  apiKey: googleMapApiKey)
              .then((value) async {
            time = value!;
          });
          arrivedToPickupShowModalSheet(context);
        }
        if (state is CancelTripSuccessState) {
          Fluttertoast.showToast(
              msg: 'Trip Canceled Successfully',
              fontSize: 16.dp,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              gravity: ToastGravity.TOP);
          polyLineCoordinates.clear();
          setState(() {
            _markers
                .removeWhere((marker) => marker.markerId == MarkerId('destination'));
          });
          cancelRequest();
          stopListeningToLocationChanges();
        }
        if (state is AcceptTripLoadingState) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return Dialog(
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ), // Optional for rounded corners
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              );
            },
          );
        }
        if (state is AcceptTripSuccessState) {
          Navigator.pop(context);
          Navigator.pop(context);
          Navigator.pop(context);
          locationStream = Geolocator.getPositionStream(
              locationSettings: const LocationSettings(
            accuracy: LocationAccuracy.high,
          ));
          acceptRequest(tripModel.tripId);
          setState(() {
            drivingState = true;
            tripToPickup = true;
            setState(() {
              loadingState = false;
              _markers.add(Marker(
                  markerId: const MarkerId('destination'),
                  icon: BitmapDescriptor.defaultMarker,
                  position: LatLng(double.parse(tripModel.pickupLatitude!),
                      double.parse(tripModel.pickupLongitude!))));
              getPolyPoint(double.parse(tripModel.pickupLatitude!),
                  double.parse(tripModel.pickupLongitude!));
            });
          });
          startListeningToLocationChanges();
        }
        if (state is AcceptTripCompleteSuccessState) {
          locationStream = await Geolocator.getPositionStream(
              locationSettings: const LocationSettings(
            accuracy: LocationAccuracy.high,
          ));
          getPolyPoint(
              double.parse(
                  inProgressTrip.driverInProgressTrip!.pickupLatitude!),
              double.parse(
                  inProgressTrip.driverInProgressTrip!.pickupLongitude!));
          setState(() {
            drivingState = true;
            tripToPickup = true;
            setState(() {
              loadingState = false;
              _markers.add(Marker(
                  markerId: const MarkerId('destination'),
                  icon: BitmapDescriptor.defaultMarker,
                  position: LatLng(
                      double.parse(
                          inProgressTrip.driverInProgressTrip!.pickupLatitude!),
                      double.parse(inProgressTrip
                          .driverInProgressTrip!.pickupLongitude!))));
            });
          });
          startListeningToLocationChanges();
        }
        if (state is AcceptLessPriceTripSuccessState) {
          showSimpleDialog(context, 'Important Note',
              'Your offer has been successfully sent to the rider. Please wait for their acceptance. If they do not accept, we will send a new trip request.');
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Stack(
            children: [
              GoogleMap(
                buildingsEnabled: true,
                scrollGesturesEnabled: true,
                mapToolbarEnabled: true,
                zoomGesturesEnabled: true,
                trafficEnabled: false,
                onCameraMove: (CameraPosition position) {
                  cameraZoom = position.zoom;
                },
                initialCameraPosition: CameraPosition(
                  target: sourcePosition == null
                      ? LatLng(31.2447917, 29.9740327)
                      : LatLng(
                          sourcePosition!.latitude, sourcePosition!.longitude),
                  zoom: 14.5,
                ),
                onMapCreated: (mapController) {
                  googleMapController.complete(mapController);
                },
                polylines: {
                  Polyline(
                      polylineId: PolylineId('route'),
                      color: Colors.blue,
                      visible: true,
                      points: polyLineCoordinates,
                      )
                },
                markers: _markers,
                // markers:sourcePosition == null ? {
                //   Marker(
                //       markerId: const MarkerId('destination'),
                //       icon: BitmapDescriptor.defaultMarkerWithHue(
                //           BitmapDescriptor.hueGreen),
                //       position: destinationPosition!),
                // } : {
                //   Marker(
                //       markerId: const MarkerId('Source'),
                //       icon: markerIcon,
                //       position: LatLng(sourcePosition!.latitude,
                //           sourcePosition!.longitude)),
                //   Marker(
                //       markerId: const MarkerId('destination'),
                //       icon: BitmapDescriptor.defaultMarkerWithHue(
                //           BitmapDescriptor.hueGreen),
                //       position: destinationPosition!),
                // },
              ),
              driverData != null && driverVehicle != null &&
                      licenseData != null &&
                      insuranceData != null && loginData.availableToCheck != null
                  ? SizedBox()
                  : Positioned(
                      child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DataCheckScreen()));
                      },
                      child: Container(
                        color: Colors.red,
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Please Complete Your Data First',
                              style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontSize: 14.dp,
                              ),
                            ),
                            InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DataCheckScreen()));
                                },
                                child: Icon(Icons.arrow_forward,
                                    color: Colors.white))
                          ],
                        ),
                      ),
                    )),
              Positioned(
                  bottom: 10,
                  left: 10,
                  child: FloatingActionButton(
                    onPressed: () {
                      controller!.animateCamera(
                          CameraUpdate.newCameraPosition(CameraPosition(
                        target: LatLng(sourcePosition!.latitude,
                            sourcePosition!.longitude),
                        zoom: 20,
                      )));
                    },
                    child: Icon(
                      Icons.my_location,
                      color: Colors.black,
                    ),
                    elevation: 0,
                    backgroundColor: Colors.white,
                  )),
              tripToPickup == true && tripModel.pickupLatitude != null
                  ? Positioned(
                      bottom: 80,
                      left: 10,
                      child: FloatingActionButton(
                        onPressed: () {
                          launchRouting(tripModel.pickupLatitude!,
                              tripModel.pickupLongitude!);
                        },
                        child: Icon(
                          Icons.directions_car,
                          color: Colors.black,
                        ),
                        elevation: 0,
                        backgroundColor: Colors.white,
                      ))
                  : tripToDestination == true &&
                          tripModel.destinationLatitude != null
                      ? Positioned(
                          bottom: 80,
                          left: 10,
                          child: FloatingActionButton(
                            onPressed: () {
                              launchRouting(tripModel.destinationLatitude!,
                                  tripModel.destinationLongitude!);
                            },
                            child: Icon(
                              Icons.directions_car,
                              color: Colors.black,
                            ),
                            elevation: 0,
                            backgroundColor: Colors.white,
                          ))
                      : SizedBox(),
              // GooglePlacesAutoCompleteTextFormField(
              //     textEditingController: textEditingController,
              //     googleAPIKey:   googleMapApiKey,
              //     countries: ["US","us",'EG','eg'], // optional, by default the list is empty (no restrictions)
              //     isLatLngRequired: true, // if you require the coordinates from the place details
              //     getPlaceDetailWithLatLng: (prediction) {
              //       print("Coordinates: (${prediction.lat},${prediction.lng})");
              //       _addMarker(prediction);
              //       pickedLocation = prediction;
              //       controller!.animateCamera(
              //         CameraUpdate.newCameraPosition(
              //           CameraPosition(
              //             target: LatLng(double.parse(prediction.lat!), double.parse(prediction.lng!)),
              //             zoom: 16,
              //           ),
              //         ),
              //       );
              //     }, // this callback is called when isLatLngRequired is true
              //     itmClick: (prediction) {
              //       textEditingController.text = prediction.description!;
              //       textEditingController.selection = TextSelection.fromPosition(TextPosition(offset: prediction.description!.length));
              //     }
              // ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 8.h),
                child: Column(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(3.w)),
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.w, vertical: 1.h),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 3.h,
                              backgroundColor: Color(0xffA2A2A2),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.network(
                                  '${loginData.image}',
                                  fit: BoxFit.fill,
                                  height: 30.h,
                                  width: 30.h,
                                  errorBuilder: (context, object, skipTrace) {
                                    return Icon(
                                      Icons.person,
                                      size: 52.dp,
                                      color: const Color(0xffA2A2A2),
                                    );
                                  },
                                ),
                              ),
                            ),
                            Spacer(),
                            Text(
                              '${loginData.firstName} ${loginData.lastName}',
                              style: GoogleFonts.roboto(
                                  fontSize: 14.dp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () {
                                if (driverData != null &&
                                    driverVehicle != null &&
                                    licenseData != null &&
                                    insuranceData != null && loginData.availableToCheck != null) {
                                  showDialog(
                                      context: context,
                                      builder:
                                          (context) => BlocConsumer<DataCubit,
                                                  DataState>(
                                                listener: (context, state) {},
                                                builder: (context, state) {
                                                  return StatefulBuilder(
                                                    builder:
                                                        (context, setState) {
                                                      return Theme(
                                                        data: ThemeData(
                                                            dialogBackgroundColor:
                                                                Colors.white),
                                                        child: Dialog(
                                                          elevation: 0,
                                                          child: Stack(
                                                            clipBehavior:
                                                                Clip.none,
                                                            alignment: Alignment
                                                                .topCenter,
                                                            children: [
                                                              SizedBox(
                                                                height: 28.h,
                                                                width: double
                                                                    .infinity,
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Text(
                                                                      loginData.acceptingRides ==
                                                                              null
                                                                          ? 'You\'re Offline'
                                                                          : 'You\'re ${loginData.acceptingRides}',
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize: 18
                                                                              .dp,
                                                                          color:
                                                                              const Color(0xff646363)),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          1.h,
                                                                    ),
                                                                    Text(
                                                                      loginData.acceptingRides ==
                                                                              null
                                                                          ? 'Go online to accept jobs.'
                                                                          : 'You\'re Online ',
                                                                      style: TextStyle(
                                                                          fontSize: 15
                                                                              .dp,
                                                                          color:
                                                                              const Color(0xff646363)),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          1.5.h,
                                                                    ),
                                                                    const Divider(),
                                                                    SizedBox(
                                                                      height:
                                                                          1.5.h,
                                                                    ),
                                                                    state is ChangeDriverStatusLoadingState
                                                                        ? CircularProgressIndicator()
                                                                        : Switch(
                                                                            trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
                                                                            activeTrackColor: const Color(0xffFF6A03),
                                                                            inactiveTrackColor: const Color(0xffD1D1D6),
                                                                            inactiveThumbColor: Colors.white,
                                                                            value: light!,
                                                                            onChanged: (bool value) {
                                                                              DataCubit.get(context).changeDriverStatus(status: light == false ? 'on' : 'off', context: context);
                                                                              setState(() {
                                                                                value == true ? loginData.acceptingRides = 'on' : loginData.acceptingRides = null;
                                                                                light = value;
                                                                              });
                                                                              state;
                                                                            }),
                                                                  ],
                                                                ),
                                                              ),
                                                              Positioned(
                                                                top: -50,
                                                                child:
                                                                    CircleAvatar(
                                                                  backgroundColor:
                                                                      Colors
                                                                          .white,
                                                                  radius: 40,
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/notification_offline.png',
                                                                    width: 12.w,
                                                                  ),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ));
                                } else {
                                  Fluttertoast.showToast(
                                      msg:
                                          'You have to complete your data first',
                                      fontSize: 18.dp,
                                      gravity: ToastGravity.BOTTOM,
                                      toastLength: Toast.LENGTH_LONG,
                                      backgroundColor: Colors.red);
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 3.w, vertical: 1.h),
                                decoration: BoxDecoration(
                                    color: driverData != null &&
                                            driverVehicle != null &&
                                            licenseData != null &&
                                            insuranceData != null
                                        ? Color(0xffFF6A03)
                                        : Colors.grey,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Row(
                                  children: [
                                    Text(
                                      driverData != null &&
                                              driverVehicle != null &&
                                              licenseData != null &&
                                              insuranceData != null
                                          ? loginData.acceptingRides == null
                                              ? 'Off'
                                              : 'On'
                                          : 'Pending',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    SizedBox(
                                      width: 1.5.w,
                                    ),
                                    CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 2.5.w,
                                      child: CircleAvatar(
                                        // backgroundColor: Colors.white,
                                        backgroundColor: driverData != null &&
                                                driverVehicle != null &&
                                                licenseData != null &&
                                                insuranceData != null
                                            ? loginData.acceptingRides != null
                                                ? Color(0xffFF6A03)
                                                    .withOpacity(0.5)
                                                : Colors.white
                                            : Colors.white,
                                        radius: 1.8.w,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        )),
                    SizedBox(
                      height: 4.h,
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.w, vertical: 1.5.h),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: const Color(0xffFF6A03),
                                radius: 6.w,
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 3.5.w,
                                  child: Icon(
                                    Icons.attach_money,
                                    color: const Color(0xffFF6A03),
                                    size: 19.dp,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Earnings',
                                    style:
                                        TextStyle(color: Color(0xff646363)),
                                  ),
                                  Text(
                                    '${loginData.totalEarnings}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.dp),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 4.w, vertical: 1.5.h),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: const Color(0xffFF6A03),
                                radius: 6.w,
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 3.5.w,
                                  child: Icon(
                                    Icons.calendar_today,
                                    color: const Color(0xffFF6A03),
                                    size: 18.dp,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Total trips',
                                    style: TextStyle(color: Color(0xff646363)),
                                  ),
                                  Text(
                                    '${loginData.totalTrips}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.dp),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    const Spacer(),
                    tripToPickup == true && DataCubit.inRange == true
                        ? SizedBox(
                            width: 40.w,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xffFF6A03)),
                                onPressed: () {
                                  if (light == true) {
                                    DataCubit.get(context).arrivedAtLocation(
                                        tripId: int.parse(tripModel.tripId!),
                                        context: context);
                                    getEstimatedTime(
                                            driverLat: sourcePosition!.latitude,
                                            driverLng:
                                                sourcePosition!.longitude,
                                            riderLat: double.parse(
                                                tripModel.destinationLatitude!),
                                            riderLng: double.parse(tripModel
                                                .destinationLongitude!),
                                            apiKey: googleMapApiKey)
                                        .then((value) async {
                                      time = value!;
                                    });
                                  } else {
                                    showDialog(
                                      context: context,
                                      builder: (context) => StatefulBuilder(
                                        builder: (context, setState) {
                                          return Theme(
                                            data: ThemeData(
                                                dialogBackgroundColor:
                                                    Colors.white),
                                            child: Dialog(
                                              elevation: 0,
                                              child: Stack(
                                                clipBehavior: Clip.none,
                                                alignment: Alignment.topCenter,
                                                children: [
                                                  SizedBox(
                                                    height: 28.h,
                                                    width: double.infinity,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          'You\'re offline',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 18.dp,
                                                              color: const Color(
                                                                  0xff646363)),
                                                        ),
                                                        SizedBox(
                                                          height: 1.h,
                                                        ),
                                                        Text(
                                                          'Go online to accept jobs.',
                                                          style: TextStyle(
                                                              fontSize: 15.dp,
                                                              color: const Color(
                                                                  0xff646363)),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        SizedBox(
                                                          height: 1.5.h,
                                                        ),
                                                        const Divider(),
                                                        SizedBox(
                                                          height: 1.5.h,
                                                        ),
                                                        Switch(
                                                            trackOutlineColor:
                                                                WidgetStateProperty
                                                                    .all(Colors
                                                                        .transparent),
                                                            activeTrackColor:
                                                                const Color(
                                                                    0xffFF6A03),
                                                            inactiveTrackColor:
                                                                const Color(
                                                                    0xffD1D1D6),
                                                            inactiveThumbColor:
                                                                Colors.white,
                                                            value: light!,
                                                            onChanged:
                                                                (bool value) {
                                                              setState(() {
                                                                light = value;
                                                                showDialogBool =
                                                                    value;

                                                                if (showDialogBool ==
                                                                    true) {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                }

                                                                // acceptDeclineShowModalSheet(
                                                                //     context);
                                                              });
                                                            }),
                                                      ],
                                                    ),
                                                  ),
                                                  Positioned(
                                                    top: -50,
                                                    child: CircleAvatar(
                                                      backgroundColor:
                                                          Colors.white,
                                                      radius: 40,
                                                      child: Image.asset(
                                                        'assets/images/notification_offline.png',
                                                        width: 12.w,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  }
                                },
                                child: const Text(
                                  'Notify Rider',
                                  style: TextStyle(color: Colors.white),
                                )),
                          )
                        : tripToPickup == false && tripToDestination == true
                            ? SizedBox(
                                width: 40.w,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xffFF6A03)),
                                    onPressed: () async {
                                      if (light == true) {
                                        destinationLocation =
                                            await getAddressFromLatLng(
                                                sourcePosition!.latitude,
                                                sourcePosition!.longitude);
                                        DataCubit.get(context).endTrip(
                                          destinationTitle: destinationLocation,
                                          tripId: int.parse(tripModel.tripId!),
                                          state: DataCubit.destinationState,
                                          context: context,
                                        );
                                      } else {
                                        showDialog(
                                          context: context,
                                          builder: (context) => StatefulBuilder(
                                            builder: (context, setState) {
                                              return Theme(
                                                data: ThemeData(
                                                    dialogBackgroundColor:
                                                        Colors.white),
                                                child: Dialog(
                                                  elevation: 0,
                                                  child: Stack(
                                                    clipBehavior: Clip.none,
                                                    alignment:
                                                        Alignment.topCenter,
                                                    children: [
                                                      SizedBox(
                                                        height: 28.h,
                                                        width: double.infinity,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              'You\'re offline',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize:
                                                                      18.dp,
                                                                  color: const Color(
                                                                      0xff646363)),
                                                            ),
                                                            SizedBox(
                                                              height: 1.h,
                                                            ),
                                                            Text(
                                                              'Go online to accept jobs.',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      15.dp,
                                                                  color: const Color(
                                                                      0xff646363)),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ),
                                                            SizedBox(
                                                              height: 1.5.h,
                                                            ),
                                                            const Divider(),
                                                            SizedBox(
                                                              height: 1.5.h,
                                                            ),
                                                            Switch(
                                                                trackOutlineColor:
                                                                    WidgetStateProperty
                                                                        .all(Colors
                                                                            .transparent),
                                                                activeTrackColor:
                                                                    const Color(
                                                                        0xffFF6A03),
                                                                inactiveTrackColor:
                                                                    const Color(
                                                                        0xffD1D1D6),
                                                                inactiveThumbColor:
                                                                    Colors
                                                                        .white,
                                                                value: light!,
                                                                onChanged: (bool
                                                                    value) {
                                                                  setState(() {
                                                                    light =
                                                                        value;
                                                                    showDialogBool =
                                                                        value;

                                                                    if (showDialogBool ==
                                                                        true) {
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop();
                                                                    }

                                                                    // acceptDeclineShowModalSheet(
                                                                    //     context);
                                                                  });
                                                                }),
                                                          ],
                                                        ),
                                                      ),
                                                      Positioned(
                                                        top: -50,
                                                        child: CircleAvatar(
                                                          backgroundColor:
                                                              Colors.white,
                                                          radius: 40,
                                                          child: Image.asset(
                                                            'assets/images/notification_offline.png',
                                                            width: 12.w,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      }
                                    },
                                    child: const Text(
                                      'End Trip',
                                      style: TextStyle(color: Colors.white),
                                    )),
                              )
                            : SizedBox(),
                    tripToPickup == true
                        ? SizedBox(
                            width: 40.w,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      // return the dialog
                                      return AlertDialog(
                                        title: Text('Confirmation'),
                                        content: Text(
                                            'Are you sure you want to cancel?'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                context), // No button action
                                            child: Text('No'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              DataCubit.get(context).cancelTrip(
                                                  tripId: int.parse(
                                                      tripModel.tripId!),
                                                  context: context);
                                              Navigator.pop(context);
                                              setState(() {
                                                tripToPickup = false;
                                                polyLineCoordinates.clear();
                                              });
                                            }, // Yes button action
                                            child: Text(
                                              'Yes',
                                              style:
                                                  TextStyle(color: Colors.red),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: const Text(
                                  'Cancel Trip',
                                  style: TextStyle(color: Colors.white),
                                )),
                          )
                        : SizedBox(),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void turnOn() {
    sdkChannel.invokeMethod("turnON");
  }

  void acceptRequest(String? tripId) {
    sdkChannel.invokeMethod("acceptRequest", {"trip_id": tripId});
  }

  void cancelRequest() {
    sdkChannel.invokeMethod("acceptRequest");
  }

  void startTrip(String? tripId) {
    sdkChannel.invokeMethod("startTrip", {"trip_id": tripId});
  }

  void endTrip() {
    sdkChannel.invokeMethod("endTrip");
  }

  void turnOff() {
    sdkChannel.invokeMethod("turnOff");
  }
}
