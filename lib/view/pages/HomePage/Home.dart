import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:voo_app/Controller/Constants.dart';
import 'package:voo_app/Model/LoginDataModel.dart';
import '../history _screen/history_screen.dart';
import '../main_profile_screen/main_profile_screen.dart';
import 'home_page_maps_screen.dart';

class HomePageMapsScreen extends StatefulWidget {
  const HomePageMapsScreen({super.key});

  @override
  State<HomePageMapsScreen> createState() => _HomePageMapsScreenState();
}

class _HomePageMapsScreenState extends State<HomePageMapsScreen> {
  void _showBackDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Directionality(
          textDirection: TextDirection.ltr,
          child: AlertDialog(
            elevation: 0,
            backgroundColor: Colors.white,
            title: const Text('Exit Application'),
            content: const Text(
              'Are you sure you want to exit the application?',
              style: TextStyle(color: Colors.black),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('No'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              TextButton(
                child: const Text('Yes'),
                onPressed: () {
                  SystemNavigator.pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
  int currentIndex = 0;
  bool light = true;
  bool showDialogBool = false;

  List<Widget> screens = [
    HomePage(),
    HistoryScreen(),
    MainProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _initTrackingSDK(loginData, context);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (didPop) {
          return;
        }
        if (currentIndex != 0) {
          setState(() {
            currentIndex = 0;
          });
        } else {
          _showBackDialog(context);
        }
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
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
      ),
    );
  }

  void _initTrackingSDK(LoginDataModel loginData, BuildContext context) {
    var sdkChannel = MethodChannel(FAIRMATIC_CHANNEL);
    sdkChannel.invokeMethod("setup", {
      "driver_name": "${loginData.firstName} ${loginData.lastName}",
      "driver_id": loginData.userId,
      "driver_phone": loginData.phone,
    });
  }
}
