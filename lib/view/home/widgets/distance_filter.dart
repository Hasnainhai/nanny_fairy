import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_fairy/res/components/colors.dart';
import 'package:nanny_fairy/res/components/widgets/vertical_spacing.dart';
import 'package:nanny_fairy/view/booked/widgets/booking_widget.dart';
import 'package:nanny_fairy/view/job/family_detail_provider.dart';
import 'package:nanny_fairy/repository/provider_distance_repository.dart';
import 'package:provider/provider.dart';

class HomeDistanceView extends StatefulWidget {
  const HomeDistanceView({super.key});

  @override
  State<HomeDistanceView> createState() => _HomeDistanceViewState();
}

class _HomeDistanceViewState extends State<HomeDistanceView> {
  @override
  Widget build(BuildContext context) {
    // Accessing the provider and printing debug information
    final providerDistanceRepository =
        Provider.of<ProviderDistanceRepository>(context, listen: false);
    print(
        'ProviderDistanceRepository is available: ${providerDistanceRepository.distanceFilteredFamilies != null}');

    return Consumer<ProviderDistanceRepository>(
      builder: (context, providerDistanceRepository, child) {
        // Debugging: Print the filtered families
        print(
            'ProviderDistanceRepository data: ${providerDistanceRepository.distanceFilteredFamilies}');

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
                          debugPrint("Clear All tapped");
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
                    child: providerDistanceRepository
                            .distanceFilteredFamilies.isEmpty
                        ? const Center(child: Text('No data available'))
                        : SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              children: providerDistanceRepository
                                  .distanceFilteredFamilies
                                  .map((family) {
                                try {
                                  // Ensure `family` contains expected data
                                  List<String> passions =
                                      (family['FamilyPassions']
                                                  as List<dynamic>?)
                                              ?.cast<String>() ??
                                          [];
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
                                                ratingsData['totalRatings'] ??
                                                    '0'),
                                          ),
                                        ),
                                      );
                                    },
                                    name:
                                        "${family['firstName']} ${family['lastName']}",
                                    profilePic: family['profile'],
                                    passion: passions,
                                    ratings: averageRating,
                                    totalRatings: int.parse(
                                        ratingsData['totalRatings'] ?? '0'),
                                  );
                                } catch (e) {
                                  // Handle potential errors with data mapping
                                  print('Error processing family data: $e');
                                  return const SizedBox(); // Return an empty widget on error
                                }
                              }).toList(),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Map<String, String> getRatingsAndTotalRatings(Map<dynamic, dynamic>? value) {
    if (value == null) return {'ratings': 'N/A', 'totalRatings': '0'};
    String ratings = value['countRatingStars']?.toString() ?? 'N/A';
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
    return reviews.length > 0 ? totalRating / reviews.length : 0.0;
  }
}
