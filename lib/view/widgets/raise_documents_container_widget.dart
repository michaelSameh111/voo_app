import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

// ignore: must_be_immutable
class RaiseDocumentsContainerWidget extends StatelessWidget {
  bool uploadedPicture = false;
  String text;
  final GestureTapCallback? onTap;

  RaiseDocumentsContainerWidget(
      {super.key,
      required this.uploadedPicture,
      required this.text,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Material(
        elevation: 1,
        borderRadius: BorderRadius.circular(7.dp),
        child: Container(
          padding: EdgeInsets.all(12.dp),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(7.dp),
              border: Border.all(color: const Color(0xffECECEC))),
          child: Row(
            children: [
              Icon(
                Icons.check_circle,
                color: uploadedPicture ? Colors.green : const Color(0xffA2A2A2),
                size: 18.dp,
              ),
              SizedBox(
                width: 2.w,
              ),
              Text(
                text,
                style: TextStyle(fontSize: 15.dp),
              ),
              const Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                color: const Color(0xff808080),
                size: 14.dp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
