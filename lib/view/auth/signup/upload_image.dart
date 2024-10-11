import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_fairy/ViewModel/auth_view_model.dart';
import 'package:nanny_fairy/res/components/rounded_button.dart';
import 'package:nanny_fairy/res/components/widgets/image_picker.dart';
import 'package:nanny_fairy/res/components/widgets/vertical_spacing.dart';
import 'package:nanny_fairy/utils/utils.dart';
import 'package:provider/provider.dart';
import '../../../res/components/colors.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({super.key});

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  TextEditingController bioController = TextEditingController();
  File? profilePic;
  void pickProfile() async {
    File? img = await pickFrontImg(
      context,
    );
    setState(
      () {
        profilePic = img;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);

    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColor.whiteColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
              ),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VerticalSpeacing(MediaQuery.of(context).size.height * 0.5),
                    Text(
                      'Write an introduction to yourself',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.getFont(
                        "Poppins",
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColor.blackColor,
                        ),
                      ),
                    ),
                    const VerticalSpeacing(10),
                    Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColor.whiteColor,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: const Color(0xff1B81BC).withOpacity(
                              0.10), // Stroke color with 10% opacity
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xff1B81BC).withOpacity(
                                0.1), // Drop shadow color with 4% opacity
                            blurRadius: 2,
                            offset: const Offset(1, 2),
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: TextField(
                          maxLines: 10,
                          controller: bioController,
                          decoration: const InputDecoration(
                            hintText: 'Type...',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    const VerticalSpeacing(40),
                    RoundedButton(
                        title: 'Continue',
                        onpress: () {
                          if (bioController.text.isNotEmpty) {
                            authViewModel.saveProfileAndBio(
                                context, profilePic, bioController.text);
                          } else {
                            Utils.flushBarErrorMessage(
                                "Please Enter Image", context);
                          }
                        }),
                  ],
                ),
              ),
            ),
          ),
          // Top container that acts as AppBar
          Container(
            color: AppColor.primaryColor,
            height: 250, // Adjust the height to accommodate the avatar overlap
            child: Column(
              children: [
                const SizedBox(height: 50), // Adjust to add padding at the top
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.west,
                        color: AppColor.whiteColor,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(width: 50),
                    Text(
                      'Upload Image',
                      style: GoogleFonts.getFont(
                        "Poppins",
                        textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: AppColor.whiteColor,
                        ),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ],
            ),
          ),
          // Positioned CircleAvatar on top of all
          Positioned(
            top: 190, // Half of the avatar height to position it correctly
            left:
                MediaQuery.of(context).size.width / 2 - 60, // Center the avatar
            child: Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                  color: AppColor.avatarColor,
                  borderRadius: BorderRadius.circular(60),
                  border: Border.all(width: 4, color: AppColor.whiteColor)),
              child: Center(
                child: profilePic == null
                    ? Image.asset(
                        'images/profile.png',
                        fit: BoxFit.cover,
                        color: AppColor.whiteColor,
                      )
                    : Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          image: DecorationImage(
                            image: FileImage(
                              profilePic!,
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
              ),
            ),
          ),
          Positioned(
            top: 280,
            left: MediaQuery.of(context).size.width / 2 - 35,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: AppColor.primaryColor),
                  child: Center(
                    child: IconButton(
                      onPressed: () {
                        pickProfile();
                      },
                      icon: const Icon(
                        Icons.camera_alt_outlined,
                        size: 18,
                        color: AppColor.whiteColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 5.0),
                Container(
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: AppColor.primaryColor),
                  child: Center(
                    child: IconButton(
                      onPressed: () {
                        pickProfile();
                      },
                      icon: const Icon(
                        Icons.save_as_outlined,
                        size: 18,
                        color: AppColor.whiteColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
