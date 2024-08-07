import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_fairy/FamilyController/family_home_controller.dart';
import 'package:nanny_fairy/Family_View/findJobFamily/provider_detail.dart';
import 'package:nanny_fairy/Family_View/homeFamily/widgets/bookCart_home_widget.dart';
import 'package:nanny_fairy/Family_View/homeFamily/widgets/home_Family_feature_widget.dart';
import 'package:nanny_fairy/res/components/colors.dart';
import 'package:nanny_fairy/res/components/searchBar.dart';
import 'package:nanny_fairy/res/components/widgets/vertical_spacing.dart';
import 'package:provider/provider.dart';
import '../../utils/routes/routes_name.dart';

class HomeViewFamily extends StatefulWidget {
  const HomeViewFamily({super.key});

  @override
  State<HomeViewFamily> createState() => _HomeViewFamilyState();
}

class _HomeViewFamilyState extends State<HomeViewFamily> {
  @override
  Widget build(BuildContext context) {
    final familyhomeController = Provider.of<FamilyHomeController>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 179,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: AppColor.primaryColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Center(
                    child: ListTile(
                      leading: const CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(
                            'https://play-lh.googleusercontent.com/jInS55DYPnTZq8GpylyLmK2L2cDmUoahVacfN_Js_TsOkBEoizKmAl5-p8iFeLiNjtE=w526-h296-rw'),
                      ),
                      title: Text(
                        'WellCome',
                        style: GoogleFonts.getFont(
                          "Poppins",
                          textStyle: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColor.whiteColor,
                          ),
                        ),
                      ),
                      subtitle: Text(
                        'Aliza Zehra',
                        style: GoogleFonts.getFont(
                          "Poppins",
                          textStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColor.whiteColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 159, // Adjust this value as needed
                  left: (MediaQuery.of(context).size.width - 320) /
                      2, // Center horizontally
                  child: SearchBarProvider(
                    onTapFilter: () {
                      Navigator.pushNamed(
                          context, RoutesName.filterPopUpFamily);
                    },
                  ),
                ),
              ],
            ),
            const VerticalSpeacing(50.0),
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
                          Navigator.pushNamed(
                              context, RoutesName.jobViewFamily);
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
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        } else if (snapshot.hasData) {
                          Map<dynamic, dynamic> bookings =
                              snapshot.data as Map<dynamic, dynamic>;
                          List<Widget> bookingWidgets = [];

                          bookings.forEach((key, value) {
                            if (value['Availability'] is Map) {
                              Map<String, dynamic> availabilityMap =
                                  Map<String, dynamic>.from(
                                      value['Availability']);
                              Set<String> daysSet = {};

                              availabilityMap.forEach((timeOfDay, daysMap) {
                                if (daysMap is Map) {
                                  daysMap.forEach((day, isAvailable) {
                                    if (isAvailable && !daysSet.contains(day)) {
                                      daysSet.add(
                                          day.substring(0, 1).toUpperCase());
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

                              bookingWidgets.add(
                                BookingCartWidgetHome(
                                  primaryButtonColor: AppColor.primaryColor,
                                  primaryButtonTxt: 'View',
                                  ontapView: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (c) => ProviderDetails(
                                              profile: value['profile'],
                                              name:
                                                  "${value['firstName']} ${value['lastName']}",
                                              bio: value['bio'],
                                              horseRate: value['hoursrate'],
                                              experience: value['Refernce']
                                                  ['experince'],
                                              degree: value['education'],
                                              dayButtons: dayButtons)),
                                    );
                                  },
                                  profile: value['profile'],
                                  name:
                                      "${value['firstName']} ${value['lastName']}",
                                  degree: value['education'],
                                  skill: '',
                                  hoursRate: value['hoursrate'],
                                  dayButtons: dayButtons,
                                ),
                              );
                            } else {
                              bookingWidgets.add(
                                const Center(
                                    child: Text('Invalid data format')),
                              );
                            }
                          });

                          return SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              children: bookingWidgets,
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
        ),
      ),
    );
  }
}

class DayButtonFamily extends StatefulWidget {
  final String day;

  const DayButtonFamily({
    super.key,
    required this.day,
  });

  @override
  _DayButtonFamilyState createState() => _DayButtonFamilyState();
}

class _DayButtonFamilyState extends State<DayButtonFamily> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15,
      width: 15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: Colors.transparent,
        border: Border.all(color: Colors.grey),
      ),
      child: Center(
        child: Text(
          widget.day,
          style: const TextStyle(
            fontSize: 8,
            color: AppColor.blackColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
