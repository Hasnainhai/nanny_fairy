import 'package:flutter/material.dart';
import 'package:nanny_fairy/FamilyController/family_home_controller.dart';
import 'package:nanny_fairy/Family_View/homeFamily/widgets/bookCart_home_widget.dart';
import 'package:nanny_fairy/res/components/colors.dart';
import 'package:nanny_fairy/res/components/widgets/shimmer_effect.dart';
import 'package:provider/provider.dart';

class FamilyJobDefaultSection extends StatefulWidget {
  const FamilyJobDefaultSection({super.key});

  @override
  State<FamilyJobDefaultSection> createState() =>
      _FamilyJobDefaultSectionState();
}

class _FamilyJobDefaultSectionState extends State<FamilyJobDefaultSection> {
  @override
  Widget build(BuildContext context) {
    final familyhomeController = Provider.of<FamilyHomeController>(context);

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: FutureBuilder(
          future: familyhomeController.getPopularJobs(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const ShimmerUi();
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              Map<dynamic, dynamic> bookings =
                  snapshot.data as Map<dynamic, dynamic>;
              List<Widget> bookingWidgets = [];

              bookings.forEach((key, value) {
                if (value['Availability'] is Map) {
                  Map<String, dynamic> availabilityMap =
                      Map<String, dynamic>.from(value['Availability']);
                  Set<String> daysSet = {};
                  availabilityMap.forEach((timeOfDay, daysMap) {
                    if (daysMap is Map) {
                      daysMap.forEach((day, isAvailable) {
                        if (isAvailable && !daysSet.contains(day)) {
                          daysSet.add(day.substring(0, 1).toUpperCase());
                        }
                      });
                    }
                  });

                  List<Widget> dayButtons = daysSet.map((dayAbbreviation) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: DayButtonFamily(day: dayAbbreviation),
                    );
                  }).toList();

                  bookingWidgets.add(
                    BookingCartWidgetHome(
                      primaryButtonColor: AppColor.primaryColor,
                      primaryButtonTxt: 'View',
                      ontapView: () {},
                      profile: value['profile'],
                      name: "${value['firstName']} ${value['lastName']}",
                      degree: value['education'],
                      skill: '',
                      hoursRate: value['hoursrate'],
                      dayButtons: dayButtons,
                    ),
                  );
                } else {
                  bookingWidgets.add(
                    const Center(child: Text('Invalid data format')),
                  );
                }
              });

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
    );
  }
}

class DayButtonFamily extends StatefulWidget {
  final String day;

  const DayButtonFamily({
    super.key,
    required this.day,
  });

  @override
  _DayButtonFamilyState createState() => _DayButtonFamilyState();
}

class _DayButtonFamilyState extends State<DayButtonFamily> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15,
      width: 15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: Colors.transparent,
        border: Border.all(color: Colors.grey),
      ),
      child: Center(
        child: Text(
          widget.day,
          style: const TextStyle(
            fontSize: 8,
            color: AppColor.blackColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
