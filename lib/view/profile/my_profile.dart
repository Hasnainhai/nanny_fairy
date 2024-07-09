import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_fairy/res/components/widgets/vertical_spacing.dart';
import 'package:nanny_fairy/utils/routes/routes_name.dart';

import '../../res/components/colors.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondaryBgColor,
      appBar: AppBar(
        backgroundColor: AppColor.secondaryBgColor,
        title: Text(
          'your profile details',
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
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, RoutesName.editProfile);
              },
              icon: const Icon(
                Icons.border_color_outlined,
                color: AppColor.blackColor,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0, left: 16.0, right: 16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            color: AppColor.whiteColor,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      text: 'Name\n\n',
                      style: GoogleFonts.getFont(
                        "Poppins",
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColor.blackColor,
                        ),
                      ),
                      children: [
                        TextSpan(
                          text: 'Hassnain Haider',
                          style: GoogleFonts.getFont(
                            "Poppins",
                            textStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColor.blackColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const VerticalSpeacing(16.0),
                  Text.rich(
                    TextSpan(
                      text: 'Address\n\n',
                      style: GoogleFonts.getFont(
                        "Poppins",
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColor.blackColor,
                        ),
                      ),
                      children: [
                        TextSpan(
                          text: 'E-11 block Islamabad',
                          style: GoogleFonts.getFont(
                            "Poppins",
                            textStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColor.blackColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const VerticalSpeacing(16.0),
                  Text.rich(
                    TextSpan(
                      text: 'Hourly Rate\n\n',
                      style: GoogleFonts.getFont(
                        "Poppins",
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColor.blackColor,
                        ),
                      ),
                      children: [
                        TextSpan(
                          text: '\$50',
                          style: GoogleFonts.getFont(
                            "Poppins",
                            textStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColor.blackColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const VerticalSpeacing(16.0),
                  Text.rich(
                    TextSpan(
                      text: 'TelePhone Number\n\n',
                      style: GoogleFonts.getFont(
                        "Poppins",
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColor.blackColor,
                        ),
                      ),
                      children: [
                        TextSpan(
                          text: '+923129739152',
                          style: GoogleFonts.getFont(
                            "Poppins",
                            textStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColor.blackColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const VerticalSpeacing(16.0),
                  Text.rich(
                    TextSpan(
                      text: 'Date of Birdth\n\n',
                      style: GoogleFonts.getFont(
                        "Poppins",
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColor.blackColor,
                        ),
                      ),
                      children: [
                        TextSpan(
                          text: '12/11/2003',
                          style: GoogleFonts.getFont(
                            "Poppins",
                            textStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColor.blackColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const VerticalSpeacing(16.0),
                  Text.rich(
                    TextSpan(
                      text: 'Email Address\n\n',
                      style: GoogleFonts.getFont(
                        "Poppins",
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColor.blackColor,
                        ),
                      ),
                      children: [
                        TextSpan(
                          text: 'Hassnain@gmail.com',
                          style: GoogleFonts.getFont(
                            "Poppins",
                            textStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColor.blackColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const VerticalSpeacing(16.0),
                  Text.rich(
                    TextSpan(
                      text: 'Password\n\n',
                      style: GoogleFonts.getFont(
                        "Poppins",
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColor.blackColor,
                        ),
                      ),
                      children: [
                        TextSpan(
                          text: '***********',
                          style: GoogleFonts.getFont(
                            "Poppins",
                            textStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColor.blackColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const VerticalSpeacing(16.0),
                  Text.rich(
                    TextSpan(
                      text: 'Confirm Password\n\n',
                      style: GoogleFonts.getFont(
                        "Poppins",
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColor.blackColor,
                        ),
                      ),
                      children: [
                        TextSpan(
                          text: '*********',
                          style: GoogleFonts.getFont(
                            "Poppins",
                            textStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColor.blackColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const VerticalSpeacing(16.0),
                  Text.rich(
                    TextSpan(
                      text: 'Discription\n\n',
                      style: GoogleFonts.getFont(
                        "Poppins",
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColor.blackColor,
                        ),
                      ),
                      children: [
                        TextSpan(
                          text: 'my name is hasnain i am sofware engineer',
                          style: GoogleFonts.getFont(
                            "Poppins",
                            textStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColor.blackColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const VerticalSpeacing(16.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
