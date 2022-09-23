import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trip_rating/ratings/app/assets/colors.dart';
import 'package:trip_rating/ratings/app/assets/constants.dart';
import 'package:trip_rating/ratings/app/assets/image_assets.dart';
import 'package:trip_rating/ratings/app/assets/strings.dart';
import 'package:trip_rating/ratings/views/ratings_cubit/ratings_cubit.dart';
import 'package:trip_rating/ratings/views/widgets/fault_tile.dart';
import 'package:trip_rating/ratings/views/widgets/rating_buttons.dart';

class RatingsViewUi extends StatelessWidget {
  const RatingsViewUi(
      {Key? key,
      this.driverName,
      this.image,
      this.vehicleType,
      this.plateNumber,
      this.routeCode})
      : super(key: key);
  final String? vehicleType;
  final String? plateNumber;
  final String? routeCode;
  final String? image;
  final String? driverName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RatingsCubit>(
      create: (_) => RatingsCubit(),
      child: _RatingsViewUi(
        vehicleType: vehicleType,
        image: image,
        driverName: driverName,
        routeCode: routeCode,
        plateNumber: plateNumber,
      ),
    );
  }
}

class _RatingsViewUi extends StatelessWidget {
  _RatingsViewUi(
      {Key? key,
      this.routeCode,
      this.plateNumber,
      this.vehicleType,
      this.image,
      this.driverName})
      : super(key: key);

