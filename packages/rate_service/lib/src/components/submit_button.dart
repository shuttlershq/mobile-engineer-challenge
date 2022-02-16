import 'package:flutter/material.dart';

Widget generalButton(BuildContext context,
    Color color,
    String? text,
    Color textColor
    ) {
  return SizedBox(
      width: MediaQuery.of(context).size.width * 0.85,
      height: MediaQuery.of(context).size.height* 0.085,
      child: Card(
        elevation: 0,
        color: color,
        child: Center(
          child: Text(
            '$text',
            style: TextStyle(color: textColor),
          ),
        ),
      ),
  );
}
