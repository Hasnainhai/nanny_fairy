import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_fairy/Family_View/findJobFamily/provider_detail.dart';
import 'package:nanny_fairy/Family_View/homeFamily/home_view_family.dart';
import 'package:nanny_fairy/Family_View/homeFamily/widgets/bookCart_home_widget.dart';
import 'package:nanny_fairy/Repository/family_home_ui_repository.dart';
import 'package:nanny_fairy/ViewModel/family_search_view_model.dart';
import 'package:nanny_fairy/res/components/colors.dart';
import 'package:nanny_fairy/res/components/widgets/family_home_ui_enums.dart';
import 'package:nanny_fairy/res/components/widgets/shimmer_effect.dart';
import 'package:nanny_fairy/res/components/widgets/vertical_spacing.dart';
import 'package:provider/provider.dart';
import '../../../Models/family_search_model.dart';

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
          Consumer<FamilyHomeUiRepository>(builder: (context, uiState, child) {
            return Row(
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
                      debugPrint(
                          'User: ${user.toString()}'); // Print user object

                      Map<String, String> timeData = {};

                      // Check and handle time data
                      if (user.time is Map) {
                        final timeMap = user.time as Map?;
                        debugPrint(
                            'Time Map: ${timeMap.toString()}'); // Print time map
                        if (timeMap != null && timeMap.isNotEmpty) {
                          timeData = timeMap.map(
                            (key, value) =>
                                MapEntry(key.toString(), value.toString()),
                          );
                        } else {
                          debugPrint('Time data is null or empty');
                          timeData = {
                            "morningStart": "N/A",
                            "morningEnd": "N/A",
                            "afternoonStart": "N/A",
                            "afternoonEnd": "N/A",
                            "eveningStart": "N/A",
                            "eveningEnd": "N/A",
                          };
                        }
                      } else if (user.time is Time) {
                        final time = user.time as Time?;
                        debugPrint(
                            'Time Object: ${time.toString()}'); // Print time object
                        if (time != null) {
                          timeData = {
                            "MorningStart": time.morningStart,
                            "MorningEnd": time.morningEnd,
                            "AfternoonStart": time.afternoonStart,
                            "AfternoonEnd": time.afternoonEnd,
                            "EveningStart": time.eveningStart,
                            "EveningEnd": time.eveningEnd,
                          };
                        } else {
                          debugPrint('Time object is null');
                          timeData = {
                            "morningStart": "N/A",
                            "morningEnd": "N/A",
                            "afternoonStart": "N/A",
                            "afternoonEnd": "N/A",
                            "eveningStart": "N/A",
                            "eveningEnd": "N/A",
                          };
                        }
                      } else {
                        debugPrint(
                            'Unexpected type for time: ${user.time.runtimeType}');
                        timeData = {
                          "morningStart": "N/A",
                          "morningEnd": "N/A",
                          "afternoonStart": "N/A",
                          "afternoonEnd": "N/A",
                          "eveningStart": "N/A",
                          "eveningEnd": "N/A",
                        };
                      }

                      // Handle availability field
                      Set<String> daysSet = {};
                      if (user.availability != null &&
                          user.availability.isNotEmpty) {
                        user.availability.forEach((timeOfDay, daysMap) {
                          if (daysMap is Map) {
                            daysMap.forEach((day, isAvailable) {
                              if (isAvailable && !daysSet.contains(day)) {
                                daysSet.add(day.substring(0, 1).toUpperCase());
                              }
                            });
                          }
                        });
                      }

                      List<Widget> dayButtons = daysSet.map((dayAbbreviation) {
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: DayButtonFamily(day: dayAbbreviation),
                        );
                      }).toList();

                      double averageRating =
                          double.tryParse(user.averageRating.toString()) ?? 0.0;
                      int totalRatings =
                          int.tryParse(user.totalRatings.toString()) ?? 0;

                      return BookingCartWidgetHome(
                        primaryButtonColor: AppColor.primaryColor,
                        primaryButtonTxt: 'View',
                        ontapView: () {
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
                                ratings: averageRating,
                                totalRatings: totalRatings,
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
                        ratings: averageRating,
                        totalRatings: totalRatings,
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
}
