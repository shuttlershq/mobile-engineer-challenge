import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trip_rating/ratings/app/assets/colors.dart';
import 'package:trip_rating/ratings/app/assets/image_assets.dart';
import 'package:trip_rating/ratings/app/assets/strings.dart';
import 'package:trip_rating/ratings/views/widgets/rating_buttons.dart';

const TextStyle appTextStyle = TextStyle(
  fontFamily: "heebo",
  fontWeight: FontWeight.w400,
  fontSize: 16,
  color: RatingColors.blackColor,
);

Widget clickWidget({Widget child = const SizedBox(), VoidCallback? onTap}) {
  return InkWell(
    onTap: onTap,
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    focusColor: Colors.transparent,
    hoverColor: Colors.transparent,
    child: child,
  );
}

List<Map> testData = [
  {
    "name": "Driver",
    "icon": ImageAssets.driverIcon,
    "items": [
      "Unprofessional Driving",
      "Rude driver",
      "Overspeeding",
      "Untidy Driver",
    ],
  },
  {
    "name": "Vehicle",
    "icon": ImageAssets.sBusIcon,
    "items": [
      "Unprofessional Car",
      "Rude Car",
      "Overspeeding Car",
      "Untidy Car",
    ],
  },
  {
    "name": "Marshals",
    "icon": ImageAssets.userIcon,
    "items": [
      "Unprofessional Marshals",
      "driver Marshals",
      "Overspeeding Marshals",
      "Untidy Driver Marshals",
    ],
  },
];

dynamic showModal(BuildContext ctx, bool statisfied) async {
  var a = await showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: ctx,
    builder: (context) => Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppString.thankYou,
            textAlign: TextAlign.center,
            style: appTextStyle.copyWith(
                fontWeight: FontWeight.w700, fontSize: 18),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            statisfied ? AppString.pleasant : AppString.unpleasant,
            textAlign: TextAlign.center,
            style: appTextStyle.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 15,
              color: RatingColors.inActiveTextColor,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          clickWidget(
            onTap: () => Navigator.pop(context),
            child: RatingsButton(
              isDone: true,
              child: Text(
                AppString.close,
                textAlign: TextAlign.center,
                style: appTextStyle.copyWith(
                    fontWeight: FontWeight.w700, fontSize: 14),
              ),
            ),
          )
        ],
      ),
      height: 250,
    ),
  );

  return a;
}
