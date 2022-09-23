import 'package:flutter/material.dart';
import 'package:trip_rating/ratings/src/views/rating_ui.dart';

class RatingsView {
  RatingsView._();

  /// this initializes your rating view as a singleton
  static final RatingsView instance = RatingsView._();

  /// This method calls the UI for rating drivers
  ///
  /// * [BuildContext] - is a required parameter
  ///
  /// * [driverName] - this takes in the name of the driver and it is required
  ///
  /// * [routeCode] - this is the route code and this is required
  ///
  /// * [image] - this is the image of the driver and it is optional
  ///
  /// * [vehicleType] - this is the vehicle type is is required
  ///
  /// * [plateNumber] - this is the plate number of the vehicle and it is required
  ///
  ///
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
