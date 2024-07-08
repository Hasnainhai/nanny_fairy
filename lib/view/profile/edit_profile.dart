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
                    maxLines: 1, text: 'Name', hintText: 'hassnain'),
                const VerticalSpeacing(16.0),
                const TextFieldCustom(
                    maxLines: 1, text: 'Address', hintText: 'E-11 Islamabad'),
                const VerticalSpeacing(16.0),
                const TextFieldCustom(
                    maxLines: 1,
                    text: 'Telephone Number',
                    hintText: '+923129739152'),
                const VerticalSpeacing(16.0),
                const TextFieldCustom(
                    maxLines: 1, text: 'Date of Birth', hintText: '1/02/2003'),
                const VerticalSpeacing(16.0),
                const TextFieldCustom(
                    maxLines: 1,
                    text: 'Email Address',
                    hintText: 'hassnain@gmail.com'),
                const VerticalSpeacing(16.0),
                const TextFieldCustom(
                    maxLines: 1, text: 'Password', hintText: '********'),
                const VerticalSpeacing(16.0),
                const TextFieldCustom(
                    maxLines: 1,
                    text: 'Confirm Password',
                    hintText: '*********'),
                const VerticalSpeacing(16.0),
                const TextFieldCustom(
                    maxLines: 1,
                    text: 'Description',
                    hintText: 'I am hasnain a sofware engineer'),
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
