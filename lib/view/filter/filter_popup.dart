import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:nanny_fairy/view/filter/widgets/slider_widget.dart';
import '../../res/components/colors.dart';
import '../../res/components/widgets/vertical_spacing.dart';

class FilterPopUp extends StatefulWidget {
  const FilterPopUp({super.key});

  @override
  State<FilterPopUp> createState() => _FilterPopUpState();
}

class _FilterPopUpState extends State<FilterPopUp> {
  bool button1 = false;
  bool button2 = false;
  bool button3 = false;
  bool button4 = false;
  bool button5 = true;
  bool button6 = false;
  bool button7 = false;


  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      backgroundColor: AppColor.secondaryBgColor,
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 16.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [


                const Center(
                  child: Text(
                    "Filters",
                    style: TextStyle(
                      fontFamily: 'CenturyGothic',
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: AppColor.blackColor,
                    ),
                  ),
                ),
                const VerticalSpeacing(60),
                const PriceRangeSlider(),
                const Text(
                  "Categories",
                  style: TextStyle(
                    fontFamily: 'CenturyGothic',
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: AppColor.blackColor,
                  ),
                ),
                const VerticalSpeacing(
                  20
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          button1 = !button1;
                        });
                      },
                      child: Container(
                        height: 45,
                        width: 100,
                        decoration: BoxDecoration(
                          color: button1
                              ? AppColor.primaryColor
                              : Colors.transparent,
                          border: Border.all(color: AppColor.primaryColor),
                        ),
                        child: Center(
                          child: Text(
                            "Cleaning",
                            style: TextStyle(
                              fontFamily: 'CenturyGothic',
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: button1
                                  ? AppColor.whiteColor
                                  : AppColor.blackColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          button2 = !button2;
                        });
                      },
                      child: Container(
                        height: 45,
                        width: 100,
                        decoration: BoxDecoration(
                          color: button2
                              ? AppColor.primaryColor
                              : Colors.transparent,
                          border: Border.all(color: AppColor.primaryColor),
                        ),
                        child: Center(
                          child: Text(
                            "Home",
                            style: TextStyle(
                              fontFamily: 'CenturyGothic',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: button2
                                  ? AppColor.whiteColor
                                  : AppColor.blackColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          button3 = !button3;
                        });
                      },
                      child: Container(
                        height: 45,
                        width: 100,
                        decoration: BoxDecoration(
                          color: button3
                              ? AppColor.primaryColor
                              : Colors.transparent,
                          border: Border.all(color: AppColor.primaryColor),
                        ),
                        child: Center(
                          child: Text(
                            "Children Care",
                            style: TextStyle(
                              fontFamily: 'CenturyGothic',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: button3
                                  ? AppColor.whiteColor
                                  : AppColor.blackColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const VerticalSpeacing(
                  20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          button4 = !button4;
                        });
                      },
                      child: Container(
                        height: 45,
                        width: 100,
                        decoration: BoxDecoration(
                          color: button4
                              ? AppColor.primaryColor
                              : Colors.transparent,
                          border: Border.all(color: AppColor.primaryColor),
                        ),
                        child: Center(
                          child: Text(
                            "music lesson",
                            style: TextStyle(
                              fontFamily: 'CenturyGothic',
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: button4
                                  ? AppColor.whiteColor
                                  : AppColor.blackColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          button5 = !button5;
                        });

                      },
                      child: Container(
                        height: 45,
                        width: 100,
                        decoration: BoxDecoration(
                          color: button5
                              ? AppColor.primaryColor
                              : Colors.transparent,
                          border: Border.all(color: AppColor.primaryColor),
                        ),
                        child: Center(
                          child: Text(
                            "house setting",
                            style: TextStyle(
                              fontFamily: 'CenturyGothic',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: button5
                                  ? AppColor.whiteColor
                                  : AppColor.blackColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          button6 = !button6;
                        });

                      },
                      child: Container(
                        height: 45,
                        width: 100,
                        decoration: BoxDecoration(
                          color: button6
                              ? AppColor.primaryColor
                              : Colors.transparent,
                          border: Border.all(color: AppColor.primaryColor),
                        ),
                        child: Center(
                          child: Text(
                            "Elderly care ",
                            style: TextStyle(
                              fontFamily: 'CenturyGothic',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: button6
                                  ? AppColor.whiteColor
                                  : AppColor.blackColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const VerticalSpeacing(14),
                InkWell(
                  onTap: () {
                    setState(() {
                      button7 = !button7;
                    });
                  },
                  child: Container(
                    height: 45,
                    width: 100,
                    decoration: BoxDecoration(
                      color:
                      button7 ? AppColor.primaryColor : Colors.transparent,
                      border: Border.all(color: AppColor.primaryColor),
                    ),
                    child: Center(
                      child: Text(
                        "Pet care",
                        style: TextStyle(
                          fontFamily: 'CenturyGothic',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: button7
                              ? AppColor.whiteColor
                              : AppColor.blackColor,
                        ),
                      ),
                    ),
                  ),
                ),
                const VerticalSpeacing(
                  30,
                ),
                const Text(
                  "Rating Star",
                  style: TextStyle(
                    fontFamily: 'CenturyGothic',
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: AppColor.blackColor,
                  ),
                ),
                const VerticalSpeacing(
                  14,
                ),
                RatingBar.builder(
                    initialRating: 4,
                    minRating: 1,
                    allowHalfRating: true,
                    glowColor: Colors.amber,
                    itemCount: 5,
                    itemSize: 30,
                    itemBuilder: (context, _) => const Icon(
                      Icons.star_rate_rounded,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {}),
                const VerticalSpeacing(
                  50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 56,
                        width: MediaQuery.of(context).size.width / 2 - 25,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                            color: AppColor.primaryColor,
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            "Clear Filter",
                            style: TextStyle(
                              color: AppColor.blackColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);

                      },
                      child: Container(
                        height: 56,
                        width: MediaQuery.of(context).size.width / 2 - 25,
                        decoration: BoxDecoration(
                          color: AppColor.primaryColor,
                          border: Border.all(
                            color: AppColor.primaryColor,
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            "Apply Filter",
                            style: TextStyle(
                              color: AppColor.whiteColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}