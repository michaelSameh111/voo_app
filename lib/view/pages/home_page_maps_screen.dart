import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_autocomplete_text_field/model/prediction.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:voo_app/Controller/Firebase%20Notifications.dart';
import 'package:voo_app/view/pages/DataCheck.dart';
import 'package:voo_app/view/pages/customer_location_maps_screen.dart';

import '../../Controller/Constants.dart';
import 'history _screen/history_screen.dart';
import 'main_profile_screen/main_profile_screen.dart';

class HomePageMapsScreen extends StatefulWidget {
  const HomePageMapsScreen({super.key});

  @override
  State<HomePageMapsScreen> createState() => _HomePageMapsScreenState();
}

class _HomePageMapsScreenState extends State<HomePageMapsScreen> {
  int currentIndex = 0;
  bool light = true;
  bool showDialogBool = false;

  List <Widget> screens = [
    HomePage(),
    HistoryScreen(),
    MainProfileScreen(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xffFF6A03),
        unselectedItemColor: const Color(0xffA2A2A2),
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  LatLng? destinationPosition = const LatLng(31.2449, 29.9725);
  Prediction? pickedLocation ;
  bool locationEnabled = false;
  List<LatLng> polyLineCoordinates = [];
  final Set<Marker> _markers = {
  };
  Stream<Position>? locationStream;
  Completer<GoogleMapController> googleMapController = Completer();
  StreamSubscription<Position>? _positionStreamSubscription;
  Position? _previousPosition;
  GoogleMapController? controller;
  final TextEditingController textEditingController = TextEditingController();

  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;
  void addCustomMarker(){
    BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(15,15)), 'assets/images/car.png').then((icon){
      setState(() {
        markerIcon = icon;
      });
    });
  }
  Future<void> _addMarker(Prediction prediction) async {
    final marker = Marker(
      markerId: MarkerId(prediction.placeId!),
      position: LatLng(double.parse(prediction.lat!),double.parse(prediction.lng!)),
      infoWindow: InfoWindow(
        title: prediction.description,
      ),
    );
    setState(() {
      _markers.add(marker);
    });
  }
  void getPolyPoints(double lat , double lng ) async {
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
        });
        controller!.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(position.latitude, position.longitude),
              zoom: 20,
            ),
          ),
        );
      } else {
        _previousPosition = position;
      }
    });
  }
  void stopListeningToLocationChanges() {
    _positionStreamSubscription?.cancel();
    _positionStreamSubscription = null;
  }
  @override
  void dispose() {
    stopListeningToLocationChanges();
    super.dispose();
  }

  @override
  void initState() {
    FirebaseNotifications().handle(context);
    // addCustomMarker();
    //
    // _markers.add(Marker(
    //     markerId: const MarkerId('destination'),
    //     icon: BitmapDescriptor.defaultMarkerWithHue(
    //         BitmapDescriptor.hueGreen),
    //     position: destinationPosition!),);
    checkLocationEnabled().whenComplete(() async {
      sourcePosition ??= await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      Timer(Duration(seconds: 1),() {
        _markers.add(Marker(
            markerId: const MarkerId('Source'),
            icon: markerIcon,
            position: LatLng(sourcePosition!.latitude,
                sourcePosition!.longitude)),);
      },);
      print(locationEnabled);
      if (!locationEnabled) {
        print('Noooooooooooooooooooooooooooo');
        showDialog(
          context: context,
          builder: (context) => StatefulBuilder(
            builder: (context, setState) {
              return Theme(
                data: ThemeData(dialogBackgroundColor: Colors.white),
                child: Dialog(
                  elevation: 0,
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.topCenter,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 5.h,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.w),
                              child: Text(
                                'Please provide the location permission from settings',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.dp,
                                    color: const Color(0xff646363)),
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            const Divider(),
                            // SizedBox(
                            //   height: 1.5.h,
                            // ),
                            GestureDetector(
                              onTap: () {
                                toggleLocation();
                              },
                              child: SizedBox(
                                height: 5.h,
                                width: double.infinity,
                                child: Center(
                                  child: Text(
                                    'Go To Settings',
                                    style: TextStyle(
                                        color: const Color(0xfff70415),
                                        fontSize: 20.dp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        top: -50,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 5.h,
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
      } else {
        controller = await googleMapController.future;
        locationStream = Geolocator.getPositionStream(
            locationSettings: const LocationSettings(
              accuracy: LocationAccuracy.high,));
        startListeningToLocationChanges();
      }
    });

    super.initState();
  }



  Future<void> checkLocationEnabled() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    await Geolocator.requestPermission();
    setState(() {
      locationEnabled = serviceEnabled;
    });
  }

  Future<void> toggleLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (serviceEnabled) {
      await Geolocator.openLocationSettings();
    } else {
      PermissionStatus permissionStatus = await Permission.location.request();
      if (permissionStatus == PermissionStatus.granted) {
        await Geolocator.openLocationSettings();
      }
    }
    setState(() {
      locationEnabled = !locationEnabled;
    });
  }
  @override
  Widget build(BuildContext context) {
    bool light = true;
    bool showDialogBool = false;
    return SafeArea(
      child: Stack(
        children: [
          GoogleMap(
            // myLocationButtonEnabled: true,
            // myLocationEnabled: true,
            buildingsEnabled: false,
            scrollGesturesEnabled: true,
            zoomGesturesEnabled: true,
            trafficEnabled: true,
            initialCameraPosition: CameraPosition(
              target: sourcePosition == null ? LatLng(31.2447917,
                  29.9740327) : LatLng(sourcePosition!.latitude,
                  sourcePosition!.longitude),
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
                  width: 5)
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
          Positioned(bottom: 10,left: 10 ,child: FloatingActionButton(onPressed: (){
            print(sourcePosition!.longitude);
            print(sourcePosition!.latitude);
            controller!.animateCamera(
                CameraUpdate.newCameraPosition(
                    CameraPosition(
                      target: LatLng(sourcePosition!.latitude, sourcePosition!.longitude),
                      zoom: 18,)));},child: Icon(Icons.my_location,color: Colors.black,),elevation: 0,backgroundColor: Colors.white,)),
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
            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
            child: Column(
              children: [
                Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(3.w)),
                    padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
                    child: Row(
                      children: [
                         CircleAvatar(
                          radius: 3.h,
                          backgroundColor: Color(0xffA2A2A2),
                          child: Image.network(
                            '${loginData.image}',
                            fit: BoxFit.fill,
                            height: 30.h,
                            width: 30.h,
                            errorBuilder: (context,object,skipTrace){
                              return
                                Icon(
                                  Icons.person,
                                  size: 52.dp,
                                  color: const Color(0xffA2A2A2),
                                );
                            },
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 3.w, vertical: 1.h),
                          decoration: BoxDecoration(
                              color: const Color(0xffFF6A03),
                              borderRadius: BorderRadius.circular(20)),
                          child: InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>DataCheckScreen()));
                            },
                            child: Row(
                              children: [
                                const Text(
                                  'Online',
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(
                                  width: 1.5.w,
                                ),
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 2.5.w,
                                  child: CircleAvatar(
                                    backgroundColor: const Color(0xffFF6A03).withOpacity(0.5),
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
                      padding:
                      EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.5.h),
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
                                style: TextStyle(color: Color(0xff646363)),
                              ),
                              Text(
                                '\$250',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15.dp),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding:
                      EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
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
                                '10',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15.dp),
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
                // CircleAvatar(
                //   radius: 19.5.w,
                //   backgroundColor: Colors.white,
                //   child: Padding(
                //     padding: EdgeInsets.symmetric(vertical: 3.0.h),
                //     child: Column(
                //       children: [
                //         Icon(
                //           Icons.hourglass_top,
                //           color: const Color(0xffFF6A03),
                //           size: 30.dp,
                //         ),
                //         SizedBox(
                //           height: 0.6.h,
                //         ),
                //         Text(
                //           '30',
                //           style: TextStyle(
                //               color: const Color(0xffFF6A03), fontSize: 25.dp),
                //         ),
                //         Text(
                //           'Seconds',
                //           style: TextStyle(
                //               color: const Color(0xff808080), fontSize: 16.dp),
                //         )
                //       ],
                //     ),
                //   ),
                // ),
                const Spacer(),
                // ElevatedButton(
                //   child: const Text('Change location state (for UI)'),
                //   onPressed: () {
                //     showDialog(
                //         context: context,
                //         builder: (context) => StatefulBuilder(
                //           builder: (context, setState) {
                //             return Theme(
                //               data: ThemeData(
                //                   dialogBackgroundColor: Colors.white),
                //               child: Dialog(
                //                 elevation: 0,
                //                 child: Stack(
                //                   clipBehavior: Clip.none,
                //                   alignment: Alignment.topCenter,
                //                   children: [
                //                     SizedBox(
                //                       height: 28.h,
                //                       width: double.infinity,
                //                       child: Column(
                //                         mainAxisAlignment:
                //                         MainAxisAlignment.center,
                //                         children: [
                //                           Text(
                //                             'You\'re offline',
                //                             style: TextStyle(
                //                                 fontWeight: FontWeight.bold,
                //                                 fontSize: 18.dp,
                //                                 color: const Color(0xff646363)),
                //                           ),
                //                           SizedBox(
                //                             height: 1.h,
                //                           ),
                //                           Text(
                //                             'Go online to accept jobs.',
                //                             style: TextStyle(
                //                                 fontSize: 15.dp,
                //                                 color: const Color(0xff646363)),
                //                             textAlign: TextAlign.center,
                //                           ),
                //                           SizedBox(
                //                             height: 1.5.h,
                //                           ),
                //                           const Divider(),
                //                           SizedBox(
                //                             height: 1.5.h,
                //                           ),
                //                           Switch(
                //                               trackOutlineColor:
                //                               MaterialStateProperty.all(
                //                                   Colors.transparent),
                //                               activeTrackColor:
                //                               const Color(0xffFF6A03),
                //                               inactiveTrackColor:
                //                               const Color(0xffD1D1D6),
                //                               inactiveThumbColor: Colors.white,
                //                               value: light,
                //                               onChanged: (bool value) {
                //                                 setState(() {
                //                                   light = value;
                //                                 });
                //                               }),
                //                         ],
                //                       ),
                //                     ),
                //                     Positioned(
                //                       top: -50,
                //                       child: CircleAvatar(
                //                         backgroundColor: Colors.white,
                //                         radius: 40,
                //                         child: Image.asset(
                //                           'assets/images/notification_offline.png',
                //                           width: 12.w,
                //                         ),
                //                       ),
                //                     )
                //                   ],
                //                 ),
                //               ),
                //             );
                //           },
                //         ));
                //   },
                // ),
                SizedBox(
                  width: 80.w,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffFF6A03)),
                      onPressed: () {
                        if (light == true){
                          acceptDeclineShowModalSheet(context);
                          //&& showDialog closed
                        }
                        else{
                          showDialog(
                            context: context,
                            builder: (context) => StatefulBuilder(
                              builder: (context, setState) {
                                return Theme(
                                  data: ThemeData(
                                      dialogBackgroundColor: Colors.white),
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
                                            MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'You\'re offline',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18.dp,
                                                    color: const Color(0xff646363)),
                                              ),
                                              SizedBox(
                                                height: 1.h,
                                              ),
                                              Text(
                                                'Go online to accept jobs.',
                                                style: TextStyle(
                                                    fontSize: 15.dp,
                                                    color: const Color(0xff646363)),
                                                textAlign: TextAlign.center,
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
                                                  WidgetStateProperty.all(
                                                      Colors.transparent),
                                                  activeTrackColor:
                                                  const Color(0xffFF6A03),
                                                  inactiveTrackColor:
                                                  const Color(0xffD1D1D6),
                                                  inactiveThumbColor: Colors.white,
                                                  value: light,
                                                  onChanged: (bool value) {
                                                    setState(() {
                                                      light = value;
                                                      showDialogBool = value;

                                                      if(showDialogBool == true){
                                                        Navigator.of(context).pop();
                                                      }

                                                      acceptDeclineShowModalSheet(context);
                                                    });
                                                  }),
                                            ],
                                          ),
                                        ),
                                        Positioned(
                                          top: -50,
                                          child: CircleAvatar(
                                            backgroundColor: Colors.white,
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
                        'Find Jobs',
                        style: TextStyle(color: Colors.white),
                      )),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}


void acceptDeclineShowModalSheet(BuildContext context) {
  showModalBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(23), topRight: Radius.circular((23))),
    ),
    context: context,
    builder: (context) => Column(
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
              const Text(
                '5 mins away',
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
                    children: [
                      Text(
                        'Nader Nabil',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.dp),
                      ),
                      Text(
                        'Cash Payment',
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
                          '481 Eighth Avenue, Hell\'s Kitchen,\nNew York, NY 10001 , United Statessssssssssssssssssssss',
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
                                      borderRadius: BorderRadius.circular(10.dp),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.withOpacity(0.4),
                                            spreadRadius: 10,
                                            blurRadius: 10,
                                            offset: const Offset(0, 7))
                                      ]),
                                  child: Padding(
                                    padding: EdgeInsets.all(6.dp),
                                    child: const Text(
                                      '10 mins trip',
                                      style: TextStyle(color: Color(0xff808080)),
                                    ),
                                  ),
                                )),
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(left: 50.w),
                              width: 80.w,
                              height: 0.2.h,
                              decoration: const BoxDecoration(color: Colors.black
                                  //0xffE2E2E2
                                  ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        // Divider(
                        //   height: 5.h,
                        //   color: Color(0xffE2E2E2),
                        // ),
                        Text(
                          'The New Yorker, A Wyndham Hotel',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 13.dp),
                        )
                      ],
                    ),
                  )
                ],
              ), // same Row as in collect cash screen
              SizedBox(
                height: 8.h,
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePageMapsScreen()));
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const CustomerLocationMapsScreen()));
                        },
                        child: const Text(
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
