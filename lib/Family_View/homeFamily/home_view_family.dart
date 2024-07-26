import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_fairy/Family_View/homeFamily/widgets/home_Family_feature_widget.dart';
import 'package:nanny_fairy/res/components/colors.dart';
import 'package:nanny_fairy/res/components/searchBar.dart';
import 'package:nanny_fairy/res/components/widgets/vertical_spacing.dart';
import '../../utils/routes/routes_name.dart';
import '../bookFamily/widgets/book_cart_widget_family.dart';

class HomeViewFamily extends StatefulWidget {
  const HomeViewFamily({super.key});

  @override
  State<HomeViewFamily> createState() => _HomeViewFamilyState();
}

class _HomeViewFamilyState extends State<HomeViewFamily> {
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
                  child: SearchBarProvider(
                    onTapFilter: () {
                      Navigator.pushNamed(
                          context, RoutesName.filterPopUpFamily);
                    },
                  ),
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
              height: 120,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(width: 16),
                    HomeFeatureContainerFamily(
                      bgColor: Color(0xff51A1BA),
                      img: 'images/cleaning.png',
                      title: 'Cleaning',
                      txColor: AppColor.whiteColor,
                    ),
                    SizedBox(width: 16),
                    HomeFeatureContainerFamily(
                      txColor: AppColor.whiteColor,
                      bgColor: Color(0xffFEAA48),
                      img: 'images/homeSitter.png',
                      title: 'Sitter',
                    ),
                    SizedBox(width: 16),
                    HomeFeatureContainerFamily(
                      txColor: AppColor.whiteColor,
                      bgColor: Color(0xffDDC912),
                      img: 'images/cleaning.png',
                      title: 'Eiderly',
                    ),
                    SizedBox(width: 16),
                    HomeFeatureContainerFamily(
                      txColor: AppColor.whiteColor,
                      bgColor: Color(0xffFEAA48),
                      img: 'images/homeSitter.png',
                      title: 'Sitter',
                    ),
                    SizedBox(width: 16),
                    HomeFeatureContainerFamily(
                      txColor: AppColor.whiteColor,
                      bgColor: Color(0xffDDC912),
                      img: 'images/cleaning.png',
                      title: 'Eiderly',
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
                          Navigator.pushNamed(
                              context, RoutesName.jobViewFamily);
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
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          BookingCartWidgetFamily(
                            primaryButtonColor: AppColor.primaryColor,
                            primaryButtonTxt: 'View',
                            ontapView: () {
                              Navigator.pushNamed(
                                  context, RoutesName.providerDetails);
                            },
                          ),
                          BookingCartWidgetFamily(
                            primaryButtonColor: AppColor.primaryColor,
                            ontapView: () {
                              Navigator.pushNamed(
                                  context, RoutesName.providerDetails);
                            },
                            primaryButtonTxt: 'View',
                          ),
                          BookingCartWidgetFamily(
                            primaryButtonColor: AppColor.primaryColor,
                            ontapView: () {
                              Navigator.pushNamed(
                                  context, RoutesName.providerDetails);
                            },
                            primaryButtonTxt: 'View',
                          ),
                          BookingCartWidgetFamily(
                            primaryButtonColor: AppColor.primaryColor,
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
