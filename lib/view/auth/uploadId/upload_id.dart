import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_fairy/res/components/rounded_button.dart';
import 'package:nanny_fairy/res/components/widgets/vertical_spacing.dart';

import '../../../res/components/colors.dart';
import '../../../utils/routes/routes_name.dart';

class UploadId extends StatelessWidget {
  const UploadId({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondaryBgColor,
      appBar: PreferredSize(
        preferredSize: const Size.square(70),
        child: AppBar(
          backgroundColor: AppColor.primaryColor,
          elevation: 0.0,
          leading: IconButton(
            icon: const Icon(
              Icons.west,
              color: AppColor.whiteColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Id Details',
            style: GoogleFonts.getFont(
              "Poppins",
              textStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: AppColor.whiteColor,
              ),
            ),
          ),
          centerTitle: true,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Column(
          children: [
            const VerticalSpeacing(20.0),
            Container(
              height: 193,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColor.whiteColor,
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
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 56,
                      width: 56,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28),
                          color: AppColor.primaryColor),
                      child: const Center(
                        child: Icon(
                          Icons.image,
                          color: AppColor.whiteColor,
                        ),
                      ),
                    ),
                    Text(
                      'please upload id front picture',
                      style: GoogleFonts.getFont(
                        "Poppins",
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: AppColor.blackColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const VerticalSpeacing(20.0),
            Container(
              height: 193,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColor.whiteColor,
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
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 56,
                      width: 56,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28),
                          color: AppColor.primaryColor),
                      child: const Center(
                        child: Icon(
                          Icons.image,
                          color: AppColor.whiteColor,
                        ),
                      ),
                    ),
                    Text(
                      'please upload id back picture',
                      style: GoogleFonts.getFont(
                        "Poppins",
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: AppColor.blackColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const VerticalSpeacing(46.0),
            RoundedButton(
                title: 'Continue',
                onpress: () {
                  Navigator.pushNamed(context, RoutesName.uploadImg);
                }),
          ],
        ),
      ),
    );
  }
}
