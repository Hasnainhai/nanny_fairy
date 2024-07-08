import 'package:flutter/material.dart';
import 'package:nanny_fairy/view/rating/widget/rating_card.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../res/components/colors.dart';
import '../../res/components/rounded_button.dart';
import '../../res/components/widgets/vertical_spacing.dart';
import 'add_rating.dart';

class TotalRatingScreen extends StatefulWidget {
  const TotalRatingScreen({
    super.key,
  });
  @override
  State<TotalRatingScreen> createState() => _TotalRatingScreenState();
}

class _TotalRatingScreenState extends State<TotalRatingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondaryBgColor,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: AppColor.blackColor,
            )),
        title: const Text(
          "Reviews",
          style: TextStyle(
            fontFamily: 'CenturyGothic',
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: AppColor.blackColor,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          color: AppColor.primaryColor,
                          child: const Center(
                            child: Text(
                              "4.5",
                              style: TextStyle(
                                fontFamily: 'CenturyGothic',
                                fontSize: 22,
                                fontWeight: FontWeight.w400,
                                color: AppColor.whiteColor,
                              ),
                            ),
                          ),
                        ),
                        const VerticalSpeacing(10),
                        const Text(
                          "320 reviews",
                          style: TextStyle(
                            fontFamily: 'CenturyGothic',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColor.blackColor,
                          ),
                        ),
                        const Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 18,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 18,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 18,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 18,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 18,
                            ),
                          ],
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              "5 stars",
                              style: TextStyle(
                                fontFamily: 'CenturyGothic',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColor.grayColor,
                              ),
                            ),
                            LinearPercentIndicator(
                              animation: true,
                              animationDuration: 1000,
                              width: 160,
                              percent: 0.8,
                              progressColor: AppColor.primaryColor,
                              backgroundColor: Colors.grey.shade300,
                            ),
                            const Text(
                              "200",
                              style: TextStyle(
                                fontFamily: 'CenturyGothic',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColor.blackColor,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              "4 stars",
                              style: TextStyle(
                                fontFamily: 'CenturyGothic',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColor.grayColor,
                              ),
                            ),
                            LinearPercentIndicator(
                              animation: true,
                              animationDuration: 1000,
                              width: 160,
                              percent: 0.7,
                              progressColor: AppColor.primaryColor,
                              backgroundColor: Colors.grey.shade300,
                            ),
                            const Text(
                              "150",
                              style: TextStyle(
                                fontFamily: 'CenturyGothic',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColor.blackColor,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              "3 stars ",
                              style: TextStyle(
                                fontFamily: 'CenturyGothic',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColor.grayColor,
                              ),
                            ),
                            LinearPercentIndicator(
                              animation: true,
                              animationDuration: 1000,
                              width: 160,
                              percent: 0.6,
                              progressColor: AppColor.primaryColor,
                              backgroundColor: Colors.grey.shade300,
                            ),
                            const Text(
                              "90",
                              style: TextStyle(
                                fontFamily: 'CenturyGothic',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColor.blackColor,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              "2 stars",
                              style: TextStyle(
                                fontFamily: 'CenturyGothic',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColor.grayColor,
                              ),
                            ),
                            LinearPercentIndicator(
                              animation: true,
                              animationDuration: 1000,
                              width: 160,
                              percent: 0.5,
                              progressColor: AppColor.primaryColor,
                              backgroundColor: Colors.grey.shade300,
                            ),
                            const Text(
                              "30",
                              style: TextStyle(
                                fontFamily: 'CenturyGothic',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColor.blackColor,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              "1 stars",
                              style: TextStyle(
                                fontFamily: 'CenturyGothic',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColor.grayColor,
                              ),
                            ),
                            LinearPercentIndicator(
                              animation: true,
                              animationDuration: 1000,
                              width: 160,
                              percent: 0.4,
                              progressColor: AppColor.primaryColor,
                              backgroundColor: Colors.grey.shade300,
                            ),
                            const Text(
                              "10",
                              style: TextStyle(
                                fontFamily: 'CenturyGothic',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColor.blackColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const Divider(),
                const ReviewCard(
                  imgUrl: "",
                  profilePic: "",
                  name: "User Name",
                  rating: "4.5",
                  time: "12/6/2024",
                  comment: "Aliqua officia duis occaecat consectetur fugiat nostrud anim dolor commodo officia proident. Voluptate nisi reprehenderit.",
                ),
                const ReviewCard(
                  imgUrl: "",
                  profilePic: "",
                  name: "User Name",
                  rating: "4.5",
                  time: "12/6/2024",
                  comment: "Aliqua officia duis occaecat consectetur fugiat nostrud anim dolor commodo officia proident. Voluptate nisi reprehenderit.",
                ),
                const ReviewCard(
                  imgUrl: "",
                  profilePic: "",
                  name: "User Name",
                  rating: "4.5",
                  time: "12/6/2024",
                  comment: "Aliqua officia duis occaecat consectetur fugiat nostrud anim dolor commodo officia proident. Voluptate nisi reprehenderit.",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
