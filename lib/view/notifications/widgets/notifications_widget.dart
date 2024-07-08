import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../res/components/colors.dart';

class NotificationsWidget extends StatelessWidget {
  const NotificationsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 94,
      width: double.infinity,
      child: ListTile(
        leading: Container(
          height: 50,
          width: 50,
          color: AppColor.primaryColor,
          child: const Center(
            child: Icon(
              Icons.notifications,
              color: AppColor.whiteColor,
            ),
          ),
        ),
        title: Text(
          'Notifications',
          style: GoogleFonts.getFont(
            "Poppins",
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColor.blackColor,
            ),
          ),
        ),
        subtitle: Text(
          'Hot Deal Buy one get free one Offer Hery...',
          style: GoogleFonts.getFont(
            "Poppins",
            textStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColor.grayColor,
            ),
          ),
        ),
      ),
    );
  }
}
