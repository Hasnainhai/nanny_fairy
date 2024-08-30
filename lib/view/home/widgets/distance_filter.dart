import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_fairy/res/components/colors.dart';
import 'package:nanny_fairy/res/components/widgets/vertical_spacing.dart';
import 'package:nanny_fairy/utils/routes/routes_name.dart';
import 'package:nanny_fairy/view/booked/widgets/booking_widget.dart';
import 'package:nanny_fairy/view/job/family_detail_provider.dart';
import 'package:nanny_fairy/repository/provider_distance_repository.dart';

class HomeDistanceView extends StatefulWidget {
  const HomeDistanceView({super.key});

  @override
  State<HomeDistanceView> createState() => _HomeDistanceViewState();
}

class _HomeDistanceViewState extends State<HomeDistanceView> {
  Map<String, String> getRatingsAndTotalRatings(Map<dynamic, dynamic> value) {
    String ratings = value != null && value['countRatingStars'] != null
        ? value['countRatingStars'].toString()
        : 'N/A';
    String totalRatings =
        value['reviews'] != null ? value['reviews'].length.toString() : '0';

    return {
      'ratings': ratings,
      'totalRatings': totalRatings,
    };
  }

  double calculateAverageRating(Map<dynamic, dynamic> reviews) {
    if (reviews.isEmpty) return 0.0;
    double totalRating = 0.0;
    reviews.forEach((key, review) {
      totalRating += review['countRatingStars'] ?? 0.0;
    });
    return totalRating / reviews.length;
  }

  @override
  Widget build(BuildContext context) {
    ProviderDistanceRepository providerDistanceRepository =
        ProviderDistanceRepository();

    // Get the filtered families list directly from the repository

    return Column(
      children: [
        const VerticalSpeacing(16.0),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Filtered Families',
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
                      'Clear All',
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
                child:
                    providerDistanceRepository.distanceFilteredFamilies.isEmpty
                        ? const Center(child: Text('No data available'))
                        : SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              children: providerDistanceRepository
                                  .distanceFilteredFamilies
                                  .map((family) {
                                List<String> passions =
                                    (family['FamilyPassions'] as List<dynamic>)
                                        .cast<String>();
                                Map<String, String> ratingsData =
                                    getRatingsAndTotalRatings(family);
                                Map<dynamic, dynamic> reviews =
                                    family['reviews'] ?? {};
                                double averageRating =
                                    calculateAverageRating(reviews);

                                return BookingCartWidget(
                                  primaryButtonTxt: 'View',
                                  ontapView: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (c) => FamilyDetailProvider(
                                          name:
                                              "${family['firstName']} ${family['lastName']}",
                                          bio: family['bio'] ?? '',
                                          profile: family['profile'],
                                          familyId: family['uid'],
                                          ratings: averageRating,
                                          totalRatings: int.parse(
                                              ratingsData['totalRatings']!),
                                          passion: passions,
                                        ),
                                      ),
                                    );
                                  },
                                  name:
                                      "${family['firstName']} ${family['lastName']}",
                                  profilePic: family['profile'],
                                  passion: passions,
                                  ratings: averageRating,
                                  totalRatings:
                                      int.parse(ratingsData['totalRatings']!),
                                );
                              }).toList(),
                            ),
                          ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
