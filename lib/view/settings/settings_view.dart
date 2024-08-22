import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_fairy/res/components/toggle_widget.dart';
import 'package:nanny_fairy/res/components/widgets/vertical_spacing.dart';
import '../../res/components/colors.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                    color: const Color(0xff1B81BC)
                        .withOpacity(0.1), // Drop shadow color with 4% opacity
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
                // Text(
                //   'Deactivr of verwijderen',
                //   style: GoogleFonts.getFont(
                //     "Poppins",
                //     textStyle: const TextStyle(
                //       fontSize: 16,
                //       fontWeight: FontWeight.w400,
                //       color: AppColor.primaryColor,
                //     ),
                //   ),
                // ),
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
                    color: const Color(0xff1B81BC)
                        .withOpacity(0.1), // Drop shadow color with 4% opacity
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
    );
  }
}
