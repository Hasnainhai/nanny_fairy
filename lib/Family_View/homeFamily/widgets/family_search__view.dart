import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_fairy/Family_View/findJobFamily/provider_detail.dart';
import 'package:nanny_fairy/Family_View/homeFamily/home_view_family.dart';
import 'package:nanny_fairy/Family_View/homeFamily/widgets/bookCart_home_widget.dart';
import 'package:nanny_fairy/ViewModel/family_search_view_model.dart';
import 'package:nanny_fairy/res/components/colors.dart';
import 'package:nanny_fairy/res/components/widgets/shimmer_effect.dart';
import 'package:nanny_fairy/res/components/widgets/vertical_spacing.dart';
import 'package:provider/provider.dart';

class FamilySearchView extends StatefulWidget {
  const FamilySearchView({super.key});

  @override
  State<FamilySearchView> createState() => _FamilySearchViewState();
}

class _FamilySearchViewState extends State<FamilySearchView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Searched Providers',
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
                onTap: () {},
                child: Text(
                  'Clear all',
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
            height: MediaQuery.of(context).size.height / 1.6,
            child: Consumer<FamilySearchViewModel>(
              builder: (context, viewModel, child) {
                if (viewModel.isLoading) {
                  return const ShimmerUi();
                } else if (viewModel.users.isEmpty) {
                  return const Center(child: Text('No results found'));
                } else {
                  return ListView.builder(
                    itemCount: viewModel.users.length,
                    itemBuilder: (context, index) {
                      final user = viewModel.users[index];
                      // Assuming `time` can be a Map or another type, handle it accordingly
                      Map<String, String> timeData = {};
                      if (user.time is Map) {
                        timeData = (user.time as Map<dynamic, dynamic>).map(
                            (key, value) =>
                                MapEntry(key.toString(), value.toString()));
                      } else {
                        // Handle unexpected type for `time`
                        debugPrint(
                            'Unexpected type for time: ${user.time.runtimeType}');
                        // You can provide default values or handle the error appropriately here
                      }

                      // Set of day buttons based on `user` information
                      Set<String> daysSet =
                          {}; // Populate this set based on your data
                      List<Widget> dayButtons = daysSet.map((dayAbbreviation) {
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: DayButtonFamily(day: dayAbbreviation),
                        );
                      }).toList();

                      return BookingCartWidgetHome(
                        primaryButtonColor: AppColor.primaryColor,
                        primaryButtonTxt: 'View',
                        ontapView: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (c) => ProviderDetails(
                                profile: user.profile,
                                name: "${user.firstName} ${user.lastName}",
                                bio: user.bio,
                                horseRate: user.hoursrate,
                                experience: user.reference.experience,
                                degree: user.education,
                                dayButtons: dayButtons,
                                timeData: timeData,
                              ),
                            ),
                          );
                        },
                        profile: user.profile,
                        name: "${user.firstName} ${user.lastName}",
                        degree: user.education,
                        skill: '',
                        hoursRate: user.hoursrate,
                        dayButtons: dayButtons,
                      );
                    },
                  );
                }
              },
            ),
          ),
          // SizedBox(
          //   height: MediaQuery.of(context).size.height,
          //   child: FutureBuilder(
          //     future: familyhomeController.getPopularJobs(),
          //     builder: (context, snapshot) {
          //       if (snapshot.connectionState == ConnectionState.waiting) {
          //         return const Center(child: CircularProgressIndicator());
          //       } else if (snapshot.hasError) {
          //         return Center(child: Text('Error: ${snapshot.error}'));
          //       } else if (snapshot.hasData) {
          //         Map<dynamic, dynamic> bookings =
          //             snapshot.data as Map<dynamic, dynamic>;
          //         List<Widget> bookingWidgets = [];

          //         bookings.forEach((key, value) {
          //           if (value['Availability'] is Map) {
          //             Map<String, dynamic> availabilityMap =
          //                 Map<String, dynamic>.from(value['Availability']);
          //             Set<String> daysSet = {};

          //             availabilityMap.forEach((timeOfDay, daysMap) {
          //               if (daysMap is Map) {
          //                 daysMap.forEach((day, isAvailable) {
          //                   if (isAvailable && !daysSet.contains(day)) {
          //                     daysSet.add(day.substring(0, 1).toUpperCase());
          //                   }
          //                 });
          //               }
          //             });

          //             List<Widget> dayButtons = daysSet.map((dayAbbreviation) {
          //               return Padding(
          //                 padding: const EdgeInsets.all(4.0),
          //                 child: DayButtonFamily(day: dayAbbreviation),
          //               );
          //             }).toList();

          //             bookingWidgets.add(
          //               BookingCartWidgetHome(
          //                 primaryButtonColor: AppColor.primaryColor,
          //                 primaryButtonTxt: 'View',
          //                 ontapView: () {
          //                   Map<String, String> timeData = (value['Time']
          //                           as Map<dynamic, dynamic>)
          //                       .map((key, value) =>
          //                           MapEntry(key.toString(), value.toString()));

          //                   Navigator.push(
          //                     context,
          //                     MaterialPageRoute(
          //                         builder: (c) => ProviderDetails(
          //                               profile: value['profile'],
          //                               name:
          //                                   "${value['firstName']} ${value['lastName']}",
          //                               bio: value['bio'],
          //                               horseRate: value['hoursrate'],
          //                               experience: value['Refernce']
          //                                   ['experince'],
          //                               degree: value['education'],
          //                               dayButtons: dayButtons,
          //                               timeData: timeData,
          //                             )),
          //                   );
          //                 },
          //                 profile: value['profile'],
          //                 name: "${value['firstName']} ${value['lastName']}",
          //                 degree: value['education'],
          //                 skill: '',
          //                 hoursRate: value['hoursrate'],
          //                 dayButtons: dayButtons,
          //               ),
          //             );
          //           } else {
          //             bookingWidgets.add(
          //               const Center(child: Text('Invalid data format')),
          //             );
          //           }
          //         });

          //         return SingleChildScrollView(
          //           scrollDirection: Axis.vertical,
          //           child: Padding(
          //             padding: const EdgeInsets.only(bottom: 50),
          //             child: Column(
          //               children: bookingWidgets,
          //             ),
          //           ),
          //         );
          //       } else {
          //         return const Center(child: Text('No data available'));
          //       }
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
