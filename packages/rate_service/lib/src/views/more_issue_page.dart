import 'package:flutter/material.dart';
import 'package:rate_service/src/components/constants/category_list.dart';
import 'package:rate_service/src/components/constants/color.dart';
import 'package:rate_service/src/components/constants/issue_list.dart';
import 'package:rate_service/src/components/constants/text_style_constant.dart';
import 'package:rate_service/src/components/generic_alertbox.dart';
import 'package:rate_service/src/components/more_issue_section.dart';
import 'package:rate_service/src/components/submit_button.dart';

class MoreIssuePage extends StatefulWidget {
  const MoreIssuePage({Key? key}) : super(key: key);

  @override
  _MoreIssuePageState createState() => _MoreIssuePageState();
}

class _MoreIssuePageState extends State<MoreIssuePage> {

  bool isClicked = false;
  bool isVehicle = false;
  bool isDrivingBehaviour = false;
  bool isNavigation = false;
  bool isPickUpDropOff= false;
  bool isPayment = false;
  bool isHealthHygiene = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.clear_rounded,
            size: 25, color: RateServiceColor.textColor,
          ),
        ),
        title: Text('More driver and tip issues',
          style: kHeaderSmallFont,
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 20),
              child: Column(
                children: [
                  //DangerousDriving
                  moreIssueStructure(context, Icons.sports_basketball_outlined, 'Dangerous Driving',
                      isClicked, (){ setState(() {isClicked = !isClicked;});}
                      ),
                  isClicked?issueCard(context, dangerousDriving): Container(),
                  //Vehicle
                  SizedBox(height: MediaQuery.of(context).size.height*0.06,),
                  moreIssueStructure(context, Icons.directions_car_filled_outlined, 'Vehicle',
                      isVehicle, (){ setState(() {isVehicle = !isVehicle;});}
                      ),
                  isVehicle?issueCard(context, vehicle): Container(),
                  //Driving Behaviour
                  SizedBox(height: MediaQuery.of(context).size.height*0.06,),
                  moreIssueStructure(context, Icons.perm_identity_rounded, 'Driving behaviour',
                      isDrivingBehaviour, (){ setState(() {isDrivingBehaviour = !isDrivingBehaviour;});}
                  ),
                  isDrivingBehaviour?issueCard(context, driverBehaviour): Container(),
                  //Navigation
                  SizedBox(height: MediaQuery.of(context).size.height*0.06,),
                  moreIssueStructure(context, Icons.navigation_outlined, 'Navigation',
                      isNavigation, (){ setState(() {isNavigation = !isNavigation;});}
                  ),
                  isNavigation?issueCard(context, navigation): Container(),
                  //Pickup/Pickoff
                  SizedBox(height: MediaQuery.of(context).size.height*0.06,),
                  moreIssueStructure(context, Icons.location_on_outlined, 'Pick-up/Drop-off',
                      isPickUpDropOff, (){ setState(() {isPickUpDropOff = !isPickUpDropOff;});}
                  ),
                  isPickUpDropOff?issueCard(context, pickupDropOff): Container(),
                  //Payment
                  SizedBox(height: MediaQuery.of(context).size.height*0.06,),
                  moreIssueStructure(context, Icons.credit_card_rounded, 'Payment issues',
                      isPayment, (){ setState(() {isPayment = !isPayment;});}
                  ),
                  isPayment?issueCard(context, paymentIssue): Container(),
                  //Health and Hygiene
                  SizedBox(height: MediaQuery.of(context).size.height*0.06,),
                  moreIssueStructure(context, Icons.sanitizer_outlined, 'Health and Hygiene',
                      isHealthHygiene, (){ setState(() {isHealthHygiene = !isHealthHygiene;});}
                  ),
                  isHealthHygiene?issueCard(context, healthAndHygiene): Container(),

                ],
              ),
            ),
          ),
          Positioned(
            right: 25,
            bottom: 10,
              child: GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return genericAlertBox(context, 'Issue has Sent',
                            'We will start working on it immediately to improve our service'
                        );
                      }
                  );
                },
                  child: generalButton(context, Colors.black, 'Done', Colors.white),
              ),
          ),
        ],
      ),
    );
  }
}
