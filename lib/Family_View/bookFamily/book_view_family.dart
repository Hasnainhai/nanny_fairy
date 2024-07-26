import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_fairy/Family_View/bookFamily/widgets/book_cart_widget_family.dart';
import '../../res/components/colors.dart';
import '../../res/components/widgets/vertical_spacing.dart';

class BookedViewFamily extends StatelessWidget {
  const BookedViewFamily({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondaryBgColor,
      appBar: PreferredSize(
        preferredSize: const Size.square(70),
        child: AppBar(
          backgroundColor: AppColor.primaryColor,
          automaticallyImplyLeading: false,
          title: Text(
            'Completed Booked',
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
        child: ListView(
          children: [
            Column(
              children: [
                const VerticalSpeacing(20.0),
                BookingCartWidgetFamily(
                  primaryButtonColor: AppColor.avatarColor,
                  ontapView: () {},
                  primaryButtonTxt: 'Completed',
                ),
                BookingCartWidgetFamily(
                  primaryButtonColor: AppColor.avatarColor,
                  ontapView: () {},
                  primaryButtonTxt: 'Completed',
                ),
                BookingCartWidgetFamily(
                  primaryButtonColor: AppColor.avatarColor,
                  ontapView: () {},
                  primaryButtonTxt: 'Completed',
                ),
                BookingCartWidgetFamily(
                  primaryButtonColor: AppColor.avatarColor,
                  ontapView: () {},
                  primaryButtonTxt: 'Completed',
                ),
                BookingCartWidgetFamily(
                  primaryButtonColor: AppColor.avatarColor,
                  ontapView: () {},
                  primaryButtonTxt: 'Completed',
                ),
                BookingCartWidgetFamily(
                  primaryButtonColor: AppColor.avatarColor,
                  ontapView: () {},
                  primaryButtonTxt: 'Completed',
                ),
                BookingCartWidgetFamily(
                  primaryButtonColor: AppColor.avatarColor,
                  ontapView: () {},
                  primaryButtonTxt: 'Completed',
                ),
                BookingCartWidgetFamily(
                  primaryButtonColor: AppColor.avatarColor,
                  ontapView: () {},

                  primaryButtonTxt: 'Completed',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
