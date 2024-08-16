import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_fairy/Family_View/findJobFamily/provider_detail.dart';
import 'package:nanny_fairy/Family_View/homeFamily/home_view_family.dart';
import 'package:nanny_fairy/Family_View/homeFamily/widgets/bookCart_home_widget.dart';
import 'package:nanny_fairy/ViewModel/family_filter_view_model.dart';
import 'package:nanny_fairy/res/components/colors.dart';
import 'package:nanny_fairy/res/components/widgets/shimmer_effect.dart';
import 'package:nanny_fairy/res/components/widgets/vertical_spacing.dart';
import 'package:nanny_fairy/utils/routes/routes_name.dart';
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
            height: MediaQuery.of(context).size.height / 1.6,
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
        ],
      ),
    );
  }
}
