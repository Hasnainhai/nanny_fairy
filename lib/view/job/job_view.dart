import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_fairy/res/components/widgets/vertical_spacing.dart';
import 'package:nanny_fairy/utils/routes/routes_name.dart';
import 'package:nanny_fairy/view/booked/widgets/booking_widget.dart';
import '../../res/components/colors.dart';

class JobView extends StatelessWidget {
  const JobView({super.key});

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
                  child: const SearchBar(),
                ),
              ],
            ),
            VerticalSpeacing(50),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.65,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Column(
                    children: [
                      BookingCartWidget(
                          ontapView: () {
                            Navigator.pushNamed(
                                context, RoutesName.findJobView);
                          },
                          primaryButtonTxt: 'View'),
                      BookingCartWidget(
                          ontapView: () {}, primaryButtonTxt: 'View'),
                      BookingCartWidget(
                          ontapView: () {}, primaryButtonTxt: 'View'),
                      BookingCartWidget(
                          ontapView: () {}, primaryButtonTxt: 'View'),
                      BookingCartWidget(
                          ontapView: () {}, primaryButtonTxt: 'View'),
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

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 320,
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          strokeAlign: BorderSide.strokeAlignCenter,
          color: const Color(0xff1B81BC)
              .withOpacity(0.10), // Stroke color with 10% opacity
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff1B81BC)
                .withOpacity(0.1), // Drop shadow color with 4% opacity
            blurRadius: 2,
            offset: const Offset(1, 2),
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 250,
            height: 50,
            child: TextFormField(
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search',
                  prefixIcon: Icon(
                    Icons.search,
                    color: AppColor.blackColor,
                  )),
            ),
          ),
          Container(
            height: 50,
            width: 56,
            decoration: const BoxDecoration(
              color: AppColor.boxFillColor,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12)),
            ),
            child: Center(
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.filter_alt_outlined,
                  color: AppColor.primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
