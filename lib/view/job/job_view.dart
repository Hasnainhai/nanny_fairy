import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_fairy/res/components/searchBar.dart';
import 'package:nanny_fairy/res/components/widgets/vertical_spacing.dart';
import 'package:nanny_fairy/utils/routes/routes_name.dart';
import 'package:nanny_fairy/view/booked/widgets/booking_widget.dart';
import '../../res/components/colors.dart';

class JobView extends StatefulWidget {
  const JobView({super.key});

  @override
  State<JobView> createState() => _JobViewState();
}

class _JobViewState extends State<JobView> {
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
                          'Jobs',
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
                    ))),
                Positioned(
                  top: 125, // Adjust this value as needed
                  left: (MediaQuery.of(context).size.width - 320) /
                      2, // Center horizontally
                  child: SearchBarProvider(
                    onTapFilter: () {
                      Navigator.pushNamed(context, RoutesName.filterPopup);
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
                      BookingCartWidget(
                          ontapView: () {
                            Navigator.pushNamed(
                                context, RoutesName.familyDetail);
                          },
                          primaryButtonTxt: 'View'),
                      BookingCartWidget(
                          ontapView: () {
                            Navigator.pushNamed(
                                context, RoutesName.familyDetail);
                          },
                          primaryButtonTxt: 'View'),
                      BookingCartWidget(
                          ontapView: () {
                            Navigator.pushNamed(
                                context, RoutesName.familyDetail);
                          },
                          primaryButtonTxt: 'View'),
                      BookingCartWidget(
                          ontapView: () {
                            Navigator.pushNamed(
                                context, RoutesName.familyDetail);
                          },
                          primaryButtonTxt: 'View'),
                      BookingCartWidget(
                          ontapView: () {
                            Navigator.pushNamed(
                                context, RoutesName.familyDetail);
                          },
                          primaryButtonTxt: 'View'),
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
