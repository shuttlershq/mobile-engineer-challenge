# driver_rate_example

This Flutter project makes use of a <i>custom package</i> - <b>rate_service</b> that manages driver rating and issue reporting. It demonstrates the implementation of this package: an interactive module that helps users rate drivers on a five star scale with provision to report issues for the ride. Click [here](https://github.com/Uditega/rate_service_example/blob/main/packages/rate_service/Oghenetega_udi.md) for more on <b>RATE SERVICE</b>

## Preview

| Rating Page |
| :--------------: |
| ![](https://user-images.githubusercontent.com/75682687/154319917-b914dda4-29e7-4d34-bf7d-732e72d2282e.jpg) |

## Installation

For this version, pull the package into your project.

In your `pubspec.yaml` file within your Flutter Project:

```yaml
dependencies:
 rate_service: <path_to_package>
```

## Use it

```dart
import 'package:flutter/material.dart';
import 'package:rate_service/rate_service.dart';
import 'package:driver_rate_example/model/driver_model.dart';
 
Widget regularButton(BuildContext context,
  double? height,
  double? width,
  Color color,
  String? text,
  DriverModel driver
  ){
return SizedBox(
  height: MediaQuery.of(context).size.height *height!,
  width: MediaQuery.of(context).size.width *width!,
  child: GestureDetector(
    onTap: (){
      showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (_){
            return RateService(
              id: driver.id,
              imgUrl: driver.imgUrl,
              driverName: driver.driverName,
              address: driver.address,
              ratings: driver.ratings,
            );
          }
      );
    },
    child: Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
      ),
      elevation: 0,
      color: color,
      child:  Center(
        child: Text('$text',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontFamily: 'Poppins_Regular',
            decoration: TextDecoration.none,
          ),
        ),
      ),
    ),
  ),
);
}
```

## Dependencies
- [x] HexColor package
- [x] Provider package
- [x] Rate Service Package [oghenetega_udi.md](https://github.com/Uditega/rate_service_example/blob/main/packages/rate_service/Oghenetega_udi.md)

