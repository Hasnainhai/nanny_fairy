// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../res/components/colors.dart';
import '../../res/components/rounded_button.dart';
import '../../res/components/widgets/custom_text_field.dart';
import '../../res/components/widgets/vertical_spacing.dart';

class Rating extends StatefulWidget {
  const Rating({
    super.key,
  });
  @override
  State<Rating> createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  TextEditingController commentController = TextEditingController();
  double? countRatingStars = 4.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondaryBgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: AppColor.blackColor,
            )),
        title: const Text(
          "Submit Review",
          style: TextStyle(
            fontFamily: 'CenturyGothic',
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: AppColor.blackColor,
          ),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: SingleChildScrollView(
            child: Column(
          children: [
            const VerticalSpeacing(20),
            Card(
              color: AppColor.whiteColor,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 12,
                  right: 12,
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: const NetworkImage(
                          "https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&q=80&w=1587&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),

                      // User Image URL
                    ),
                    const VerticalSpeacing(30),
                    Text(
                      "name",
                      style: const TextStyle(
                        fontFamily: 'CenturyGothic',
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: AppColor.blackColor,
                      ),
                    ),
                    const VerticalSpeacing(25),
                    const Text(
                      "How would you rate the quality of this Products",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'CenturyGothic',
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: AppColor.blackColor,
                      ),
                    ),
                    const VerticalSpeacing(25),
                    RatingBar.builder(
                        initialRating: 4,
                        minRating: 1,
                        allowHalfRating: true,
                        glowColor: Colors.amber,
                        itemCount: 5,
                        itemSize: 55,
                        itemPadding: const EdgeInsets.symmetric(horizontal: 0),
                        itemBuilder: (context, _) => const Icon(
                              Icons.star_rate_rounded,
                              color: Colors.amber,
                            ),
                        onRatingUpdate: (rating) {
                          countRatingStars = rating;
                        }),
                    const VerticalSpeacing(25),
                    TextFieldCustom(
                      controller: commentController,
                      maxLines: 6,
                      hintText: "Additional comments...",
                    ),
                    const VerticalSpeacing(30),
                    RoundedButton(
                        title: 'Submit Review', onpress: ()  {
                          Navigator.pop(context);
                    }),
                    const VerticalSpeacing(40),
                  ],
                ),
              ),
            )
          ],
        )),
      )),
    );
  }
}
