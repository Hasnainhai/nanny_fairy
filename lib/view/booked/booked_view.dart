import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_fairy/view/booked/widgets/booking_widget.dart';
import '../../res/components/colors.dart';
import '../../res/components/widgets/vertical_spacing.dart';

class BookedView extends StatelessWidget {
  const BookedView({super.key});

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
        padding: const EdgeInsets.only(left: 2.0, right: 1.0),
        child: ListView(
          children:  [
            Column(
              children: [
                const VerticalSpeacing(20.0),
                BookingCartWidget(ontapView: () {  },primaryButtonTxt: 'Completed',),
                BookingCartWidget(ontapView: () {  },primaryButtonTxt: 'Completed',),
                BookingCartWidget(ontapView: () {  },primaryButtonTxt: 'Completed',),
                BookingCartWidget(ontapView: () {  },primaryButtonTxt: 'Completed',),
                BookingCartWidget(ontapView: () {  },primaryButtonTxt: 'Completed',),
                BookingCartWidget(ontapView: () {  },primaryButtonTxt: 'Completed',),
                BookingCartWidget(ontapView: () {  },primaryButtonTxt: 'Completed',),
                BookingCartWidget(ontapView: () {  },primaryButtonTxt: 'Completed',),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
