import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:voo_app/view/pages/splash_screen.dart';

import 'Controller/Login/login_cubit.dart';
import 'Controller/dio-helper.dart';
import 'Controller/shared-prefrences.dart';




void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  CacheHelper.init();
  await CacheHelper.init();
  ErrorWidget.builder = (FlutterErrorDetails details) => Material(
    child: Center(
      child: Container(
        child: Text('There is an Error'),
      ),
    ),

  );
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
        // BlocProvider(create: (context)=> DataCubit()),
      ],
      child: FlutterSizer(
        builder: (BuildContext, Orientation, ScreenType) {
          return MaterialApp(
            //theme: ThemeData(useMaterial3: true),
            home: SplashScreen(),
            debugShowCheckedModeBanner: false,
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
