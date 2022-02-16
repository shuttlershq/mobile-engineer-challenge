import 'package:flutter/material.dart';
import 'package:rate_service/src/components/constants/text_style_constant.dart';
import 'package:rate_service/src/views/issue_bottom_sheet.dart';

Widget chooseIssueSection(BuildContext context){
  return Column(
    children: [
      Text('Select an issue',
        style: kHeaderFont,
      ),
      const SizedBox(height: 10,),
      GestureDetector(
        onTap: (){
          Navigator.pop(context);

          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (_){
                return const issueBottomSheet();
              }
          );
        },
        child: Text('Choose up to 5 issues',
          style: kRedSubtitle,
        ),
      )
    ],
  );
}