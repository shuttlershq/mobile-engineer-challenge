import 'package:flutter/material.dart';
import 'package:trip_rating/ratings/src/views/rating_ui.dart';

class RatingsView {
  RatingsView._();
  static final RatingsView instance = RatingsView._();

  void rate(BuildContext ctx,
      {String? driverName,
      String? routeCode,
      String? image,
      String? vehicleType,
      String? plateNumber}) {
    Navigator.push(
      ctx,
      MaterialPageRoute(
        builder: (_) => RatingsViewUi(
          driverName: driverName,
          routeCode: routeCode,
          image: image,
          vehicleType: vehicleType,
          plateNumber: plateNumber,
        ),
      ),
    );
  }
}
