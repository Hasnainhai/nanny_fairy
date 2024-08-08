import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_fairy/ViewModel/provider_home_view_model.dart';
import 'package:nanny_fairy/res/components/colors.dart';
import 'package:nanny_fairy/res/components/widgets/vertical_spacing.dart';
import 'package:nanny_fairy/view/booked/widgets/booking_widget.dart';
import 'package:nanny_fairy/view/job/family_detail_provider.dart';
import 'package:provider/provider.dart';

class HomeSearchView extends StatefulWidget {
  const HomeSearchView({super.key});

  @override
  State<HomeSearchView> createState() => _HomeSearchViewState();
}

class _HomeSearchViewState extends State<HomeSearchView> {
  @override
  Widget build(BuildContext context) {
    final homeViewModel = Provider.of<ProviderHomeViewModel>(context);

    return Padding(
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
                onTap: () {},
                child: Text(
                  'Clear Search',
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
            child: FutureBuilder(
              future: homeViewModel.getPopularJobs(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
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
                                ),
                              ),
                            );
                          },
                          name: "${value['firstName']} ${value['lastName']}",
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
    );
  }
}
