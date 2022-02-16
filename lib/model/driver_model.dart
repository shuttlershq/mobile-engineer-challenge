import 'package:flutter/material.dart';

class DriverModel with ChangeNotifier {
  String? id;
  String? driverName;
  String? imgUrl;
  double? cost;
  String? time;
  num? ratings;
  String? issues;
  String? address;

  DriverModel({
    @required this.id,
    @required this.driverName,
    @required this.imgUrl,
    this.cost,
    this.time,
    this.ratings,
    this.issues,
    this.address
});

  int tappedIndex = -1;

  void tappedState(index){
    tappedIndex = index;
    notifyListeners();
  }
}


List<DriverModel> allDriver =[
  DriverModel(
      id: '1',
      driverName: 'James Bond',
      imgUrl: 'images/malepic.jpg',
      cost: 17.00,
      ratings: 2,
      time: '30 : 22',
      address: 'No 7 Gbinje close newlayout junction, delta'
  ),
  DriverModel(
    id: '2',
    driverName: 'Micheal Brown',
    imgUrl: 'images/driver1.jpg',
    cost: 17.00,
    ratings: 3,
    time: '30 : 22',
       address: '111 almarence plaza jefia estate'
  ),
];