import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voo_app/Controller/Constants.dart';
import 'package:voo_app/Controller/Data/data_cubit.dart';
import '../../widgets/HistoryWidgets.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  void initState() {
    DataCubit.get(context).getTripsHistoryData();
    DataCubit.get(context).getInProgressTripDetails();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: BlocConsumer<DataCubit, DataState>(
  listener: (context, state) {},
  builder: (context, state) {
    return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            toolbarHeight: 10.h,
            leadingWidth: 0,
            // leading: Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 2.0.w),
            //   child: InkWell(
            //     onTap: () {
            //       Navigator.pop(context);
            //     },
            //     child: Container(
            //         decoration: BoxDecoration(
            //           boxShadow: [
            //             BoxShadow(
            //               color: Colors.grey.withOpacity(0.5),
            //               spreadRadius: 1,
            //               blurRadius: 1,
            //             )
            //           ],
            //           shape: BoxShape.circle,
            //           color: Colors.white,
            //         ),
            //         child: const Icon(Icons.arrow_back,color: Colors.black,)),
            //   ),
            // ),
            title: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'History',
                  style: TextStyle(
                      fontSize: 20.dp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Divider(color: Colors.black,)
              ],
            ),
            bottom: TabBar(
              indicator: const UnderlineTabIndicator(
                borderSide: BorderSide(color: Color(0xffFF6A03), width: 2),
              ),
              labelStyle: TextStyle(color: Color(0xffFF6A03)),
              unselectedLabelColor: Color(0xff808080),
              tabs: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.h),
                  child: Text(
                    'Active',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14.8.dp),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.h),
                  child: Text(
                    'Completed',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14.8.dp),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.h),
                  child: Text(
                    'Canceled',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14.8.dp),
                  ),
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              ActiveHistoryScreen(),
              CompletedHistoryScreen(),
              CancelledHistoryScreen()
            ],
          ));
  },
),
    );
  }
}

class ActiveHistoryScreen extends StatelessWidget {
  const ActiveHistoryScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return inProgressTrip.driverInProgressTrip != null ? ListView(
      children: [InProgressWidget(
        driverInProgressTrip:inProgressTrip.driverInProgressTrip!,
      ),],
    ) : Center(child: Text("No In Progress Trip Now ",style: TextStyle(color: Color(0xffFF6A03),fontSize: 24.dp,fontWeight: FontWeight.bold),),
    );
  }
}

class CompletedHistoryScreen extends StatelessWidget {
  const CompletedHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return tripsHisotryModel == null ||
            tripsHisotryModel!.driverCompletedTrips == null ||
            tripsHisotryModel!.driverCompletedTrips!.isEmpty
        ? Center(
            child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Text(
              'We\'re looking forward to seeing your first trip! Buckle up - the roads are waiting for you.',
              style: GoogleFonts.roboto(
                  fontSize: 24.dp,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffFF6A03)),
            ),
          ))
        : ListView.builder(
            itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CompletedHistoryWidget(
                                driverCompletedTrips: tripsHisotryModel!
                                    .driverCompletedTrips![index],
                              )));
                },
                child: CompletedHistoryWidgets(
                  driverCompletedTrips:
                      tripsHisotryModel!.driverCompletedTrips![index],
                )),
            itemCount: tripsHisotryModel!.driverCompletedTrips!.length,
            physics: BouncingScrollPhysics(),
          );
  }
}

class CancelledHistoryScreen extends StatelessWidget {
  const CancelledHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return tripsHisotryModel == null ||
            tripsHisotryModel!.driverCancelledTrips == null ||
            tripsHisotryModel!.driverCancelledTrips!.isEmpty
        ? Center(
            child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Text(
              'No Cancelled Trips Yet',
              style: GoogleFonts.roboto(
                  fontSize: 24.dp,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffFF6A03)),
            ),
          ))
        : ListView.builder(
            itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CanceledHistoryWidget(
                            driverCancelledTrips: tripsHisotryModel!
                                .driverCancelledTrips![index],
                          )));
                },
                child: CanceledHistoryWidgets(
              driverCancelledTrips:
                  tripsHisotryModel!.driverCancelledTrips![index],
            )),
            itemCount: tripsHisotryModel!.driverCancelledTrips!.length,
            physics: BouncingScrollPhysics(),
          );
  }
}
