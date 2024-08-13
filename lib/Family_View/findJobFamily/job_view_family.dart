import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_fairy/Family_View/findJobFamily/widgets/famil_job_default_section.dart';
import 'package:nanny_fairy/Family_View/findJobFamily/widgets/family_job_filter_section.dart';
import 'package:nanny_fairy/Family_View/findJobFamily/widgets/family_job_search_seaction.dart';
import 'package:nanny_fairy/Family_View/homeFamily/widgets/bookCart_home_widget.dart';
import 'package:nanny_fairy/Repository/family_home_ui_repository.dart';
import 'package:nanny_fairy/res/components/searchBar.dart';
import 'package:nanny_fairy/res/components/widgets/family_job_enums.dart';
import 'package:nanny_fairy/res/components/widgets/family_job_search_bar.dart';
import 'package:nanny_fairy/res/components/widgets/job_enum.dart';
import 'package:nanny_fairy/res/components/widgets/vertical_spacing.dart';
import 'package:nanny_fairy/utils/routes/routes_name.dart';
import 'package:provider/provider.dart';
import '../../FamilyController/family_home_controller.dart';
import '../../res/components/colors.dart';

class JobViewFamily extends StatefulWidget {
  const JobViewFamily({super.key});

  @override
  State<JobViewFamily> createState() => _JobViewFamilyState();
}

class _JobViewFamilyState extends State<JobViewFamily> {
  @override
  Widget build(BuildContext context) {
    final familyhomeController = Provider.of<FamilyHomeController>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.secondaryBgColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 150,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: AppColor.primaryColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Providers',
                          style: GoogleFonts.getFont(
                            "Poppins",
                            textStyle: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: AppColor.whiteColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 125, // Adjust this value as needed
                  left: (MediaQuery.of(context).size.width - 320) /
                      2, // Center horizontally
                  child: FamilySearchBar(
                    onTapFilter: () {
                      Navigator.pushNamed(
                          context, RoutesName.filterPopUpFamily);
                    },
                  ),
                ),
              ],
            ),
            const VerticalSpeacing(50),
            Consumer<FamilyHomeUiRepository>(
              builder: (context, uiState, _) {
                Widget selectedWidget;

                switch (uiState.selectedJobType) {
                  case FamilyJobEnums.DefaultSection:
                    selectedWidget = const FamilyJobDefaultSection();
                    break;
                  case FamilyJobEnums.FilterSection:
                    selectedWidget = const FamilyJobFilterSection();
                    break;
                  case FamilyJobEnums.SearchSection:
                    selectedWidget = const FamilyJobSearchSeaction();
                    break;
                }

                return selectedWidget;
              },
            ),
            // SizedBox(
            //   height: MediaQuery.of(context).size.height,
            //   child: Padding(
            //     padding: const EdgeInsets.only(left: 16, right: 16),
            //     child: FutureBuilder(
            //       future: familyhomeController.getPopularJobs(),
            //       builder: (context, snapshot) {
            //         if (snapshot.connectionState == ConnectionState.waiting) {
            //           return const Center(child: CircularProgressIndicator());
            //         } else if (snapshot.hasError) {
            //           return Center(child: Text('Error: ${snapshot.error}'));
            //         } else if (snapshot.hasData) {
            //           Map<dynamic, dynamic> bookings =
            //               snapshot.data as Map<dynamic, dynamic>;
            //           List<Widget> bookingWidgets = [];

            //           bookings.forEach((key, value) {
            //             if (value['Availability'] is Map) {
            //               Map<String, dynamic> availabilityMap =
            //                   Map<String, dynamic>.from(value['Availability']);
            //               Set<String> daysSet = {};
            //               availabilityMap.forEach((timeOfDay, daysMap) {
            //                 if (daysMap is Map) {
            //                   daysMap.forEach((day, isAvailable) {
            //                     if (isAvailable && !daysSet.contains(day)) {
            //                       daysSet
            //                           .add(day.substring(0, 1).toUpperCase());
            //                     }
            //                   });
            //                 }
            //               });

            //               List<Widget> dayButtons =
            //                   daysSet.map((dayAbbreviation) {
            //                 return Padding(
            //                   padding: const EdgeInsets.all(4.0),
            //                   child: DayButtonFamily(day: dayAbbreviation),
            //                 );
            //               }).toList();

            //               bookingWidgets.add(
            //                 BookingCartWidgetHome(
            //                   primaryButtonColor: AppColor.primaryColor,
            //                   primaryButtonTxt: 'View',
            //                   ontapView: () {},
            //                   profile: value['profile'],
            //                   name:
            //                       "${value['firstName']} ${value['lastName']}",
            //                   degree: value['education'],
            //                   skill: '',
            //                   hoursRate: value['hoursrate'],
            //                   dayButtons: dayButtons,
            //                 ),
            //               );
            //             } else {
            //               bookingWidgets.add(
            //                 const Center(child: Text('Invalid data format')),
            //               );
            //             }
            //           });

            //           return SingleChildScrollView(
            //             scrollDirection: Axis.vertical,
            //             child: Column(
            //               children: bookingWidgets,
            //             ),
            //           );
            //         } else {
            //           return const Center(child: Text('No data available'));
            //         }
            //       },
            //     ),
            //   ),
            // ),
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
