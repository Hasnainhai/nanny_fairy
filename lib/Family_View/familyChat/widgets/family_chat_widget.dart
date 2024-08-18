// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:nanny_fairy/utils/routes/routes_name.dart';

import '../../../res/components/colors.dart';

class FamilyChatWidget extends StatefulWidget {
  String senderName;
  String senderProfiel;
  String providerId;
  String timesend;
  String text;
  FamilyChatWidget({
    super.key,
    required this.senderName,
    required this.senderProfiel,
    required this.providerId,
    required this.timesend,
    required this.text,
  });

  @override
  State<FamilyChatWidget> createState() => _FamilyChatWidgetState();
}

class _FamilyChatWidgetState extends State<FamilyChatWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, RoutesName.chatView);
        },
        child: Container(
          height: 93,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColor.whiteColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              strokeAlign: BorderSide.strokeAlignCenter,
              color: const Color(0xff1B81BC)
                  .withOpacity(0.10), // Stroke color with 10% opacity
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xff1B81BC)
                    .withOpacity(0.1), // Drop shadow color with 4% opacity
                blurRadius: 2,
                offset: const Offset(1, 2),
                spreadRadius: 1,
              ),
            ],
          ),
          child: ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(widget.senderProfiel),
            ),
            title: Text(
              widget.senderName,
              style: GoogleFonts.getFont(
                "Poppins",
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColor.blackColor,
                ),
              ),
            ),
            subtitle: SizedBox(
              width: 30,
              child: Text(
                widget.text,
                style: GoogleFonts.getFont(
                  "Poppins",
                  textStyle: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColor.grayColor,
                  ),
                ),
              ),
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.timesend,
                  style: GoogleFonts.getFont(
                    "Poppins",
                    textStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColor.blackColor,
                    ),
                  ),
                ),
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: AppColor.primaryColor),
                  child: Center(
                    child: Text(
                      '2',
                      style: GoogleFonts.getFont(
                        "Poppins",
                        textStyle: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColor.whiteColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
