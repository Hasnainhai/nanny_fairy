import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_fairy/Family_View/bookFamily/widgets/book_cart_widget_family.dart';
import 'package:nanny_fairy/Family_View/homeFamily/widgets/bookCart_home_widget.dart';
import 'package:nanny_fairy/res/components/searchBar.dart';
import 'package:nanny_fairy/res/components/widgets/vertical_spacing.dart';
import 'package:nanny_fairy/utils/routes/routes_name.dart';
import '../../res/components/colors.dart';

class JobViewFamily extends StatefulWidget {
  const JobViewFamily({super.key});

  @override
  State<JobViewFamily> createState() => _JobViewFamilyState();
}

class _JobViewFamilyState extends State<JobViewFamily> {
  @override
  Widget build(BuildContext context) {
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
                  child: SearchBarProvider(
                    onTapFilter: () {
                      Navigator.pushNamed(
                          context, RoutesName.filterPopUpFamily);
                    },
                  ),
                ),
              ],
            ),
            const VerticalSpeacing(50),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Column(
                    children: [
                      // BookingCartWidgetHome(
                      //     primaryButtonColor: AppColor.primaryColor,
                      //     ontapView: () {
                      //       Navigator.pushNamed(
                      //           context, RoutesName.providerDetails);
                      //     },
                      //     primaryButtonTxt: 'View'),
                      // BookingCartWidgetHome(
                      //     primaryButtonColor: AppColor.primaryColor,
                      //     ontapView: () {
                      //       Navigator.pushNamed(
                      //           context, RoutesName.providerDetails);
                      //     },
                      //     primaryButtonTxt: 'View'),
                      // BookingCartWidgetHome(
                      //     primaryButtonColor: AppColor.primaryColor,
                      //     ontapView: () {
                      //       Navigator.pushNamed(
                      //           context, RoutesName.providerDetails);
                      //     },
                      //     primaryButtonTxt: 'View'),
                      // BookingCartWidgetHome(
                      //     primaryButtonColor: AppColor.primaryColor,
                      //     ontapView: () {
                      //       Navigator.pushNamed(
                      //           context, RoutesName.providerDetails);
                      //     },
                      //     primaryButtonTxt: 'View'),
                      // BookingCartWidgetHome(
                      //     primaryButtonColor: AppColor.primaryColor,
                      //     ontapView: () {
                      //       Navigator.pushNamed(
                      //           context, RoutesName.providerDetails);
                      //     },
                      //     primaryButtonTxt: 'View'),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
