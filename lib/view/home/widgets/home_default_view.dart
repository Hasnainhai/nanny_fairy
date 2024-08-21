import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_fairy/ViewModel/provider_home_view_model.dart';
import 'package:nanny_fairy/res/components/colors.dart';
import 'package:nanny_fairy/res/components/widgets/shimmer_effect.dart';
import 'package:nanny_fairy/res/components/widgets/vertical_spacing.dart';
import 'package:nanny_fairy/utils/routes/routes_name.dart';
import 'package:nanny_fairy/view/booked/widgets/booking_widget.dart';
import 'package:nanny_fairy/view/home/widgets/home_feature_widget.dart';
import 'package:nanny_fairy/view/job/family_detail_provider.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class HomeDefaultView extends StatefulWidget {
  const HomeDefaultView({super.key});

  @override
  State<HomeDefaultView> createState() => _HomeDefaultViewState();
}

class _HomeDefaultViewState extends State<HomeDefaultView> {
  @override
  Widget build(BuildContext context) {
    final homeViewModel = Provider.of<ProviderHomeViewModel>(context);

    return Column(
      children: [
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
        SizedBox(
          height: 140,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(width: 16),
                FutureBuilder(
                    future: homeViewModel.getPopularJobs(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: const HomeFeatureContainer(
                              txColor: AppColor.blackColor,
                              img: 'images/families.png',
                              title: '12',
                              subTitle: 'Total Families',
                              bgColor: AppColor.whiteColor,
                            ));
                      } else if (snapshot.hasData) {
                        return HomeFeatureContainer(
                          txColor: AppColor.blackColor,
                          img: 'images/families.png',
                          title: snapshot.data!.length.toString(),
                          subTitle: 'Total Families',
                          bgColor: AppColor.whiteColor,
                        );
                      } else {
                        return const HomeFeatureContainer(
                          txColor: AppColor.blackColor,
                          img: 'images/families.png',
                          title: '0',
                          subTitle: 'Total Families',
                          bgColor: AppColor.whiteColor,
                        );
                      }
                    }),
                const SizedBox(width: 16),
                const HomeFeatureContainer(
                  txColor: AppColor.blackColor,
                  bgColor: AppColor.whiteColor,
                  img: 'images/chats.png',
                  title: '10',
                  subTitle: 'Total Chats',
                ),
                const SizedBox(width: 16),
                const HomeFeatureContainer(
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
                child: FutureBuilder(
                  future: homeViewModel.getPopularJobs(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const ShimmerUi();
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (snapshot.hasData) {
                      Map<dynamic, dynamic> bookings =
                          snapshot.data as Map<dynamic, dynamic>;
                      List<Widget> bookingWidgets = [];

                      bookings.forEach(
                        (key, value) {
                          List<String> passions =
                              (value['FamilyPassions'] as List<dynamic>)
                                  .cast<String>();

                          bookingWidgets.add(
                            BookingCartWidget(
                              primaryButtonTxt: 'View',
                              ontapView: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (c) => FamilyDetailProvider(
                                      name:
                                          " ${value['firstName']} ${value['lastName']}",
                                      bio: value['bio'] ?? '',
                                      profile: value['profile'],
                                      familyId: value['uid'],
                                    ),
                                  ),
                                );
                              },
                              name:
                                  "${value['firstName']} ${value['lastName']}",
                              profilePic: value['profile'],
                              passion: passions,
                            ),
                          );
                        },
                      );

                      return SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: bookingWidgets,
                        ),
                      );
                    } else {
                      return const Center(child: Text('No data available'));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
