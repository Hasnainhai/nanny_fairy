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
      backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'Upload Your Post',
          style: GoogleFonts.getFont(
            "Poppins",
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: AppColor.whiteColor,
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
              color: AppColor.whiteColor,
            )),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Column(
                  children: [
                    const VerticalSpeacing(25),
                    Container(
                      height: 192,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://blog.adoptuskids.org/wp-content/uploads/2019/08/ausk-family-profile-pic-2-620x405.jpg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: const Center(
                        child: CircleAvatar(
                          backgroundColor: AppColor.primaryColor,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.photo_camera,
                              color: AppColor.whiteColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const VerticalSpeacing(16.0),
                    const TextFieldCustom(
                        maxLines: 1, hintText: 'Your title...'),
                    const SizedBox(
                      height: 140,
                      child: TextFieldCustom(
                          maxLines: 1, hintText: 'Your content...'),
                    ),
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
            ],
          ),
        ),
      ),
    );
  }
}
