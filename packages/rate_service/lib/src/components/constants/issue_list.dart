import 'package:flutter/material.dart';
import 'package:rate_service/src/components/issue_buttons.dart';

Widget issueCardSection(BuildContext context) {
  List<String> mainIssue = [
    'Wrong pin location',
    'Illegal driving',
    'Improper remarks',
    'Distracted by phone',
    'Cash payment issue'
  ];
  return Wrap(
      alignment: WrapAlignment.center,
      spacing: 4.0,
      runSpacing: 8.0,
      children: List.generate(
        mainIssue.length,
        (index) => mainIssueButton(mainIssue[index]),
      ),
  );
}

Widget issueCard(BuildContext context, List<String> genericList) {

  return Wrap(
    alignment: WrapAlignment.start,
    spacing: 4.0,
    runSpacing: 8.0,
    children: List.generate(
      genericList.length,
          (index) => categoryIssueButton(genericList[index]),
    ),
  );
}