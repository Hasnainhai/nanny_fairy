

import 'package:flutter/cupertino.dart';
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

          title:  Text('Start Booking Jobs',
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

      body: Padding(padding: const EdgeInsets.only(left: 16.0,right: 16.0),child: ListView(
        children: [
          Column(
            children: [
              const  VerticalSpeacing(10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const  Icon(Icons.filter_alt_outlined,color: AppColor.primaryColor,),
                      const  SizedBox(width: 5.0),
                      Text('Filters',
                        style: GoogleFonts.getFont(
                          "Poppins",
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColor.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const  Icon(Icons.filter_list,color: AppColor.primaryColor,),
                      const  SizedBox(width: 5.0),
                      Text('Start Booking Jobs',
                        style: GoogleFonts.getFont(
                          "Poppins",
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColor.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Divider(),
              VerticalSpeacing(20.0),
              Column(
                children: [
                  BookingCartWidget(),
                  BookingCartWidget(),
                  BookingCartWidget(),
                  BookingCartWidget(),
                  BookingCartWidget(),
                  BookingCartWidget(),
                  BookingCartWidget(),
                  BookingCartWidget(),

                ],
              ),
            ],
          ),
        ],
      ),),
    );
  }
}



