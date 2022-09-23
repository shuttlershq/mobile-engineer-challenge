import 'package:flutter/material.dart';
import 'package:trip_rating/ratings/src/app/assets/colors.dart';

class RatingsButton extends StatelessWidget {
  const RatingsButton(
      {Key? key, this.isDone = false, this.child = const SizedBox()})
      : super(key: key);

  final bool isDone;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: isDone
            ? RatingColors.primaryColor
            : RatingColors.invertPrimaryColor,
      ),
      child: SizedBox(height: 20, child: child),
    );
  }
}
