import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trip_rating/ratings/app/assets/colors.dart';
import 'package:trip_rating/ratings/app/assets/constants.dart';
import 'package:trip_rating/ratings/app/assets/strings.dart';

class FaultTile extends StatelessWidget {
  const FaultTile(
      {Key? key,
      required this.title,
      required this.items,
      required this.callback,
      required this.icon,
      required this.selected})
      : super(key: key);
  final String icon;
  final String title;
  final List<String> selected;
  final List<String> items;
  final Function(String?) callback;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(55, 0, 0, 30),
            child: Text(
              AppString.whatIs,
              style: appTextStyle.copyWith(
                  fontSize: 13,
                  color: RatingColors.inActiveTextColor,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50.0),
            child: Wrap(
              spacing: 5,
              runSpacing: 8,
              children: [
                for (var i = 0; i < items.length; i++)
                  FaultItem(
                      callback: (s) {
                        callback(s);
                      },
                      item: items[i],
                      selected: selected.contains(items[i]))
                // clickWidget(
                //   onTap: () => callback!(items[i]),
                //   child: Container(
                //     padding: const EdgeInsets.symmetric(
                //         horizontal: 20, vertical: 10),
                //     decoration: selected.contains(items[i])
                //         ? BoxDecoration(
                //             color: RatingColors.primaryColor,
                //             borderRadius: BorderRadius.circular(25))
                //         : BoxDecoration(
                //             color: RatingColors.whiteColor,
                //             borderRadius: BorderRadius.circular(25),
                //             border: Border.all(
                //                 color: RatingColors.inActiveFillColor,
                //                 width: 2),
                //           ),
                //     child: Text(
                //       items[i],
                //       style: appTextStyle.copyWith(
                //           fontSize: 14,
                //           color: selected.contains(items[i])
                //               ? RatingColors.blackColor
                //               : RatingColors.inActiveTextColor,
                //           fontWeight: FontWeight.w500),
                //     ),
                //   ),
                // ),
              ],
            ),
          )
        ],
        iconColor: RatingColors.blackColor,
        collapsedIconColor: RatingColors.blackColor,
        collapsedTextColor: RatingColors.blackColor,
        textColor: RatingColors.blackColor,
        title: Row(
          children: [
            SvgPicture.asset(
              icon,
              height: 19,
              width: 19,
              package: "trip_rating",
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              title,
            ),
          ],
        ),
      ),
    );
  }
}

class FaultItem extends StatelessWidget {
  const FaultItem(
      {Key? key,
      required this.callback,
      required this.item,
      required this.selected,
      this.isListed = false})
      : super(key: key);
  final Function(String?) callback;
  final String item;
  final bool selected;
  final bool isListed;
  @override
  Widget build(BuildContext context) {
    return clickWidget(
      onTap: () => callback(item),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: selected
            ? BoxDecoration(
                color: RatingColors.primaryColor,
                borderRadius: BorderRadius.circular(25))
            : BoxDecoration(
                color: RatingColors.whiteColor,
                borderRadius: BorderRadius.circular(25),
                border:
                    Border.all(color: RatingColors.inActiveFillColor, width: 2),
              ),
        child: Text(
          item,
          style: appTextStyle.copyWith(
              fontSize: 14,
              color: isListed || selected
                  ? RatingColors.blackColor
                  : RatingColors.inActiveTextColor,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
