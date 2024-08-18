import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanny_fairy/res/components/rounded_button.dart';
import 'package:nanny_fairy/res/components/toggle_widget.dart';
import 'package:nanny_fairy/res/components/widgets/custom_text_field.dart';
import 'package:nanny_fairy/utils/routes/routes_name.dart';
import 'package:nanny_fairy/utils/utils.dart';
import 'package:nanny_fairy/view/home/dashboard/dashboard.dart';
import '../../res/components/colors.dart';
import '../../res/components/widgets/vertical_spacing.dart';
import 'package:http/http.dart' as http;

class PaymentView extends StatefulWidget {
  const PaymentView({
    super.key,
  });

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  bool firstButton = true;
  bool secondButton = false;
  bool thirdButton = false;

  void paymentDonePopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColor.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.check_circle,
                  color: AppColor.primaryColor, size: 150),
              const VerticalSpeacing(16),
              Text(
                'Payment Done Congratulations You\n are subscribed now',
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
                title: 'Continue to Chat',
                onpress: () {
                  Navigator.pushNamed(context, RoutesName.chatView);
                },
              ),
              const VerticalSpeacing(16),
            ],
          ),
        );
      },
    );
  }

  Future<Map<String, String>> getPaymentUrls() async {
    final response = await http.get(Uri.parse(
        'https://us-central1-nanny-fairy.cloudfunctions.net/generatePaymentLinks'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load payment URLs');
    }
  }

  void initiatePaypalCheckout(BuildContext context) async {
    // Replace with your actual domain for successful payments
    // String successUrl =
    //     "https://nanny-fairy-default-rtdb.firebaseio.com/success";
    //
    // // Replace with a dedicated error handling page or redirect
    // String cancelUrl = "https://nanny-fairy-default-rtdb.firebaseio.com/error";

    try {
      final urls = await getPaymentUrls();
      final returnUrl = urls['returnUrl'];
      final cancelUrl = urls['cancelUrl'];
      await Navigator.of(context).push<Map<String, dynamic>>(
        MaterialPageRoute(
          builder: (BuildContext context) => PaypalCheckout(
            sandboxMode: true,
            clientId:
                "ARYGRC3LcGd2zaEJTN8Dman7ZZemJ2Q_Rw8VK_IZ3gPPmRl3XXHcUAgsI3QHhagrMufwfXjxrAegvq4Y",
            secretKey:
                "EIG_TvBPTVeNzFBmhpirGoVavcdxWhc7iiMI85-uFEn505KYJI5US5LN5JYXe0pehdexQqm9zYvUZ_KK",
            returnURL: returnUrl, // Use your custom success URL
            cancelURL: cancelUrl, // Redirect to error handling on cancel
            transactions: const [
              {
                "amount": {
                  "total": '2',
                  "currency": "USD",
                  "details": {
                    "subtotal": '2',
                    "shipping": '0',
                    "shipping_discount": 0
                  }
                },
                "description": "1 Year Subscription",
                "item_list": {
                  "items": [
                    {
                      "name": "1 Year Subscription",
                      "quantity": 1,
                      "price": '2',
                      "currency": "USD"
                    }
                  ],
                }
              }
            ],
            note: "en_US",
            onSuccess: (Map<String, dynamic> params) async {
              Utils.toastMessage('Payment Successful!');
              print("onSuccess: $params");
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => DashBoardScreen()),
              );
            },
            onError: (error) {
              print("onError: $error");
              Utils.flushBarErrorMessage('$error', context);
              Navigator.pop(context);
            },
            onCancel: () {
              Utils.toastMessage('Payment Cancelled.');
              print('cancelled:');
            },
          ),
        ),
      );

      //   if (result != null) {
      //     // Handle additional processing based on successful return from PayPal
      //     print("Payment Result: $result");
      //   }
      // } on PlatformException catch (error) {
      //   print("Platform Exception: $error");
      //   Utils.flushBarErrorMessage(
      //       'An error occurred during PayPal checkout: $error', context);
    } catch (error) {
      print("Unexpected Error: $error");
      Utils.flushBarErrorMessage('An unexpected error occurred.', context);
    }
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
                                      : AppColor.secondaryBgColor,
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                    width: 1,
                                    color: firstButton
                                        ? AppColor.blackColor
                                        : Colors.transparent,
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
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 30.0,
                                      width: 40.0,
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image:
                                                  AssetImage('images/idle.png'),
                                              fit: BoxFit.contain)),
                                    ),
                                    const VerticalSpeacing(5),
                                    Text(
                                      "IDLE",
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
                                      : AppColor.secondaryBgColor,
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                    width: 1,
                                    color: thirdButton
                                        ? AppColor.blackColor
                                        : Colors.transparent,
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
                  hintText: ' Enter Card Number',
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
                      ),
                    ),
                  ],
                ),
                const VerticalSpeacing(16.0),
                const ToggleWidget(title: 'Remeber My Card Details'),
                const VerticalSpeacing(46.0),
                RoundedButton(
                    title: 'Pay',
                    onpress: () {
                      initiatePaypalCheckout(context);
                      // paymentDonePopup(context);
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
