import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:voo_app/view/widgets/main_elevated_button.dart';

class RateRiderScreen extends StatefulWidget {
  const RateRiderScreen({super.key});

  @override
  State<RateRiderScreen> createState() => _RateRiderScreenState();
}

class _RateRiderScreenState extends State<RateRiderScreen> {
  double _rating = 2.5;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 5.h,
              ),
              Text(
                'Rate Rider',
                style: TextStyle(
                  fontSize: 18.dp,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              CircleAvatar(
                radius: 12.w,
                backgroundColor: const Color(0xffA2A2A2),
                child: Icon(
                  Icons.person,
                  size: 15.w,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                'Shady Mark',
                style: TextStyle(fontSize: 15.dp, fontWeight: FontWeight.bold),
              ),
              //SizedBox(height: 2.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '\$15.00',
                    style: TextStyle(fontSize: 15.dp, color: const Color(0xff808080)),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 1.5.w,
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Text(
                    '12 Miles',
                    style: TextStyle(fontSize: 15.dp, color: const Color(0xff808080)),
                  ),
                ],
              ),
              SizedBox(
                height: 3.5.h,
              ),
              Text(
                'How was your trip with',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.dp),
              ),
              Text(
                'Shady Mark',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.dp),
              ), //name of the rider
              SizedBox(
                height: 3.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: const Divider(
                  color: Color(0xffECECEC),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Text(
                'Your Overall Rating',
                style: TextStyle(
                    fontSize: 16.dp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff808080)),
              ),
              SizedBox(
                height: 1.h,
              ),
              AnimatedRatingStars(
                initialRating: 2.5,
                onChanged: (rating) {
                  setState(() {
                    _rating = rating;
                    //print('Rating : $rating');
                  });
                },
                customFilledIcon: Icons.star,
                customHalfFilledIcon: Icons.star_half,
                customEmptyIcon: Icons.star_border,
                interactiveTooltips: true,
                filledColor: Color(0xffFF6A03),
              ),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 2.h),
              //   child: StarRating(rating: rating, color: Colors.red,
              //   onRatingChanged: (rating) => setState (() => this.rating = rating),
              //   ),
              // )
              SizedBox(
                height: 3.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: const Divider(
                  color: Color(0xffECECEC),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 3.5.w,
                  ),
                  Text(
                    'Add Details Review',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.dp),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  maxLines: 3,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xffC4C4C4),
                          ),
                          borderRadius: BorderRadius.circular(8.dp))),
                ),
              ),
              SizedBox(height: 3.h,),
              MainElevatedButton(
                  nextScreen: const RateRiderScreen(),
                  text: ('Submit'),
                  backgroundColor: const Color(0xffFF6A03)),
              SizedBox(height: 4.h,),
            ],
          ),
        ),
      ),
    );
  }
}
