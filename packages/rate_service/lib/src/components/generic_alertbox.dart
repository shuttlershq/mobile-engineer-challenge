import 'package:flutter/material.dart';
import 'package:rate_service/src/components/constants/text_style_constant.dart';

Widget genericAlertBox(BuildContext context, String? title, String? message){
  return AlertDialog(
    title: Column(
      children: [
        const CircleAvatar(
          radius: 35,
          backgroundColor: Colors.green,
          child: Icon(Icons.check_rounded,
            size: 40, color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text('$title',
        style: kAlertHeader,
        )
      ],
    ),
    content: Text('$message',
     textAlign: TextAlign.center,
      style: kSubTitle,
    ),
    actions: [
      TextButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: const Text('Ok',
            style: kAlertSubTitle,
          )
      ),
    ],
  );
}