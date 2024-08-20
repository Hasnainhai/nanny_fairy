import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_fairy/res/components/rounded_button.dart';
import 'package:nanny_fairy/res/components/toggle_widget.dart';
import 'package:nanny_fairy/res/components/widgets/custom_text_field.dart';
import 'package:nanny_fairy/utils/routes/routes_name.dart';
import '../../res/components/colors.dart';
import '../../res/components/widgets/vertical_spacing.dart';

class PaymentFamilyView extends StatefulWidget {
  final String profile;
  final String userName;
  final String familyId;
  final String currentUserName;
  final String currentUserProfile;

  const PaymentFamilyView({
    super.key,
    required this.profile,
    required this.userName,
    required this.familyId,
    required this.currentUserName,
    required this.currentUserProfile,
  });

  @override
  State<PaymentFamilyView> createState() => _PaymentFamilyViewState();
}

class _PaymentFamilyViewState extends State<PaymentFamilyView> {
  bool firstButton = true;
  bool secondButton = false;
  bool thirdButton = false;
  void familyPayDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColor.whiteColor,
          shape: const RoundedRectangleBorder(),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.check_circle_outline,
                  color: AppColor.primaryColor, size: 150),
              const VerticalSpeacing(16),
              Text(
                'Congratulations You are\ngood to go',
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
                title: 'Continue to home',
                onpress: () {
                  Navigator.pushNamed(context, RoutesName.dashboardFamily);
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text(
          'Add Payment Details ',
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const VerticalSpeacing(20),
                const Text(
                  'Select Payment Type',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: 'CenturyGothic',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColor.blackColor,
                  ),
                ),
                const VerticalSpeacing(20.0),
                SizedBox(
                  height: 66,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                firstButton = !firstButton;
                                secondButton = false;
                                thirdButton = false;
                              });
                            },
                            child: Center(
                              child: Container(
                                height: 66,
                                width: 135,
                                decoration: BoxDecoration(
                                    color: firstButton
                                        ? AppColor.primaryColor
                                        : Colors.transparent,
                                    border: Border.all(
                                        width: 1,
                                        color: firstButton
                                            ? AppColor.primaryColor
                                            : AppColor.grayColor)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 30.0,
                                      width: 30.0,
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'images/masterCart.png'),
                                              fit: BoxFit.contain)),
                                    ),
                                    const VerticalSpeacing(5),
                                    Text(
                                      "Master Card",
                                      style: TextStyle(
                                          fontFamily: 'CenturyGothic',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: firstButton
                                              ? AppColor.whiteColor
                                              : AppColor.blackColor),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20.0),
                          InkWell(
                            onTap: () {
                              setState(() {
                                firstButton = false;
                                secondButton = !secondButton;
                                thirdButton = false;
                              });
                            },
                            child: Center(
                              child: Container(
                                height: 66,
                                width: 135,
                                decoration: BoxDecoration(
                                  color: secondButton
                                      ? AppColor.primaryColor
                                      : Colors.transparent,
                                  border: Border.all(
                                      width: 1,
                                      color: secondButton
                                          ? AppColor.primaryColor
                                          : AppColor.grayColor),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 30.0,
                                      width: 30.0,
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image:
                                                  AssetImage('images/cash.png'),
                                              fit: BoxFit.contain)),
                                    ),
                                    const VerticalSpeacing(5),
                                    Text(
                                      "Cash On Delivery",
                                      style: TextStyle(
                                        fontFamily: 'CenturyGothic',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: secondButton
                                            ? AppColor.whiteColor
                                            : AppColor.blackColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20.0),
                          InkWell(
                            onTap: () {
                              setState(() {
                                firstButton = false;
                                secondButton = false;
                                thirdButton = !thirdButton;
                              });
                            },
                            child: Center(
                              child: Container(
                                height: 66,
                                width: 135,
                                decoration: BoxDecoration(
                                  color: thirdButton
                                      ? AppColor.primaryColor
                                      : Colors.transparent,
                                  border: Border.all(
                                      width: 1,
                                      color: thirdButton
                                          ? AppColor.primaryColor
                                          : AppColor.grayColor),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 30.0,
                                      width: 30.0,
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'images/paypal.png'),
                                              fit: BoxFit.contain)),
                                    ),
                                    const VerticalSpeacing(5),
                                    Text(
                                      "Paypal",
                                      style: TextStyle(
                                        fontFamily: 'CenturyGothic',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: thirdButton
                                            ? AppColor.whiteColor
                                            : AppColor.blackColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const VerticalSpeacing(30),
                const TextFieldCustom(
                  maxLines: 1,
                  hintText: 'Card Name',
                ),
                const TextFieldCustom(
                  maxLines: 1,
                  hintText: 'Card Number',
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: TextFieldCustom(
                      maxLines: 1,
                      hintText: 'Expiration Date',
                    )),
                    SizedBox(width: 10.0),
                    Expanded(
                        child: TextFieldCustom(
                      maxLines: 1,
                      hintText: 'CVV',
                    )),
                  ],
                ),
                const VerticalSpeacing(16.0),
                const ToggleWidget(title: 'Remeber My Card Details'),
                const VerticalSpeacing(46.0),
                RoundedButton(
                    title: 'Pay',
                    onpress: () {
                      familyPayDialog(context);
                      // Navigator.pop(context);
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
