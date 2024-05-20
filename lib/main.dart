import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:voo_app/Controller/Data/data_cubit.dart';
import 'package:voo_app/view/pages/social_security_screen.dart';
import 'Controller/Login/login_cubit.dart';
import 'Controller/dio-helper.dart';
import 'Controller/shared-prefrences.dart';




void main() async{
  // A5oya Mo7a haktblk b3d kol line by3ml eh
  WidgetsFlutterBinding.ensureInitialized();
  // Lama bt3ml init le 7agat fel main lazem tktb el line beta3 ensure Initialized dh
  DioHelper.init();
  // Bensha8al el DIO .. elly howa bngeb meno el data mel API
  CacheHelper.init();
 //  Bensha8al el shared prefrences .. 3ashan law fe remember me .. aw 7aga fe local storage
  ErrorWidget.builder = (FlutterErrorDetails details) => Material(
    child: Center(
      child: Container(
        child: Text('There is an Error'),
      ),
    ),

  );
  // deh lama ykon fe error mesh hytl3 el shasha el 7amra .. hayetla3 shasha maktob feha Error we 5las
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
        builder: (BuildContext, Orientation, ScreenType) {
          return MaterialApp(

            home: SocialSecurityScreen(),
            debugShowCheckedModeBanner: false,
            theme: ThemeData(useMaterial3: false),
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
// dh 7aga esmaha BlocObserver .. 3ashan ab2a 3aref ana fe anhy state (law mesh fahem now 3ady)
