import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_fairy/res/components/toggle_widget.dart';
import 'package:nanny_fairy/res/components/widgets/vertical_spacing.dart';
import '../../res/components/colors.dart';
import '../../res/components/day_button.dart';
import '../../view/auth/signup/availability_view.dart';

class SettingsFamilyView extends StatelessWidget {
  const SettingsFamilyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondaryBgColor,
      appBar: AppBar(
        backgroundColor: AppColor.secondaryBgColor,
        title: Text(
          'Settings',
          style: GoogleFonts.getFont(
            "Poppins",
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: AppColor.blackColor,
            ),
          ),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.west,
              color: AppColor.blackColor,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VerticalSpeacing(16.0),
              Container(
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
                      color: const Color(0xff1B81BC).withOpacity(
                          0.1), // Drop shadow color with 4% opacity
                      blurRadius: 2,
                      offset: const Offset(1, 2),
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Availability',
                                style: GoogleFonts.getFont(
                                  "Poppins",
                                  textStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.blackColor,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Officia irure irure an',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppColor.grayColor,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 28,
                            width: 45,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: AppColor.primaryColor),
                            child: const Center(
                              child: Text(
                                'Edit',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppColor.whiteColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          DayButton(
                            day: 'M',
                            isSelected: false,
                            onTap: (bool isSelected) {},
                          ),
                          const SizedBox(width: 8),
                          DayButton(
                            day: 'T',
                            isSelected: false,
                            onTap: (bool isSelected) {},
                          ),
                          const SizedBox(width: 8),
                          DayButton(
                            day: 'W',
                            isSelected: true,
                            onTap: (bool isSelected) {},
                          ),
                          const SizedBox(width: 8),
                          DayButton(
                            day: 'T',
                            isSelected: false,
                            onTap: (bool isSelected) {},
                          ),
                          const SizedBox(width: 8),
                          DayButton(
                            day: 'F',
                            isSelected: true,
                            onTap: (bool isSelected) {},
                          ),
                          const SizedBox(width: 8),
                          DayButton(
                            day: 'S',
                            isSelected: false,
                            onTap: (bool isSelected) {},
                          ),
                          const SizedBox(width: 8),
                          DayButton(
                            day: 'S',
                            isSelected: false,
                            onTap: (bool isSelected) {},
                          ),
                          const SizedBox(width: 8),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const AvailabilityRow(
                        label: 'Morning',
                        availability: [
                          true,
                          true,
                          false,
                          false,
                          false,
                          false,
                          false
                        ],
                        timePeriod: 'Morning',
                      ),
                      const Divider(),
                      const AvailabilityRow(
                        label: 'Afternoon',
                        availability: [
                          false,
                          false,
                          false,
                          true,
                          false,
                          false,
                          false
                        ],
                        timePeriod: 'Afternoon',
                      ),
                      const Divider(),
                      const AvailabilityRow(
                        label: 'Evening',
                        availability: [
                          false,
                          false,
                          false,
                          false,
                          false,
                          true,
                          false
                        ],
                        timePeriod: 'Evening',
                      ),
                      const VerticalSpeacing(10),
                    ],
                  ),
                ),
              ),
              VerticalSpeacing(16.0),
              Container(
                height: 216,
                width: double.infinity,
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
                      color: const Color(0xff1B81BC).withOpacity(
                          0.1), // Drop shadow color with 4% opacity
                      blurRadius: 2,
                      offset: const Offset(1, 2),
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Timing',
                            style: GoogleFonts.getFont(
                              "Poppins",
                              textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: AppColor.blackColor,
                              ),
                            ),
                          ),
                          Container(
                            height: 28,
                            width: 45,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: AppColor.primaryColor),
                            child: const Center(
                              child: Text(
                                'Edit',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppColor.whiteColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      VerticalSpeacing(16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Morning',
                            style: GoogleFonts.getFont(
                              "Poppins",
                              textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: AppColor.blackColor,
                              ),
                            ),
                          ),
                          Text(
                            '6:am to 7:am',
                            style: GoogleFonts.getFont(
                              "Poppins",
                              textStyle: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: AppColor.primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      VerticalSpeacing(16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Afternoon',
                            style: GoogleFonts.getFont(
                              "Poppins",
                              textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: AppColor.blackColor,
                              ),
                            ),
                          ),
                          Text(
                            '10:pm to 11:pm',
                            style: GoogleFonts.getFont(
                              "Poppins",
                              textStyle: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: AppColor.primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      VerticalSpeacing(16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Evening',
                            style: GoogleFonts.getFont(
                              "Poppins",
                              textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: AppColor.blackColor,
                              ),
                            ),
                          ),
                          Text(
                            '1:pm to 2:am',
                            style: GoogleFonts.getFont(
                              "Poppins",
                              textStyle: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: AppColor.primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const VerticalSpeacing(16.0),
              Text(
                'Notification',
                style: GoogleFonts.getFont(
                  "Poppins",
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColor.blackColor,
                  ),
                ),
              ),
              const VerticalSpeacing(16.0),
              Container(
                height: 146,
                width: double.infinity,
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
                      color: const Color(0xff1B81BC).withOpacity(
                          0.1), // Drop shadow color with 4% opacity
                      blurRadius: 2,
                      offset: const Offset(1, 2),
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email',
                        style: GoogleFonts.getFont(
                          "Poppins",
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColor.blackColor,
                          ),
                        ),
                      ),
                      const VerticalSpeacing(16.0),
                      const ToggleWidget(title: 'promotioneel'),
                      const VerticalSpeacing(16.0),
                      const ToggleWidget(title: 'Status updates over bookigen'),
                    ],
                  ),
                ),
              ),
              const VerticalSpeacing(24.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Account',
                    style: GoogleFonts.getFont(
                      "Poppins",
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColor.blackColor,
                      ),
                    ),
                  ),
                  Text(
                    'Deactivr of verwijderen',
                    style: GoogleFonts.getFont(
                      "Poppins",
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColor.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              const VerticalSpeacing(10.0),
              Container(
                height: 146,
                width: double.infinity,
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
                      color: const Color(0xff1B81BC).withOpacity(
                          0.1), // Drop shadow color with 4% opacity
                      blurRadius: 2,
                      offset: const Offset(1, 2),
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const VerticalSpeacing(16.0),
                      Text(
                        'email address',
                        style: GoogleFonts.getFont(
                          "Poppins",
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColor.blackColor,
                          ),
                        ),
                      ),
                      Text(
                        'hasnain@gmail.com',
                        style: GoogleFonts.getFont(
                          "Poppins",
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColor.blackColor,
                          ),
                        ),
                      ),
                      const VerticalSpeacing(16.0),
                      Text(
                        'watchwood',
                        style: GoogleFonts.getFont(
                          "Poppins",
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColor.blackColor,
                          ),
                        ),
                      ),
                      Text(
                        '***********',
                        style: GoogleFonts.getFont(
                          "Poppins",
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColor.blackColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
