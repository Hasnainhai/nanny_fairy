import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_fairy/Family_View/findJobFamily/provider_detail.dart';
import 'package:nanny_fairy/Family_View/homeFamily/widgets/bookCart_home_widget.dart';
import 'package:nanny_fairy/Repository/family_home_ui_repository.dart';
import 'package:nanny_fairy/ViewModel/family_search_view_model.dart';

import 'package:nanny_fairy/res/components/colors.dart';
import 'package:nanny_fairy/res/components/widgets/family_home_ui_enums.dart';
import 'package:nanny_fairy/res/components/widgets/family_job_enums.dart';
import 'package:nanny_fairy/view/booked/widgets/booking_widget.dart';
import 'package:nanny_fairy/view/job/family_detail_provider.dart';
import 'package:provider/provider.dart';

class FamilyJobSearchSeaction extends StatefulWidget {
  const FamilyJobSearchSeaction({super.key});

  @override
  State<FamilyJobSearchSeaction> createState() =>
      _FamilyJobSearchSeactionState();
}

class _FamilyJobSearchSeactionState extends State<FamilyJobSearchSeaction> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<FamilySearchViewModel>(context, listen: false).fetchUsers();
    });

    searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    final viewModel =
        Provider.of<FamilySearchViewModel>(context, listen: false);
    viewModel.searchUsersByPassion(searchController.text);
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
            ),
            child: Consumer<FamilyHomeUiRepository>(
                builder: (context, uiState, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Find Jobs',
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
                      uiState.switchToType(FamilyHomeUiEnums.DefaultSection);
                    },
                    child: Text(
                      'Clear Jobs',
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
          ),
          // SizedBox(height: 16.0),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Consumer<FamilySearchViewModel>(
              builder: (context, viewModel, child) {
                if (viewModel.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (viewModel.users.isEmpty) {
                  return const Center(child: Text('No results found'));
                } else {
                  return ListView.builder(
                    itemCount: viewModel.users.length,
                    itemBuilder: (context, index) {
                      final user = viewModel.users[index];
                      Map<String, dynamic> availabilityMap =
                          Map<String, dynamic>.from(user.availability);
                      Set<String> daysSet = {};

                      availabilityMap.forEach((timeOfDay, daysMap) {
                        if (daysMap is Map) {
                          daysMap.forEach((day, isAvailable) {
                            if (isAvailable && !daysSet.contains(day)) {
                              daysSet.add(day.substring(0, 1).toUpperCase());
                            }
                          });
                        }
                      });

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
                          Map<String, String> timeData = (user.availability
                                  as Map<dynamic, dynamic>)
                              .map((key, value) =>
                                  MapEntry(key.toString(), value.toString()));

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (c) => ProviderDetails(
                                      profile: user.profile,
                                      name:
                                          "${user.firstName} ${user.lastName}",
                                      bio: user.bio,
                                      horseRate: user.hoursrate,
                                      experience: user.reference.experience,
                                      degree: user.education,
                                      dayButtons: dayButtons,
                                      timeData: timeData,
                                    )),
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
        ],
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
