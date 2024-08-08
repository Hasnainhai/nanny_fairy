import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_fairy/res/components/rounded_button.dart';
import 'package:nanny_fairy/res/components/widgets/custom_text_field.dart';
import 'package:nanny_fairy/res/components/widgets/vertical_spacing.dart';

import '../../../res/components/colors.dart';

class CommunityDetailViewFamily extends StatelessWidget {
  const CommunityDetailViewFamily({super.key, required this.img, required this.title, required this.subtitle});
  final String img;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text(
          'Blogs',
          style: TextStyle(
            fontFamily: 'CenturyGothic',
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: AppColor.blackColor,
          ),
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: AppColor.blackColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 16.0, right: 16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 300,
                width: double.infinity,
                decoration:  BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        img),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const VerticalSpeacing(20.0),
               Text(
                title,
                style: TextStyle(
                  fontFamily: 'CenturyGothic',
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: AppColor.blackColor,
                ),
              ),
              Text(
                subtitle,
                style: GoogleFonts.getFont(
                  "Poppins",
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColor.grayColor,
                  ),
                ),
              ),
              const VerticalSpeacing(16),
              const Text(
                'Leave a comment',
                style: TextStyle(
                  fontFamily: 'CenturyGothic',
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: AppColor.blackColor,
                ),
              ),
              const TextFieldCustom(
                  maxLines: 1, hintText: 'type comment'),
              const VerticalSpeacing(16),
              RoundedButton(
                  title: 'Post',
                  onpress: () {
                    Navigator.pop(context);
                  }),
              const VerticalSpeacing(16),
            ],
          ),
        ),
      ),
    );
  }
}
