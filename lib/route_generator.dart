import 'package:driver_rate_example/views/error_screen.dart';
import 'package:driver_rate_example/views/my_trips.dart';
import 'package:flutter/material.dart';

class RouteGenerator {

  static Route<dynamic>  generateRoute(RouteSettings settings){
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const MyTrips());

    }
    return MaterialPageRoute(builder: (_) =>const ErrorScreen());
  }

}