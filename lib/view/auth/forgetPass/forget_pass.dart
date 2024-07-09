import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_fairy/res/components/rounded_button.dart';
import 'package:nanny_fairy/res/components/widgets/custom_text_field.dart';
import 'package:nanny_fairy/res/components/widgets/vertical_spacing.dart';
import '../../../res/components/colors.dart';

class ForgetPass extends StatelessWidget {
  const ForgetPass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondaryBgColor,
      appBar: AppBar(
        backgroundColor: AppColor.whiteColor,
        leading: IconButton(
          icon: const Icon(
            Icons.west,
            color: AppColor.blackColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Forget Password',
          style: GoogleFonts.getFont(
            "Poppins",
            textStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: AppColor.blackColor,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 30.0),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          color: AppColor.whiteColor,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Reset your password',
                    style: GoogleFonts.getFont(
                      "Poppins",
                      textStyle: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        color: AppColor.blackColor,
                      ),
                    ),
                  ),
                  const VerticalSpeacing(20.0),
                  Text(
                    'we will send a reset password link\nto your email',
                    style: GoogleFonts.getFont(
                      "Poppins",
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: AppColor.grayColor,
                      ),
                    ),
                  ),
                  const VerticalSpeacing(20.0),
                  const TextFieldCustom(
                      maxLines: 1,
                      text: 'Phone Number',
                      hintText: 'hasnainDev@gmail.com'),
                  const VerticalSpeacing(16.0),
                  RoundedButton(title: 'Send Me Link', onpress: () {
                    Navigator.pop(context);
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
