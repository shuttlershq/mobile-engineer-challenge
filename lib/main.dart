import 'package:driver_rate_example/model/driver_model.dart';
import 'package:driver_rate_example/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      title: 'Flutter Demo',
      theme: ThemeData(),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
