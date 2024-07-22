import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_fairy/res/components/rounded_button.dart';
import 'package:nanny_fairy/res/components/widgets/custom_text_field.dart';
import 'package:nanny_fairy/res/components/widgets/vertical_spacing.dart';
import 'package:nanny_fairy/utils/routes/routes_name.dart';

import '../../res/components/colors.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: PreferredSize(
        preferredSize: const Size.square(70),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.west,
                color: AppColor.whiteColor,
              )),
          title: Text(
            'Edit Profile',
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
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0, right: 16.0, left: 16.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                const TextFieldCustom(
                  prefixIcon: Icon(Icons.person_outline),
                    maxLines: 1, hintText: 'Name'),
                const VerticalSpeacing(16.0),
                const TextFieldCustom(
                    prefixIcon: Icon(Icons.location_on_outlined),
                    maxLines: 1, hintText: 'Address'),
                const VerticalSpeacing(16.0),
                const TextFieldCustom(
                    prefixIcon: Icon(Icons.access_time_outlined),
                    maxLines: 1,
                    hintText: 'Enter hourly rate...'),
                const VerticalSpeacing(16.0),
                const TextFieldCustom(
                    prefixIcon: Icon(Icons.phone),
                    maxLines: 1,
                    hintText: 'Telephone Number'),
                const VerticalSpeacing(16.0),
                const TextFieldCustom(
                    prefixIcon: Icon(Icons.calendar_month_outlined),
                    maxLines: 1, hintText: 'Date of Birth'),
                const VerticalSpeacing(16.0),
                const TextFieldCustom(
                    prefixIcon: Icon(Icons.mail_outline),
                    maxLines: 1,
                    hintText: 'Email Address'),
                const VerticalSpeacing(16.0),
                const TextFieldCustom(
                    prefixIcon: Icon(Icons.border_color_outlined),
                    maxLines: 1,
                    hintText: 'Description'),
                const VerticalSpeacing(16.0),


                const TextFieldCustom(
                    prefixIcon: Icon(Icons.inventory_outlined),
                    maxLines: 1,
                    hintText: 'Skills...'),
                const VerticalSpeacing(16.0),
                RoundedButton(
                    title: 'Update Profile',
                    onpress: () {
                      Navigator.pushNamed(context, RoutesName.myProfile);
                    }),
                const VerticalSpeacing(30.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
