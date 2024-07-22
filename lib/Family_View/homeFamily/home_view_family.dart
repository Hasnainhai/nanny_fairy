import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_fairy/res/components/colors.dart';
import 'package:nanny_fairy/res/components/widgets/vertical_spacing.dart';

import '../../utils/routes/routes_name.dart';
import '../../view/booked/widgets/booking_widget.dart';
import '../../view/home/widgets/home_feature_widget.dart';
import '../bookFamily/widgets/book_cart_widget_family.dart';

class HomeViewFamily extends StatelessWidget {
  const HomeViewFamily({super.key});

  @override
  Widget build(BuildContext context) {
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
                  child: Center(
                    child: ListTile(
                      leading: const CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(
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
                        'Aliza Zehra',
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
                  ),
                ),
                Positioned(
                  top: 159, // Adjust this value as needed
                  left: (MediaQuery.of(context).size.width - 320) /
                      2, // Center horizontally
                  child: const SearchBar(),
                ),
              ],
            ),
            const VerticalSpeacing(50.0),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Row(
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
                ],
              ),
            ),
            const VerticalSpeacing(10),
            const SizedBox(
              height: 150,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(width: 16),
                    HomeFeatureContainer(
                      bgColor: Color(0xff51A1BA),
                      img: 'images/cleaning.png',
                      title: '',
                      subTitle: 'Cleaning',
                      txColor: AppColor.whiteColor,
                    ),
                    SizedBox(width: 16),
                    HomeFeatureContainer(
                      txColor: AppColor.whiteColor,
                      bgColor: Color(0xffFEAA48),
                      img: 'images/homeSitter.png',
                      title: '',
                      subTitle: 'Home Sitter',
                    ),
                    SizedBox(width: 16),
                    HomeFeatureContainer(
                      txColor: AppColor.whiteColor,
                      bgColor: Color(0xffDDC912),
                      img: 'images/cleaning.png',
                      title: '',
                      subTitle: 'Eiderly',
                    ),
                  ],
                ),
              ),
            ),
            const VerticalSpeacing(16.0),
            Padding(
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
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          BookingCartWidgetFamily(
                            primaryButtonTxt: 'View',
                            ontapView: () {
                              Navigator.pushNamed(
                                  context, RoutesName.providerDetails);
                            },
                          ),
                          BookingCartWidgetFamily(
                            ontapView: () {
                              Navigator.pushNamed(
                                  context, RoutesName.providerDetails);
                            },
                            primaryButtonTxt: 'View',
                          ),
                          BookingCartWidgetFamily(
                            ontapView: () {
                              Navigator.pushNamed(
                                  context, RoutesName.providerDetails);
                            },
                            primaryButtonTxt: 'View',
                          ),
                          BookingCartWidgetFamily(
                            ontapView: () {
                              Navigator.pushNamed(
                                  context, RoutesName.providerDetails);
                            },
                            primaryButtonTxt: 'View',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
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
                onPressed: () {
                  Navigator.pushNamed(context, RoutesName.filterPopup);
                },
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
