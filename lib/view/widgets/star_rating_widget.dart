import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

typedef RatingChangeCallback = void Function(double rating);

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating;
  final RatingChangeCallback? onRatingChanged;
  final Color? color;

  const StarRating(
      {super.key, this.starCount = 5, this.rating = .0, this.onRatingChanged, this.color});

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = Icon(
        Icons.star_border,
        color: Colors.red,
        size: 10.w,
      );
    } else if (index > rating - 1 && index < rating) {
      icon = Icon(
        Icons.star_half,
        color: color ?? Colors.blue,
        size: 10.w,
      );
    } else {
      icon = Icon(
        Icons.star,
        color: color ?? Colors.red,
        size: 10.w,
      );
    }
    return InkResponse(
      onTap:
          onRatingChanged == null ? null : () => onRatingChanged!(index + 1.0),
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        children:
            List.generate(starCount, (index) => buildStar(context, index)));
  }
}
