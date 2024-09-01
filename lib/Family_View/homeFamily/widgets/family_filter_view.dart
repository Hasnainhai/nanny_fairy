import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_fairy/Family_View/findJobFamily/provider_detail.dart';
import 'package:nanny_fairy/Family_View/homeFamily/home_view_family.dart';
import 'package:nanny_fairy/Family_View/homeFamily/widgets/bookCart_home_widget.dart';
import 'package:nanny_fairy/Models/family_search_model.dart';
import 'package:nanny_fairy/Repository/family_home_ui_repository.dart';
import 'package:nanny_fairy/ViewModel/family_filter_view_model.dart';
import 'package:nanny_fairy/res/components/colors.dart';
import 'package:nanny_fairy/res/components/widgets/family_home_ui_enums.dart';
import 'package:nanny_fairy/res/components/widgets/shimmer_effect.dart';
import 'package:nanny_fairy/res/components/widgets/vertical_spacing.dart';
import 'package:provider/provider.dart';

class FamilyFilterView extends StatefulWidget {
  const FamilyFilterView({super.key});

  @override
  State<FamilyFilterView> createState() => _FamilyFilterViewState();
}

class _FamilyFilterViewState extends State<FamilyFilterView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: Column(
        children: [
          Consumer<FamilyHomeUiRepository>(builder: (context, uiState, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Filtered Providers',
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
                    uiState.switchToType((FamilyHomeUiEnums.DefaultSection));
                  },
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
            );
          }),
          SizedBox(
            height: MediaQuery.of(context).size.height / 1.3,
            child: Consumer<FamilyFilterController>(
              builder: (context, viewModel, child) {
                if (viewModel.isLoading) {
                  return const ShimmerUi();
                } else if (viewModel.filteredProviders.isEmpty) {
                  return const Center(child: Text('No results found'));
                } else {
                  return ListView.builder(
                    itemCount: viewModel.filteredProviders.length,
                    itemBuilder: (context, index) {
                      final user = viewModel.filteredProviders[index];
                      Map<String, Map<String, bool>> testAvailability = {
                        "Morning": {
                          "Monday": true,
                          "Tuesday": true,
                          "Friday": true,
                          "Sunday": false,
                        },
                        "Afternoon": {
                          "Wednesday": true,
                          "Thursday": false,
                        }
                      };
                      Set<String> testDaysSet = _getDaysSet(testAvailability);

                      final dayButtons = _buildDayButtons(testDaysSet);

                      // Handle time field
                      Map<String, String> timeData = {};

                      if (user.time is Map) {
                        // Convert Map to Map<String, String>
                        timeData = (user.time as Map<dynamic, dynamic>).map(
                          (key, value) =>
                              MapEntry(key.toString(), value.toString()),
                        );
                      } else if (user.time is Time) {
                        // Handle custom Time type
                        final time = user.time;
                        timeData = {
                          "morningStart": time.morningStart,
                          "morningEnd": time.morningEnd,
                          "afternoonStart": time.afternoonStart,
                          "afternoonEnd": time.afternoonEnd,
                          "eveningStart": time.eveningStart,
                          "eveningEnd": time.eveningEnd,
                          // Add more fields if necessary
                        };
                      } else {
                        // Handle unexpected types
                        debugPrint(
                            'Unexpected type for time: ${user.time.runtimeType}');
                        // Provide default values or handle error
                        timeData = {
                          "start": "N/A",
                          "end": "N/A",
                        };
                      }

                      return BookingCartWidgetHome(
                        primaryButtonColor: AppColor.primaryColor,
                        primaryButtonTxt: 'View',
                        ontapView: () => _navigateToProviderDetails(
                          context,
                          user,
                          dayButtons,
                          _getTimeData(user.time),
                        ),
                        profile: user.profile,
                        name: "${user.firstName} ${user.lastName}",
                        degree: user.education,
                        skill: '',
                        hoursRate: user.hoursrate,
                        dayButtons: dayButtons,
                        totalRatings: user.totalRatings,
                        ratings: user.averageRating,
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Map<String, String> _getTimeData(dynamic time) {
    if (time is Map) {
      final timeMap = time as Map<String, dynamic>;
      return timeMap
          .map((key, value) => MapEntry(key.toString(), value.toString()));
    } else if (time is Time) {
      final timeObject = time as Time;
      return {
        "MorningStart": timeObject.morningStart,
        "MorningEnd": timeObject.morningEnd,
        "AfternoonStart": timeObject.afternoonStart,
        "AfternoonEnd": timeObject.afternoonEnd,
        "EveningStart": timeObject.eveningStart,
        "EveningEnd": timeObject.eveningEnd,
      };
    }
    return _defaultTimeData();
  }

  Map<String, String> _defaultTimeData() {
    return {
      "MorningStart": "N/A",
      "MorningEnd": "N/A",
      "AfternoonStart": "N/A",
      "AfternoonEnd": "N/A",
      "EveningStart": "N/A",
      "EveningEnd": "N/A",
    };
  }

  Set<String> _getDaysSet(Map<String, dynamic>? availability) {
    final daysSet = <String>{};
    if (availability == null || availability.isEmpty) {
      print('No availability data found'); // Debugging line for empty data
      return daysSet; // Return an empty set if no availability
    }

    print('Availability data: $availability'); // Debugging line

    availability.forEach((timeOfDay, daysMap) {
      if (daysMap is Map) {
        daysMap.forEach((day, value) {
          if (value == true) {
            String dayAbbreviation = day.substring(0, 1).toUpperCase();
            daysSet.add(dayAbbreviation);
          }
        });
      } else {
        print(
            'Invalid availability data for $timeOfDay: $daysMap'); // Debugging line
      }
    });

    print('Days set: $daysSet'); // Debugging line
    return daysSet;
  }

// Function to build the day buttons
  List<Widget> _buildDayButtons(Set<String> daysSet) {
    print('Building day buttons for: $daysSet'); // Debugging line
    return daysSet.map((dayAbbreviation) {
      return Padding(
        padding: const EdgeInsets.all(4.0),
        child: DayButtonFamily(day: dayAbbreviation),
      );
    }).toList();
  }

  void _navigateToProviderDetails(
    BuildContext context,
    ProviderSearchModel user,
    List<Widget> dayButtons,
    Map<String, String> timeData,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (c) => ProviderDetails(
          familyId: user.uid,
          profile: user.profile,
          name: "${user.firstName} ${user.lastName}",
          bio: user.bio,
          horseRate: user.hoursrate,
          experience: user.reference.experience,
          degree: user.education,
          dayButtons: dayButtons,
          timeData: timeData,
          ratings: user.averageRating,
          totalRatings: user.totalRatings,
        ),
      ),
    );
  }
}
