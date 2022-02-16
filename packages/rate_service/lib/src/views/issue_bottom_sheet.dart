import 'package:flutter/material.dart';
import 'package:rate_service/src/components/constants/color.dart';
import 'package:rate_service/src/components/constants/issue_list.dart';
import 'package:rate_service/src/components/constants/text_style_constant.dart';
import 'package:rate_service/src/components/submit_button.dart';
import 'package:rate_service/src/views/more_issue_page.dart';

class issueBottomSheet extends StatelessWidget {
  const issueBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Text('Rate or tip',
              style: kHeaderSmallFont,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.07,
              child: const Divider(color: Colors.grey, thickness: 2,),
            ),
            Text('Select an issue',
              style: kHeaderFont,
            ),
            const SizedBox(height: 10,),
            Text('Choose up to 5 issues',
              style: kRedSubtitle,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.025),
            issueCardSection(context),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: (){
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (builder)=>  const MoreIssuePage())
                );

              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('More Issue',
                    style: kHeaderSmallFont,
                  ),
                  const SizedBox(width: 10),
                  Icon(Icons.arrow_forward_ios_rounded,
                    size: 12, color: RateServiceColor.textColor,
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1,
              child: const Divider(color: Colors.grey, thickness: 3,),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Tipping isn\'t available for this payment method ',
                  style: kRedSubtitle,
                  children: [
                    TextSpan(text: 'To add tips for drivers. please',
                      style: kGreySubtitle,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02,
            ),
            generalButton(context, Colors.grey.shade300, 'Submit', Colors.white),
          ],
        ),
      ),
    );
  }
}

