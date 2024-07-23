import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_fairy/res/components/rounded_button.dart';
import 'package:nanny_fairy/res/components/widgets/vertical_spacing.dart';
import 'package:nanny_fairy/utils/routes/routes_name.dart';
import '../../../res/components/colors.dart';
import '../../../res/components/widgets/card_button.dart';

class BookingCartWidget extends StatefulWidget {
  const BookingCartWidget(
      {super.key, required this.primaryButtonTxt, required this.ontapView});
  final Function() ontapView;
  final String primaryButtonTxt;

  @override
  State<BookingCartWidget> createState() => _BookingCartWidgetState();
}

class _BookingCartWidgetState extends State<BookingCartWidget> {
  // popUp
  void showSubscribtionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColor.whiteColor,
          shape: const RoundedRectangleBorder(),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'images/popImg.png',
                width: 150,
                height: 150,
              ),
              const VerticalSpeacing(16),
              Text(
                'Agree to Subscription of\n€2/month',
                textAlign: TextAlign.center,
                style: GoogleFonts.getFont(
                  "Poppins",
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: AppColor.blackColor,
                  ),
                ),
              ),
              const VerticalSpeacing(30),
              RoundedButton(
                title: 'Subscribe and Chat',
                onpress: () {
                  Navigator.pushNamed(context, RoutesName.paymentView);
                },
              ),
              const VerticalSpeacing(16),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        height: 99,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.circular(10.0),
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
        child: Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 79,
                    width: 79,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      image: const DecorationImage(
                        image: NetworkImage(
                            'https://www.shutterstock.com/image-photo/family-selfie-portrait-grandparents-children-260nw-2352440117.jpg'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hassnain\nFamily',
                        style: GoogleFonts.getFont(
                          "Poppins",
                          textStyle: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColor.blackColor,
                          ),
                        ),
                      ),
                      Text(
                        '⭐4.8(45 Reviews)',
                        style: GoogleFonts.getFont(
                          "Poppins",
                          textStyle: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            color: AppColor.blackColor,
                          ),
                        ),
                      ),
                      const VerticalSpeacing(10),
                      Row(
                        children: [
                          CardButton(
                            title: 'Clenining',
                            color: AppColor.avatarColor,
                            onTap: () {},
                          ),
                          const SizedBox(width: 6),
                          CardButton(
                            title: 'Care',
                            color: AppColor.avatarColor,
                            onTap: () {},
                          ),
                          const SizedBox(width: 6),
                          CardButton(
                            title: 'Home',
                            color: AppColor.avatarColor,
                            onTap: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                  CardButton(
                    title: widget.primaryButtonTxt,
                    color: AppColor.primaryColor,
                    onTap: () {
                      widget.ontapView();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
