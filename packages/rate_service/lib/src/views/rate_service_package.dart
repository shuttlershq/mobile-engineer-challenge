import 'package:flutter/material.dart';
import 'package:rate_service/src/components/choose_issue_section.dart';
import 'package:rate_service/src/components/constants/text_style_constant.dart';
import 'package:rate_service/src/components/generic_alertbox.dart';
import 'package:rate_service/src/components/ratings_section.dart';
import 'package:rate_service/src/components/submit_button.dart';


class RateService extends StatefulWidget {
   RateService({Key? key,
     this.id,
     this.driverName,
     this.imgUrl,
     this.cost,
     this.time,
     this.ratings,
     this.issues,
     this.address
   }) : super(key: key);

   String? id;
   String? driverName;
   String? imgUrl;
   double? cost;
   String? time;
   num? ratings;
   String? issues;
   String? address;

  @override
  _RateServiceState createState() => _RateServiceState();
}

class _RateServiceState extends State<RateService> {

  int tappedIndex = -1;

  @override
  Widget build(BuildContext context) {
    List<Widget> allStars = [
      star(0, tappedIndex),
      star(1, tappedIndex),
      star(2, tappedIndex),
      star(3, tappedIndex),
      star(4, tappedIndex),
    ];

    return Container(
      height: MediaQuery.of(context).size.height*0.8,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 50),
        child: Column(
          children: [
            CircleAvatar(
              radius: 35,
              backgroundImage: AssetImage(widget.imgUrl??'images/malepic.jpg'),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.04,
            ),
            Text('Rate your trip and thank ${widget.driverName} with a tip',
              textAlign: TextAlign.center,
              style: kHeaderFont,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.01,
            ),
            Text('${widget.address}',
              style: kSubTitle,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.18,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: allStars.length,
                    itemBuilder: (context, index){
                      return GestureDetector(
                        onTap: (){
                          setState(() {
                            tappedIndex = index;
                          });
                        },
                        child: star(index, tappedIndex),
                      );
                      // return
                    }
                ),
              ),
            ),
            chooseIssueSection(context),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.06,
            ),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return genericAlertBox(context, 'Success', 'Thank you for your review');
                    }
                );
              },
                child: generalButton(context, Colors.grey.shade300, 'Submit', Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}




