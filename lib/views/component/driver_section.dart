import 'package:driver_rate_example/model/driver_model.dart';
import 'package:driver_rate_example/views/component/button.dart';
import 'package:driver_rate_example/views/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:driver_rate_example/views/constants/text_style_constants.dart';

Widget driverSection(BuildContext context,
    DriverModel driver,
    ){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        width: MediaQuery.of(context).size.width*1,
        height: MediaQuery.of(context).size.height*0.25,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                blurRadius: 10,
              ),
            ]
        ),
        child: Column(
          children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(driver.imgUrl!,
                            height: MediaQuery.of(context).size.height * 0.08,
                            width: MediaQuery.of(context).size.width * 0.16,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width:  MediaQuery.of(context).size.width* 0.03,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width*0.28,
                              child: Text(driver.driverName!,
                                overflow: TextOverflow.ellipsis,
                                style: kHeaderFont,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(Icons.star,
                                size: 12, color: Colors.amber,
                                ),
                                Text(driver.ratings!.toString(),
                                  style: TextStyle(color: RateDriverColor.grey, fontSize: 11),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Final cost',
                              style: TextStyle(color: RateDriverColor.grey, fontSize: 13),
                            ),
                            Text(driver.cost!.toString(),
                              style: TextStyle(color: RateDriverColor.textColor, fontSize: 11),
                            ),
                          ],
                        ),
                        SizedBox(
                          width:  MediaQuery.of(context).size.width* 0.06 ,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Time',
                              style: TextStyle(color: RateDriverColor.grey, fontSize: 13),
                            ),
                            Text(driver.time.toString(),
                              style: TextStyle(color: RateDriverColor.textColor, fontSize: 11),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                child: Divider(
                  color: RateDriverColor.grey,
                ),
              ),
            regularButton(context, 0.08, 0.8, RateDriverColor.lightBlue, 'Rate Driver', driver),
              // GestureDetector(
              //   onTap: (){
              //
              //   },
              //   child:
              // ),
          ],
        ),
      ),
     const SizedBox(
        height: 25,
      ),
    ],
  );
}