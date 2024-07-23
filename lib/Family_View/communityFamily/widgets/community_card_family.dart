import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_fairy/utils/routes/routes_name.dart';
import '../../../res/components/colors.dart';
import '../../../res/components/widgets/vertical_spacing.dart';

class CommunituCartWidgetFamily extends StatelessWidget {
  const CommunituCartWidgetFamily({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, RoutesName.communityDetailView);
      },
      child: Container(
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
        height: 309,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Container(
                height: 140,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/community.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const VerticalSpeacing(10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'New cleaning of babies care',
                    style: GoogleFonts.getFont(
                      "Poppins",
                      textStyle: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: AppColor.blackColor,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(12),
                          bottomLeft: Radius.circular(12)),
                      color: AppColor.avatarColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Center(
                        child: Text(
                          '10 Comment',
                          style: GoogleFonts.getFont(
                            "Poppins",
                            textStyle: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColor.whiteColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const VerticalSpeacing(10.0),
              Wrap(
                children: [
                  Text(
                    'Welcome to www.saydulmoon.info. Officia irure irure anim nisi exercitation velit cupidatat qui Lorem id ad. ',
                    style: GoogleFonts.getFont(
                      "Poppins",
                      textStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColor.grayColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
