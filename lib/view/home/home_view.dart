import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_fairy/res/components/colors.dart';
import 'package:nanny_fairy/res/components/searchBar.dart';
import 'package:nanny_fairy/res/components/widgets/vertical_spacing.dart';
import 'package:nanny_fairy/utils/routes/routes_name.dart';
import 'package:nanny_fairy/view/home/widgets/home_feature_widget.dart';
import '../booked/widgets/booking_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
                  child:SearchBarProvider(
                    onTapFilter: (){
                      Navigator.pushNamed(context, RoutesName.filterPopup);
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
                    'This month',
                    style: GoogleFonts.getFont(
                      "Poppins",
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColor.blackColor,
                      ),
                    ),
                  ),
                  Text(
                    'All reports',
                    style: GoogleFonts.getFont(
                      "Poppins",
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColor.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const VerticalSpeacing(10),
            const SizedBox(
              height: 140,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(width: 16),
                    HomeFeatureContainer(
                      txColor: AppColor.blackColor,
                      img: 'images/families.png',
                      title: '100k',
                      subTitle: 'Total Families',
                      bgColor: AppColor.whiteColor,
                    ),
                    SizedBox(width: 16),
                    HomeFeatureContainer(
                      txColor: AppColor.blackColor,
                      bgColor: AppColor.whiteColor,
                      img: 'images/chats.png',
                      title: '10',
                      subTitle: 'Total Chats',
                    ),
                    SizedBox(width: 16),
                    HomeFeatureContainer(
                      txColor: AppColor.blackColor,
                      bgColor: AppColor.whiteColor,
                      img: 'images/families.png',
                      title: '100k',
                      subTitle: 'Total Families',
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
                        'popular jobs',
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
                          Navigator.pushNamed(context, RoutesName.jobView);
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
                          BookingCartWidget(
                            primaryButtonTxt: 'View',
                            ontapView: () {
                              Navigator.pushNamed(
                                  context, RoutesName.familyDetail);
                            },
                          ),
                          BookingCartWidget(
                            ontapView: () {
                              Navigator.pushNamed(
                                  context, RoutesName.familyDetail);
                            },
                            primaryButtonTxt: 'View',
                          ),
                          BookingCartWidget(
                            ontapView: () {
                              Navigator.pushNamed(
                                  context, RoutesName.familyDetail);
                            },
                            primaryButtonTxt: 'View',
                          ),
                          BookingCartWidget(
                            ontapView: () {
                              Navigator.pushNamed(
                                  context, RoutesName.familyDetail);
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

