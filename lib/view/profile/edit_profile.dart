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
        height: double.infinity,
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
                    maxLines: 1, hintText: 'Name'),
                const VerticalSpeacing(16.0),
                const TextFieldCustom(
                    maxLines: 1, hintText: 'Address'),
                const VerticalSpeacing(16.0),
                const TextFieldCustom(
                    maxLines: 1,
                    hintText: 'Enter hourly rate...'),
                const VerticalSpeacing(16.0),
                const TextFieldCustom(
                    maxLines: 1,
                    hintText: 'Telephone Number'),
                const VerticalSpeacing(16.0),
                const TextFieldCustom(
                    maxLines: 1, hintText: 'Date of Birth'),
                const VerticalSpeacing(16.0),
                const TextFieldCustom(
                    maxLines: 1,
                    hintText: 'Email Address'),
                const VerticalSpeacing(16.0),
                const TextFieldCustom(
                    maxLines: 1, hintText: 'Password'),
                const VerticalSpeacing(16.0),
                const TextFieldCustom(
                    maxLines: 1,
                    hintText: 'Confirm Password'),
                const VerticalSpeacing(16.0),
                const TextFieldCustom(
                    maxLines: 1,
                    hintText: 'Description'),
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
