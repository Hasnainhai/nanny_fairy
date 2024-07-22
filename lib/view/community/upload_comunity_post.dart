import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_fairy/res/components/rounded_button.dart';
import 'package:nanny_fairy/res/components/widgets/custom_text_field.dart';
import 'package:nanny_fairy/res/components/widgets/vertical_spacing.dart';
import 'package:nanny_fairy/utils/routes/routes_name.dart';

import '../../res/components/colors.dart';

class UploadComunityPost extends StatefulWidget {
  const UploadComunityPost({super.key});

  @override
  State<UploadComunityPost> createState() => _UploadComunityPostState();
}

class _UploadComunityPostState extends State<UploadComunityPost> {
  // popUp
  void showCommunityDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColor.whiteColor,
          shape: const RoundedRectangleBorder(),
          icon: const Icon(Icons.check_circle_outlined,
              color: AppColor.primaryColor, size: 120),
          title: Text(
            'Congratulation you\nupload your product',
            style: GoogleFonts.getFont(
              "Poppins",
              textStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: AppColor.blackColor,
              ),
            ),
          ),
          content: RoundedButton(
            title: 'Continue',
            onpress: () {
              Navigator.pop(context);
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondaryBgColor,
      appBar: AppBar(
        backgroundColor: AppColor.whiteColor,
        elevation: 0.0,
        title: Text(
          'Upload Your Post',
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
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0, left: 16, right: 16),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                height: 783,
                width: double.infinity,
                color: AppColor.whiteColor,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Column(
                    children: [
                      const VerticalSpeacing(16),
                      Text(
                        'Upload Post Image',
                        style: GoogleFonts.getFont(
                          "Poppins",
                          textStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: AppColor.blackColor,
                          ),
                        ),
                      ),
                      const VerticalSpeacing(16),
                      Container(
                        height: 200,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                'https://blog.adoptuskids.org/wp-content/uploads/2019/08/ausk-family-profile-pic-2-620x405.jpg'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      const VerticalSpeacing(16.0),
                      const TextFieldCustom(
                          maxLines: 1, hintText: 'Your title...'),
                      const TextFieldCustom(
                          maxLines: 1, hintText: 'Your content...'),
                      const VerticalSpeacing(30.0),
                      RoundedButton(
                        title: 'Continue',
                        onpress: () {
                          showCommunityDialog(context);
                        },
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
