import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
//ignore_for_file: must_be_immutable
class MainElevatedButton extends StatelessWidget {

  Widget nextScreen;
  String text;
  Color backgroundColor;
  bool? circularBorder;
  bool? removeRoutes;
  MainElevatedButton({
    this.circularBorder,
    this.removeRoutes,
    required this.nextScreen,
    required this.text,
    required this.backgroundColor
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80.w,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
              shape: circularBorder == true  ? RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
              ) : null,
              backgroundColor: backgroundColor),
          onPressed: () {
            if(removeRoutes == true){
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => nextScreen),
                    (route) => false,
              );
            }else { Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => nextScreen));}

          },
          child: Container(
            child: Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
          )),
    )
    ;
  }
}
class MainElevatedButtonTwo extends StatelessWidget {
  final VoidCallback? onPressed;
  String text;
  Color backgroundColor;
  bool? condition;
  bool? circularBorder;

  MainElevatedButtonTwo({
    this.circularBorder,
    required this.onPressed,
    required this.text,
    required this.backgroundColor,
    this.condition
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80.w,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 0,
              shape: circularBorder == true  ? RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
              ) : null,
              backgroundColor: backgroundColor),
          onPressed: onPressed,
          child: Container(
            child:condition == true ? const Center(child: CircularProgressIndicator(color: Colors.white,)) : Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
          )),
    )
    ;
  }
}
