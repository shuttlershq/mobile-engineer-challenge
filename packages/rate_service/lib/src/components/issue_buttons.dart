import 'package:flutter/material.dart';
import 'package:rate_service/src/components/constants/color.dart';
import 'package:rate_service/src/components/constants/text_style_constant.dart';

Widget mainIssueButton(String? text){
  return Card(
    elevation: 0,
    color: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
      side: BorderSide(color: RateServiceColor.greyColor),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 12),
      child: Text('$text',
       style: kIssueFont,
      ),
    ),
  );
}

Widget categoryIssueButton(String? text){
  return Card(
    elevation: 0,
    color: Colors.grey.shade400,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 12),
      child: Text('$text',
        style: kIssueFont,
      ),
    ),
  );
}