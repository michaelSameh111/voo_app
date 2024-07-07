import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:voo_app/Controller/Data/data_cubit.dart';
import 'package:voo_app/Controller/Firebase%20Notifications.dart';
import 'package:voo_app/firebase_options.dart';
import 'package:voo_app/view/pages/splash_screen.dart';
import 'Controller/Login/login_cubit.dart';
import 'Controller/dio-helper.dart';
import 'Controller/shared-prefrences.dart';
import 'package:google_maps_flutter_android/google_maps_flutter_android.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';



final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() async{
  final GoogleMapsFlutterPlatform mapsImplementation =
      GoogleMapsFlutterPlatform.instance;
  if (mapsImplementation is GoogleMapsFlutterAndroid) {
    mapsImplementation.useAndroidViewSurface = true;
  }

  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseNotifications().initNotifications();
  await FirebaseNotifications().handleBackgroundNotifications();
  CacheHelper.init();
  ErrorWidget.builder = (FlutterErrorDetails details) => const Material(
    child: Center(
      child: Text('There is an Error'),
    ),

  );
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));
  Bloc.observer =MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> LoginCubit()),
        BlocProvider(create: (context)=> DataCubit()),
      ],
      child: FlutterSizer(
        builder: (buildContext, orientation, screenType) {
          return MaterialApp(
            navigatorKey: navigatorKey,
            home: const SplashScreen(),
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              appBarTheme: AppBarTheme(color: Colors.transparent,elevation: 0),
              useMaterial3: false,primaryColor: Color(0xffFF6A03),
              colorScheme: ColorScheme.light(
                primary: Color(0xffFF6A03),
                onPrimary: Colors.white,
                surface: Colors.white,
                onSurface: Colors.black,
              ),
              datePickerTheme: DatePickerThemeData(
                  headerBackgroundColor: Color(0xffFF6A03),
                  headerForegroundColor: Colors.white,
                  dividerColor: Colors.transparent
              ),
            ),
          );
        },
      ),
    );
  }
}

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    print('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('onChange -- ${bloc.runtimeType}, $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('onError -- ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    print('onClose -- ${bloc.runtimeType}');
  }
}