  final String? vehicleType;
  final String? plateNumber;
  final String? routeCode;
  final String? image;
  final String? driverName;
  int _star = 0;
  String _message = "";
  final TextEditingController _textEditingController = TextEditingController();
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: RatingColors.whiteColor,
      // resizeToAvoidBottomInset: true,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: BlocBuilder<RatingsCubit, RatingsState>(
            builder: (context, state) {
              List<String> _selected = context.read<RatingsCubit>().selected;

              if (state is RatingsStateChange) {
                _star = state.rate;
                _message = state.message;
              }
              if (state is RatingsStateSurvey) {
                _moveToPage(1);
              }
              if (state is RatingsStateComplete) {
                _handleShowModal(context, state.statisfied);
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: height * .65,
                    child: PageView.builder(
                        controller: _pageController,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, i) {
                          var _widget = [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      clickWidget(
                                        onTap: () => Navigator.pop(context),
                                        child: Text(
                                          AppString.skip,
                                          textAlign: TextAlign.end,
                                          style: appTextStyle.copyWith(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                          height: 80,
                                          width: 50,
                                          child: Stack(
                                            children: [
                                              image == null
                                                  ? Center(
                                                      child: SvgPicture.asset(
                                                        ImageAssets.placeholder,
                                                        package: "trip_rating",
                                                        height: 60,
                                                        width: 60,
                                                      ),
                                                    )
                                                  : Center(
                                                      child: CircleAvatar(
                                                        radius: 30,
                                                        backgroundImage:
                                                            NetworkImage(
                                                                image!),
                                                      ),
                                                    ),
                                              Positioned(
                                                top: 49,
                                                right: 140,
                                                child: SvgPicture.asset(
                                                  ImageAssets.busIcon,
                                                  height: 25,
                                                  width: 25,
                                                  package: "trip_rating",
                                                ),
                                              )
                                            ],
                                          )),
                                      Text(
                                        driverName ?? "Undefined",
                                        textAlign: TextAlign.center,
                                        style: appTextStyle.copyWith(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      SizedBox(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            _vehicleDetailsBuilder(
                                                AppString.vehicleType,
                                                value: vehicleType ?? ""),
                                            _vehicleDetailsBuilder(
                                                AppString.plateNumber,
                                                value: plateNumber ?? ""),
                                            _vehicleDetailsBuilder(
                                                AppString.routeCode,
                                                value: routeCode ?? ""),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0),
                                        child: Divider(
                                          height: 2,
                                          color: RatingColors.blackColor
                                              .withOpacity(.5),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      Text(
                                        AppString.yourTrip,
                                        textAlign: TextAlign.center,
                                        style: appTextStyle.copyWith(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                        width: width * .7,
                                        child: Text(
                                          AppString.yourFeedback,
                                          textAlign: TextAlign.center,
                                          style: appTextStyle.copyWith(
                                            color:
                                                RatingColors.inActiveTextColor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 30.0),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                for (var i = 0; i < 5; i++)
                                                  clickWidget(
                                                    onTap: () => context
                                                        .read<RatingsCubit>()
                                                        .rateChange(i + 1),
                                                    child: SvgPicture.asset(
                                                      (i + 1) > _star
                                                          ? ImageAssets.starIcon
                                                          : ImageAssets
                                                              .yellowStarIcon,
                                                      package: "trip_rating",
                                                      height: 40,
                                                      width: 40,
                                                    ),
                                                  ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 30,
                                            ),
                                            Text(
                                              _message,
                                              textAlign: TextAlign.center,
                                              style: appTextStyle.copyWith(
                                                color: RatingColors
                                                    .inActiveTextColor,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 30,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: AppBar(
                                          toolbarHeight: 50,
                                          elevation: 4,
                                          centerTitle: true,
                                          automaticallyImplyLeading: false,
                                          shadowColor: RatingColors
                                              .inActiveFillColor
                                              .withOpacity(.5),
                                          leading: clickWidget(
                                            onTap: () => _moveToPage(0),
                                            child: const Icon(
                                              Icons.arrow_back,
                                              color: RatingColors.blackColor,
                                            ),
                                          ),
                                          backgroundColor:
                                              RatingColors.whiteColor,
                                          title: Text(
                                            AppString.selectIssue,
                                            textAlign: TextAlign.center,
                                            style: appTextStyle.copyWith(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0, vertical: 10),
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          AppString.youCan,
                                          style: appTextStyle.copyWith(
                                            fontSize: 17,
                                            color:
                                                RatingColors.inActiveTextColor,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  for (var i = 0; i < testData.length; i++)
                                    FaultTile(
                                      callback: (i) {
                                        context
                                            .read<RatingsCubit>()
                                            .selectFault(i!);
                                      },
                                      selected: _selected,
                                      items: testData[i]["items"] ?? [],
                                      icon: testData[i]["icon"],
                                      title: testData[i]["name"],
                                    ),
                                  if (_selected.isNotEmpty)
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10),
                                      child: Text(
                                        AppString.selectIssue,
                                        style: appTextStyle.copyWith(
                                            fontSize: 14,
                                            color:
                                                RatingColors.inActiveTextColor,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Wrap(
                                      spacing: 5,
                                      runSpacing: 5,
                                      children: [
                                        for (var i = 0;
                                            i < _selected.length;
                                            i++)
                                          FaultItem(
                                            callback: (s) {},
                                            item: _selected[i],
                                            selected: false,
                                            isListed: true,
                                          )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ];
                          return _widget[i];
                        }),
                  ),
                  Container(
                    width: width,
                    decoration: BoxDecoration(
                      color: RatingColors.whiteColor,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black54.withOpacity(.1),
                            blurRadius: 3.7,
                            spreadRadius: .01,
                            offset: const Offset(0.0, -0.75))
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, top: 25, right: 20, bottom: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                            height: 75,
                            child: TextFormField(
                              maxLines: 30,
                              controller: _textEditingController,
                              cursorColor: RatingColors.primaryColor,
                              decoration: InputDecoration(
                                filled: true,
                                hintText: AppString.hintText,
                                fillColor: RatingColors.inActiveFillColor,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(9),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          BlocBuilder<RatingsCubit, RatingsState>(
                            builder: (context, state) {
                              if (state is RatingsStateLoading) {
                                return RatingsButton(
                                  isDone: true,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      SizedBox(
                                        width: 20,
                                        child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    RatingColors.whiteColor)),
                                      ),
                                    ],
                                  ),
                                );
                              }

                              return clickWidget(
                                onTap: () => _pageController.page == 0
                                    ? context.read<RatingsCubit>().done(_star)
                                    : context
                                        .read<RatingsCubit>()
                                        .doneWithReasons(),
                                child: RatingsButton(
                                  isDone: _star > 0,
                                  child: Text(
                                    AppString.done,
                                    textAlign: TextAlign.center,
                                    style: appTextStyle.copyWith(
                                      color: _star > 0
                                          ? RatingColors.blackColor
                                          : RatingColors.whiteColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void _handleShowModal(BuildContext ctx, bool satisfied) async {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) async {
      await showModal(ctx, satisfied);
      Navigator.pop(ctx);
    });
  }

  void _moveToPage(int page) async {
    await _pageController.animateToPage(
      page,
      duration: const Duration(microseconds: 500),
      curve: Curves.easeIn,
    );
  }

  Flexible _vehicleDetailsBuilder(String title, {String? value}) {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: appTextStyle.copyWith(
              fontSize: 13,
              color: RatingColors.inActiveTextColor,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            value ?? "",
            style: appTextStyle.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
