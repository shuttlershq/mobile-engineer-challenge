import 'package:driver_rate_example/model/driver_model.dart';
import 'package:driver_rate_example/views/component/driver_section.dart';
import 'package:driver_rate_example/views/constants/text_style_constants.dart';
import 'package:flutter/material.dart';

class MyTrips extends StatelessWidget {
  const MyTrips({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text('My Trips',
          style: appbarTextStyle,
        ),
      ),
      body: Column(
        children: [
          SizedBox(
           height: MediaQuery.of(context).size.height*0.85,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
              child: ListView.builder(
                itemCount: allDriver.length,
                  itemBuilder: (ctx, index){
                    return driverSection(context,
                        allDriver[index],
                        // allDriver[index].driverName,
                        // allDriver[index].ratings,
                        // allDriver[index].cost,
                        // allDriver[index].time,
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
