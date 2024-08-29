// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_fairy/Repository/provider_chat_repository.dart';

import 'package:nanny_fairy/utils/routes/routes_name.dart';
import 'package:nanny_fairy/view/chat/widgets/chatting_widget.dart';
import 'package:nanny_fairy/view/rating/add_rating.dart';

import '../../res/components/colors.dart';
import '../../res/components/rounded_button.dart';
import '../../res/components/widgets/vertical_spacing.dart';

class ChatView extends StatefulWidget {
  final String profilePic;
  final String userName;
  final String familyId;
  final bool isSeen;
  final String currentUserName;
  final String currentUserProfile;
  const ChatView({
    super.key,
    required this.profilePic,
    required this.userName,
    required this.familyId,
    required this.isSeen,
    required this.currentUserName,
    required this.currentUserProfile,
  });

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  ProviderChatRepository providerChatRepository = ProviderChatRepository();
  @override
  void initState() {
    providerChatRepository.updateSeenStatus(true, widget.familyId);
    super.initState();
  }

  final providerId = FirebaseAuth.instance.currentUser!.uid;
  void providerAcceptPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColor.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.check_circle_outline,
                    color: AppColor.primaryColor, size: 100),
                const SizedBox(height: 16),
                Text(
                  'Confirm your acceptance of this hiring offer to begin the service. The family will be notified of your decision.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.getFont(
                    "Poppins",
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColor.blackColor,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: RoundedButton(
                          title: 'Accept',
                          onpress: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: RoundedButton(
                          title: 'Cancel',
                          onpress: () {
                            Navigator.of(context).pop(); // Dismiss the dialog
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
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
        toolbarHeight: 100,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.blue,
                      width: 2,
                    ),
                  ),
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundImage: const NetworkImage(
                          'https://user-images.githubusercontent.com/22866157/40578885-e3bf4e8e-6139-11e8-8be4-92fc3149f6f0.jpg',
                        ), // Set your profile image path here
                        foregroundImage: NetworkImage(
                          widget.profilePic,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: -2,
                        child: Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.green,
                              border: Border.all(
                                width: 2,
                                color: AppColor.primaryColor,
                              ) // Online status indicator color
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12.0),
                Text.rich(
                  TextSpan(
                    text: '${widget.userName}\n',
                    style: GoogleFonts.getFont(
                      "Poppins",
                      textStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColor.whiteColor,
                      ),
                    ),
                    children: [
                      TextSpan(
                        text: 'Online',
                        style: GoogleFonts.getFont(
                          "Poppins",
                          textStyle: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w200,
                            color: AppColor.whiteColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () {
                providerAcceptPopup();
              },
              child: Container(
                height: 26,
                width: 82,
                color: AppColor.whiteColor,
                child: const Center(
                  child: Text(
                    'offer',
                    style: TextStyle(
                      fontSize: 10,
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            // InkWell(
            //   onTap: () {
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) => Rating(
            //                   providerId: providerId,
            //                   familyId: widget.familyId,
            //                   familyProfile: widget.profilePic,
            //                   familyName: widget.userName,
            //                   providerProfile: widget.currentUserProfile,
            //                   providerName: widget.currentUserName,
            //                 )));
            //     // Navigator.pushNamed(context, RoutesName.addRating);
            //   },
            //   child: Container(
            //     height: 26,
            //     width: 82,
            //     color: AppColor.whiteColor,
            //     child: const Center(
            //       child: Text(
            //         'Write Review',
            //         style: TextStyle(
            //           fontSize: 10,
            //           color: AppColor.primaryColor,
            //           fontWeight: FontWeight.w500,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
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
        child: ChatScreenWidget(
          fimalyId: widget.familyId,
          isSeen: widget.isSeen,
          senderName: widget.currentUserName,
          senderProfile: widget.currentUserProfile,
          recieverName: widget.userName,
          recieverProfile: widget.profilePic,
        ),
      ),
    );
  }
}
