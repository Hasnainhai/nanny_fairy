import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_fairy/FamilyController/get_family_info_controller.dart';
import 'package:nanny_fairy/Family_View/homeFamily/widgets/family_default_view.dart';
import 'package:nanny_fairy/Family_View/homeFamily/widgets/family_filter_view.dart';
import 'package:nanny_fairy/Family_View/homeFamily/widgets/family_search__view.dart';
import 'package:nanny_fairy/Repository/family_home_ui_repository.dart';
import 'package:nanny_fairy/res/components/colors.dart';
import 'package:nanny_fairy/res/components/widgets/Family_search_bar.dart';
import 'package:nanny_fairy/res/components/widgets/family_home_ui_enums.dart';
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
  void initState() {
    super.initState();
    // Fetch users when the widget initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<GetFamilyInfoController>(context, listen: false)
          .getFamilyInfo();
    });
  }

  @override
  Widget build(BuildContext context) {
    final familyHomeView = Provider.of<GetFamilyInfoController>(context);
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
                  child: FutureBuilder<Map<dynamic, dynamic>>(
                    future: familyHomeView.getFamilyInfo(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (snapshot.hasData) {
                        Map<dynamic, dynamic> family =
                            snapshot.data as Map<dynamic, dynamic>;
                        return Center(
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 40,
                              foregroundImage: NetworkImage(family['profile']),
                              backgroundImage: const NetworkImage(
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
                              "${family['firstName']} ${family['lastName']}",
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
                        );
                      } else {
                        return const Center(child: Text('No data available'));
                      }
                    },
                  ),
                ),
                Positioned(
                  top: 135,
                  left: (MediaQuery.of(context).size.width - 320) /
                      2, // Center horizontally
                  child: FamilySearchBarProvider(
                    onTapFilter: () {
                      Navigator.pushNamed(
                          context, RoutesName.filterPopUpFamily);
                    },
                  ),
                ),
              ],
            ),
            const VerticalSpeacing(50.0),
            Consumer<FamilyHomeUiRepository>(
              builder: (context, uiState, _) {
                Widget selectedWidget;

                switch (uiState.selectedType) {
                  case FamilyHomeUiEnums.SearchSection:
                    selectedWidget = const FamilySearchView();
                    break;
                  case FamilyHomeUiEnums.DefaultSection:
                    selectedWidget = const FamilyDefaultView();
                    break;
                  case FamilyHomeUiEnums.FilterSection:
                    selectedWidget = const FamilyFilterView();
                    break;
                }

                return selectedWidget;
              },
            ),
            // FamilyDefaultView(),
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
