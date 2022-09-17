import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rate_service/src/components/constants/color.dart';
import 'package:rate_service/src/components/constants/text_style_constant.dart';

Widget moreIssueStructure(
    BuildContext context,
    IconData icon,
    String? text,
    bool isClicked,
    Function callBack
    ){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          Icon(icon),
          SizedBox(width:MediaQuery.of(context).size.width*0.03),
          Text('$text',
          style: kHeaderSmallFont,
          )
        ],
      ),
      GestureDetector(
        onTap: (){
          callBack();
        },
        child: Icon( isClicked? Icons.keyboard_arrow_down_rounded: Icons.keyboard_arrow_up_rounded,
          size: 25, color: RateServiceColor.textColor,
        ),
      ),
    ],
  );
}