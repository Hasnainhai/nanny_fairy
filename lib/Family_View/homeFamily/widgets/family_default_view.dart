import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_fairy/FamilyController/family_home_controller.dart';
import 'package:nanny_fairy/Family_View/findJobFamily/provider_detail.dart';
import 'package:nanny_fairy/Family_View/homeFamily/home_view_family.dart';
import 'package:nanny_fairy/Family_View/homeFamily/widgets/bookCart_home_widget.dart';
import 'package:nanny_fairy/Family_View/homeFamily/widgets/home_Family_feature_widget.dart';
import 'package:nanny_fairy/res/components/colors.dart';
import 'package:nanny_fairy/res/components/widgets/shimmer_effect.dart';
import 'package:nanny_fairy/res/components/widgets/vertical_spacing.dart';
import 'package:nanny_fairy/utils/routes/routes_name.dart';
import 'package:provider/provider.dart';

class FamilyDefaultView extends StatefulWidget {
  const FamilyDefaultView({super.key});

  @override
  State<FamilyDefaultView> createState() => _FamilyDefaultViewState();
}

class _FamilyDefaultViewState extends State<FamilyDefaultView> {
  Map<String, String> getRatingsAndTotalRatings(Map<dynamic, dynamic> value) {
    String ratings = value != null && value['countRatingStars'] != null
        ? value['countRatingStars'].toString()
        : 'N/A';
    String totalRatings =
        value['reviews'] != null ? value['reviews'].length.toString() : '0';

    return {
      'ratings': ratings,
      'totalRatings': totalRatings,
    };
  }

  double calculateAverageRating(Map<dynamic, dynamic> reviews) {
    if (reviews.isEmpty) return 0.0;
    double totalRating = 0.0;
    reviews.forEach((key, review) {
      totalRating += review['countRatingStars'] ?? 0.0;
    });
    return totalRating / reviews.length;
  }

  @override
  Widget build(BuildContext context) {
    final familyhomeController = Provider.of<FamilyHomeController>(context);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'What are you looking for',
                style: GoogleFonts.getFont(
                  "Poppins",
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColor.blackColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        const VerticalSpeacing(10),
        const SizedBox(
          height: 120,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(width: 16),
                HomeFeatureContainerFamily(
                  bgColor: Color(0xff51A1BA),
                  img: 'images/cleaning.png',
                  title: 'Cleaning',
                  txColor: AppColor.whiteColor,
                ),
                SizedBox(width: 16),
                HomeFeatureContainerFamily(
                  txColor: AppColor.whiteColor,
                  bgColor: Color(0xffFEAA48),
                  img: 'images/homeSitter.png',
                  title: 'Sitter',
                ),
                SizedBox(width: 16),
                HomeFeatureContainerFamily(
                  txColor: AppColor.whiteColor,
                  bgColor: Color(0xffDDC912),
                  img: 'images/cleaning.png',
                  title: 'Eiderly',
                ),
                SizedBox(width: 16),
                HomeFeatureContainerFamily(
                  txColor: AppColor.whiteColor,
                  bgColor: Color(0xffFEAA48),
                  img: 'images/homeSitter.png',
                  title: 'Sitter',
                ),
                SizedBox(width: 16),
                HomeFeatureContainerFamily(
                  txColor: AppColor.whiteColor,
                  bgColor: Color(0xffDDC912),
                  img: 'images/cleaning.png',
                  title: 'Eiderly',
                ),
              ],
            ),
          ),
        ),
        const VerticalSpeacing(16.0),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'What are you looking for',
                    style: GoogleFonts.getFont(
                      "Poppins",
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColor.blackColor,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.jobViewFamily);
                    },
                    child: Text(
                      'see all',
                      style: GoogleFonts.getFont(
                        "Poppins",
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColor.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const VerticalSpeacing(16.0),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                child: FutureBuilder(
                  future: familyhomeController.getPopularJobs(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const ShimmerUi();
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (snapshot.data!.isEmpty) {
                      return Center(child: Text('No Providers...'));
                    } else if (snapshot.hasData) {
                      Map<dynamic, dynamic> bookings =
                          snapshot.data as Map<dynamic, dynamic>;
                      List<Widget> bookingWidgets = [];

                      bookings.forEach((key, value) {
                        if (value['Availability'] is Map) {
                          Map<String, dynamic> availabilityMap =
                              Map<String, dynamic>.from(value['Availability']);
                          Set<String> daysSet = {};

                          availabilityMap.forEach((timeOfDay, daysMap) {
                            if (daysMap is Map) {
                              daysMap.forEach((day, isAvailable) {
                                if (isAvailable && !daysSet.contains(day)) {
                                  daysSet
                                      .add(day.substring(0, 1).toUpperCase());
                                }
                              });
                            }
                          });

                          List<Widget> dayButtons =
                              daysSet.map((dayAbbreviation) {
                            return Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: DayButtonFamily(day: dayAbbreviation),
                            );
                          }).toList();
                          Map<String, String> ratingsData =
                              getRatingsAndTotalRatings(value);
                          Map<dynamic, dynamic> reviews =
                              value['reviews'] ?? {};
                          double averageRating =
                              calculateAverageRating(reviews);

                          bookingWidgets.add(
                            BookingCartWidgetHome(
                              primaryButtonColor: AppColor.primaryColor,
                              primaryButtonTxt: 'View',
                              ontapView: () {
                                Map<String, String> timeData =
                                    (value['Time'] as Map<dynamic, dynamic>)
                                        .map((key, value) => MapEntry(
                                            key.toString(), value.toString()));
                                Map<String, String> reviews =
                                    (value['reviews'] as Map<dynamic, dynamic>)
                                        .map((key, value) => MapEntry(
                                            key.toString(), value.toString()));
                                print(
                                    '...................>Reviews: $reviews..................');

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (c) => ProviderDetails(
                                      familyId: value['uid'],
                                      profile: value['profile'],
                                      name:
                                          "${value['firstName']} ${value['lastName']}",
                                      bio: value['bio'],
                                      horseRate: value['hoursrate'],
                                      experience: value['Refernce']
                                          ['experince'],
                                      degree: value['education'],
                                      dayButtons: dayButtons,
                                      timeData: timeData,
                                      ratings: averageRating,
                                      totalRatings: int.parse(
                                          ratingsData['totalRatings']!),
                                      // getRatings: reviews,
                                    ),
                                  ),
                                );
                              },
                              profile: value['profile'],
                              name:
                                  "${value['firstName']} ${value['lastName']}",
                              degree: value['education'],
                              skill: '',
                              hoursRate: value['hoursrate'],
                              dayButtons: dayButtons,
                              ratings: averageRating,
                              totalRatings:
                                  int.parse(ratingsData['totalRatings']!),
                            ),
                          );
                        } else {
                          const Center(child: Text('Invalid data format'));
                        }
                      });

                      return SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 50),
                          child: Column(
                            children: bookingWidgets,
                          ),
                        ),
                      );
                    } else {
                      return const Center(child: Text('No data available'));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
